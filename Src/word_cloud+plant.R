install.packages("wordcloud")
library(wordcloud)
library(showtext)

# 提取数据
library(readxl)
library(readr)  # 使用 parse_number
df <- read_excel("Data/Q_Rversion.xlsx", sheet = "Sheet1", col_names = FALSE)

# 提取作物数据
crop_start <- 5
crops <- data.frame(
  crop = df[[1]][crop_start:nrow(df)],
  count = parse_number(df[[2]][crop_start:nrow(df)])  # 更稳妥
)
crops <- na.omit(crops)  # 删除 NA 行

# 中文字体支持
showtext_auto()

 png("Plot/crop_wordcloud.png", width = 800, height = 600)
wordcloud(words = crops$crop, freq = crops$count,
          scale = c(4, 0.8), min.freq = 1,
          colors = brewer.pal(8, "Dark2"), random.order = FALSE)
dev.off()
