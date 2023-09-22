# 安装和加载fmsb包
#install.packages("fmsb")
library(fmsb)

# 加载ggradar包
# install.packages("devtools")
# devtools::install_github("ricardo-bion/ggradar")
library(ggradar)

# 安装和加载patchwork包
#install.packages("patchwork")
library(patchwork)

# 你的数据（这是我根据你的描述假设的，你应该用你实际的数据替换它）
data <- read.table("/Users/qilianfan/Desktop/SMTD/20230725/class_merged.csv", header = TRUE, sep = ",")

# 创建一个列表用于存放每个组的雷达图
plots_list <- list()

# 依次取出每个组的数据并绘制雷达图
for (group in unique(data$Group)) {
  group_data <- data[data$Group == group, ]
  
  # 将数据转置
  group_data_t <- as.data.frame(t(group_data[, c("Sensitivity", "Precision", "F1")]))
  colnames(group_data_t) <- group_data$Sample
  
  # 添加最小值和最大值的行，这是为了创建雷达图的范围
  group_data_t <- rbind(rep(0, ncol(group_data_t)),  rep(1, ncol(group_data_t)),group_data_t)
  
  # 修改行名
  rownames(group_data_t) <- c("Min", "Max", "Sensitivity", "Precision", "F1")
  
  # 将行名转为一列
  group_data_t2 <- cbind(Metric = rownames(group_data_t), group_data_t)
  
  # 查看新数据
  print(group_data_t2)
  group_data <- group_data_t2[3:5, ]
  radar_plot <- ggradar(group_data,
                        group.line.width = 1, 
                        group.point.size = 3,
                        legend.position = "bottom") + labs(title = paste0("Group: ", group))
  
  # 将雷达图添加到列表中
  plots_list[[group]] <- radar_plot
}

# 使用patchwork将所有雷达图组合在一起
combined_plot <- wrap_plots(plots_list, ncol = 3)
print(combined_plot)
