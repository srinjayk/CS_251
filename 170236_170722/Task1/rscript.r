library(ggplot2)
t=read.csv("result.csv")

plot1_bar<-ggplot(t)+geom_col(aes(x=Line_number,y=Bias,fill=Input_number),color="white")+ facet_grid(Input_number ~ .)
ggsave("plot1_bar.png")

plot1_line<-ggplot(t)+geom_line(aes(x=Line_number,y=Bias,color = Input_number))+ facet_grid(Input_number ~ .)
ggsave("plot1_line.png")