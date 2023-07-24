#Testing diet goodies 
library(ggplot2)
#Example code 

Allfish <- data.frame(year=c("2017","2017","2017","2018","2018","2018", "2019", "2019", "2019","2017","2017","2017","2017","2017","2017","2018","2018","2018","2018","2018","2018","2019", "2019", "2019","2019", "2019", "2019"), 
                      state=factor(c("CWH","Offshore","Nearshore")),
                      totalprob = c(100),
                      prob = c(77,19,88,70,56,85,51,51,72,1,50,7,22,31,5,6,38,7,24,6,8,10,41,11,39,8,17),
                     action = factor(c("Remain","Remain","Remain","Remain","Remain","Remain","Remain","Remain","Remain","Leave to Offshore","Leave to Nearshore","Leave to CWH","Leave to Nearshore","Leave to CWH","Leave to Offshore","Leave to Offshore","Leave to Nearshore","Leave to CWH","Leave to Nearshore","Leave to CWH","Leave to Offshore","Leave to Offshore","Leave to Nearshore","Leave to CWH","Leave to Nearshore","Leave to CWH","Leave to Offshore")))
ggplot(data=Allfish, aes(x=state,y= prob, fill = action))+
  geom_bar(position="stack", stat="identity") +
  facet_grid(~year) +
  theme(panel.grid.major = element_blank(), panel.grid.minor = element_blank(), axis.title=element_text(size=16), axis.text=element_text(size=12),
        panel.background = element_blank(), axis.line = element_line(colour = "black"))+
  scale_fill_grey(start=0.9, end=0.2)+ 
  xlab("State of Lake") + ylab("Daily Probability") + labs(fill= "Action")

#Actual code 

#Full number 
ggplot(data=actual_camp_diet, aes(x=basin,y= diet_count, fill = diet_comp))+
  geom_bar(position="stack", stat="identity")

#As a percent 
ggplot(data=actual_camp_diet, aes(x=basin,y= rel_percent, fill = diet_comp2))+
  geom_bar(position="stack", stat="identity")

#Facet wrap by size (less than 305 = small )
ggplot(data=actual_camp_diet, aes(x=basin,y= rel_percent, fill = diet_comp))+
  geom_bar(position="stack", stat="identity") + 
  facet_grid(~size)

#Fooling around with pie charts 
ggplot(data=actual_camp_diet, aes(x="",y= rel_percent, fill = diet_comp2))+
  geom_bar(stat="identity", width=1)+ 
  coord_polar("y", start=0) +
  theme_void() + 
  facet_grid(~basin)


+
  facet_grid(~year) +
  theme(panel.grid.major = element_blank(), panel.grid.minor = element_blank(), axis.title=element_text(size=16), axis.text=element_text(size=12),
        panel.background = element_blank(), axis.line = element_line(colour = "black"))+
  scale_fill_grey(start=0.9, end=0.2)+ 
  xlab("State of Lake") + ylab("Daily Probability") + labs(fill= "Action")