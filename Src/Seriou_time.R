library(ggplot2)
library(scales)

years <- 2016:2025
degradation <- c(0, 0, 0.06, 0.05, 0.09, 0.10, 0.09, 0.08, 0.07, 0.02)
df_line <- data.frame(year = years, degradation = degradation)

ggplot(df_line, aes(x = year, y = degradation, color = degradation)) +
  geom_line(size = 1.5) +
  geom_point(size = 3) +
  scale_color_gradient(low = "#FFC1C1", high = "#FF0000", limits = c(0, 0.15)) +
  scale_y_continuous(limits = c(0, 0.15), labels = percent_format(accuracy = 1)) +
  scale_x_continuous(breaks = years) +   # 这一行，让每个年份都出现
  labs(title = "西瓜红种质退化趋势 (2016-2025)",
       x = "年份",
       y = "退化程度（百分比）",
       color = "退化程度") +
  theme_minimal() +
  geom_text(aes(label = ifelse(year %in% c(2016,2018,2024,2025),
                               paste0(round(degradation*100),"%"), "")),
            vjust = -1.2, size = 4, color = "darkred")
