library(ggplot2)
t=read.csv("result.csv")

plot2<-ggplot(t,aes(Function2,time_spent_in_function2,fill=Function1),binwidth=10)+geom_col(color="black")+facet_grid(Function1~.)
ggsave("plot2.png",width=18,height=6)