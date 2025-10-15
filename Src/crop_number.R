library(ggplot2)

df <- data.frame(
  crop = c("红薯", "玉米", "花生", "旱稻", "葱"),
  value = c(39, 33, 18, 6, 3)
)

my_colors <- c("红薯" = "#D73027", "玉米" = "#FDAE61", "花生" = "#ABD9E9", "旱稻" = "#4575B4", "葱" = "#66BD63")

ggplot(df, aes(x = "", y = value, fill = crop)) +
  geom_bar(stat = "identity", width = 1, color = "white") +
  coord_polar(theta = "y") +
  geom_text(aes(label = paste0(crop, "\n", round(value / sum(value) * 100, 1), "%")),
            position = position_stack(vjust = 0.5), color = "black", size = 4) +
  scale_fill_manual(values = my_colors) +
  theme_void() +
  labs(title = "主要种植作物比例", fill = "作物种类") +
  theme(plot.title = element_text(hjust = 0.5, size = 20, face = "bold"),
        legend.position = "right")
