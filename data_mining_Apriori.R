#loading library aruples
#install.packages("arules");
#install.packages("arulesViz");
library(arules);
library(arulesViz);
transactionData<-read.transactions("/Users/Ravi/Documents/Data Mining/Assignments/transactions.txt",sep=",")
# display Sample DATA
print("Sample Transaction DATA")
inspect(transactionData[1:10])
# Displaying Frequency Count
itemFrequencyPlot(transactionData,type="absolute",topN=15)
# Get all rules applying apriori with support = 0.1 % confidence  = 75 %
all_rules <- apriori(transactionData, parameter = list(supp = 0.015, conf = 0.75))
# all rules will have list of the rules which is found by apriori algorithms
# first 10 rules
inspect(all_rules[1:10])
#sorting rules based on confidece which will letter help us to remove redundant rules
all_rules<-sort(all_rules, by="confidence", decreasing=TRUE)
#top rules 10 with high confidence 
print("top rules 10 with high confidence ")
inspect(all_rules[1:10])
#To find redundant rules, first find all the subsets by using is.subset function
subSetOfRules<- is.subset(all_rules, all_rules)
#set lower triangle to NA as upper triangle is sufficiant for each pair
subSetOfRules[lower.tri(subSetOfRules, diag=T)] <- NA
#taking sum of the column for redundant rules
redundantRules <- colSums(subSetOfRules, na.rm=T) >= 1
#redundant rules
AllredundantRules<-all_rules[redundantRules]
#display all redundant rules . ..
print("--------------Redundant rules-------------")
inspect(AllredundantRules)
#removing redundant rules
finalRules <- all_rules[!redundantRules]
#display all final rules
print("-------------final rules-------------")
inspect(finalRules)

#display graph of rules
#lot(finalRules)
plot(finalRules,method="graph")
plot(finalRules, method="paracoord", control=list(reorder=TRUE))
plot(finalRules, method="graph", control=list(type="items"))

