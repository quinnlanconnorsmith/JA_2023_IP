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
ggplot(data=camp_diet_final, aes(x="",y= rel_percent, fill = diet_comp2))+
  geom_bar(stat="identity", width=1)+ 
  coord_polar("y", start=0) +
  theme_void() + 
  facet_wrap(~basin)


+
  facet_grid(~year) +
  theme(panel.grid.major = element_blank(), panel.grid.minor = element_blank(), axis.title=element_text(size=16), axis.text=element_text(size=12),
        panel.background = element_blank(), axis.line = element_line(colour = "black"))+
  scale_fill_grey(start=0.9, end=0.2)+ 
  xlab("State of Lake") + ylab("Daily Probability") + labs(fill= "Action")


#8/2/2023 Code


basin_labs <- c("Reference", "Treatment")
names(basin_labs) <- c("R", "T")


#IMPORT camp_diet_final
#All categories 
ggplot(data=camp_diet_final, aes(x="",y= rel_percent, fill = diet_comp))+
  geom_bar(stat="identity", width=1)+ 
  coord_polar("y", start=0) +
  theme_void() + 
  facet_wrap(~basin, labeller = labeller(basin=basin_labs)) + 
  ggtitle("All the bogus - as fine scale as we can get") 
 

#Broad categories
ggplot(data=camp_diet_final, aes(x="",y= rel_percent, fill = diet_comp2))+
  geom_bar(stat="identity", width=1)+ 
  coord_polar("y", start=0) +
  theme_void() + 
  facet_wrap(~basin, labeller = labeller(basin=basin_labs)) + 
  ggtitle("Broad categories") +
  guides(fill=guide_legend(title="Diet Item")) +
  scale_fill_manual(labels = c("Aquatic Invertebrates", "Fish", "Plastic", "Terrestrial Invertebrates", "Terrestiral Vertebrates"), values = c("#999999", "#56B4E9","#009E73", "#D55E00", "black")) 


#IMPORT camp_diet_JA_simple
#The simple dataset- this will remove lines in pie chart 
#Only pie chart where percentages can be imposed, however it's messy 
#Probably easier to add percentages in ppt with arrows going from the real small ones 
ggplot(data=camp_diet_JA_simple, aes(x="",y= rel_percent, fill = diet_comp2))+
  geom_bar(stat="identity", width=1)+ 
  coord_polar("y", start=0) +
  theme_void() + 
  facet_wrap(~basin, labeller = labeller(basin=basin_labs)) + 
  ggtitle("Simple dataset - only contains diet_comp2") +
  geom_text(aes(label = rel_percent),
            position = position_stack(vjust = 0.5)) +
  guides(fill=guide_legend(title="Diet Item")) +
  scale_fill_manual(labels = c("Aquatic Invertebrates", "Fish", "Plastic", "Terrestrial Invertebrates", "Terrestiral Vertebrates"), values = c("#999999", "#56B4E9","#009E73", "#D55E00", "black")) 

#IMPORT camp_diet_JA_june
#Just june data 
#NOTE - no plastic in june, so manual fill is different 
ggplot(data=camp_diet_JA_june, aes(x="",y= rel_percent, fill = diet_comp2))+
  geom_bar(stat="identity", width=1)+ 
  coord_polar("y", start=0) +
  theme_void() + 
  facet_wrap(~basin, labeller = labeller(basin=basin_labs)) + 
  ggtitle("June Diet Comp") +
  guides(fill=guide_legend(title="Diet Item")) +
  scale_fill_manual(labels = c("Aquatic Invertebrates", "Fish", "Terrestrial Invertebrates", "Terrestiral Vertebrates"), values = c("#999999", "#56B4E9", "#D55E00", "black")) 


#IMPORT camp_diet_JA_july
#July data
ggplot(data=camp_diet_JA_july, aes(x="",y= rel_percent, fill = diet_comp2))+
  geom_bar(stat="identity", width=1)+ 
  coord_polar("y", start=0) +
  theme_void() + 
  facet_wrap(~basin, labeller = labeller(basin=basin_labs)) +  
  ggtitle("July Data Comp") +
  guides(fill=guide_legend(title="Diet Item")) +
  scale_fill_manual(labels = c("Aquatic Invertebrates", "Fish", "Plastic", "Terrestrial Invertebrates", "Terrestiral Vertebrates"), values = c("#999999", "#56B4E9","#009E73", "#D55E00", "black")) 

#Stats
#Stats are for entire summer, not month specific 

a_invert_T <- camp_diet_JA_stats$a_invert_T
a_invert_R <- camp_diet_JA_stats$a_invert_R

t.test(a_invert_R,a_invert_T)
#data:  a_vert_R and a_vert_T
#t = 1.5119, df = 8, p-value = 0.169
#Low a_vert sample size, diet comp is not statistically different between basins 

fish_T <- camp_diet_JA_stats$fish_T
fish_R <- camp_diet_JA_stats$fish_R

t.test(fish_T,fish_R)
#data:  fish_T and fish_R
#t = 0.57824, df = 48.23, p-value = 0.5658
#Fish diet comp not statistically different between basins 

#Can't run plastic stats because we only have 1 

t_invert_T <- camp_diet_JA_stats$t_invert_T
t_invert_R <- camp_diet_JA_stats$t_invert_R

t.test(t_invert_T,t_invert_R)
#data:  t_invert_T and t_invert_R
#t = 0.42955, df = 4.5778, p-value = 0.687
#terrestrial invert diet comp not statistically different between basins 

#Can't run terrestiral vert stats becasue only 1 obsercation in Treatment 
