boxplot.theme = theme(axis.text = element_text(size=28, color="black"), 
                      axis.title=element_text(size=30, color="black"),
                      plot.title=element_text(size=38, margin=margin(0,0,20,0)),
                      panel.grid.major.x = element_blank(), 
                      plot.margin=unit(c(0.1,0.25,0.5,0.85), "cm"), 
                      axis.title.y=element_text(margin=margin(0,15,0,0)), 
                      panel.border = element_blank(), 
                      axis.ticks=element_blank(), 
                      legend.title = element_text(size=28), 
                      legend.text=element_text(size=20), 
                      panel.background=element_blank(), 
                      panel.grid.major=element_blank(), 
                      axis.line.x = element_line(color="black", size = 1),
                      axis.line.y = element_line(color="black", size = 1))


#Code for the actual graph.
dev.new(units="px", width=1200, height=1020, noRStudioGD = TRUE)
png("ripe fruits per node year by treatment.png", width=1200, height=1020, res=133)
ggplot(chapter2,aes(x = YEAR,y = RIPE.BUD, fill = TREAT)) + 
  stat_boxplot(geom = "errorbar",position = position_dodge(1),lwd = 1.75) +
  geom_boxplot(position = position_dodge(1),lwd = 1.75,fatten = 1.25,show.legend = FALSE, outlier.size = 3) + 
  scale_fill_manual(values = c("dim gray", "ivory3")) + 
  scale_x_discrete(labels = c('2013','2014','2015')) +
  ylab("Ripe fruits per node") + xlab("") + labs(title="") + 
  boxplot.theme + scale_y_continuous(limits=c(0,4)) +
  annotate("text", x=0.6, y=4, label = "c)", size=12, hjust=1, vjust=1) + 
  annotate("text", x=1.375, y=0, label = "***", size=12, hjust=1, vjust=1) + 
  annotate("text", x=3.32, y=0, label = "**", size=12, hjust=1, vjust=1)
dev.off()
