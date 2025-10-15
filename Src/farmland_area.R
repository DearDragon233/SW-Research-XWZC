library(ggplot2)
library(readxl)

# 创建输出文件夹
dir.create("Plot", showWarnings = FALSE)

# 读取数据
df <- read_excel("Data/Q_Rversion.xlsx", sheet = "Sheet1", col_names = FALSE)

# 提取耕地面积信息（第1-2行）
print(df[[2]][2])  
print(df[[2]][3])  

land_area <- data.frame(
  type = c(df[[1]][2], df[[1]][3]),
  count = as.numeric(c(df[[2]][2], df[[2]][3]))
)

# 绘图
p1 <- ggplot(land_area, aes(x = type, y = count, fill = type)) +
  geom_col(width = 0.4, show.legend = FALSE) +
  labs(title = "耕地面积分类", x = "耕地面积", y = "人数") +
  theme_minimal(base_size = 14)
p1
# 保存
ggsave("Plot/耕地面积分类.png", p1, width = 6, height = 4)
