library(ggplot2)

data <- read.table("data.txt", sep =";", stringsAsFactors = FALSE, header = TRUE)
data$server <- factor(data$server, levels = c("digitalocean", "vultr", "mac mini", "vliz ssd", "vliz hdd", "santander"))
colors <- c("#33a02c", "#b2df8a", "#1f78b4", "#a6cee3", "#fdbf6f", "#cc3300")

ggplot(data = data, aes(x = benchmark, y = iops, fill = server)) + 
  geom_bar(stat = "identity", position = position_dodge(width = 0.5), width = 0.5) +
  scale_fill_manual(values = colors) +
  ggtitle("--bs=4k --iodepth=64 --size=4G")