library(party)
Training.Data<-read.table("/Users/Ravi/Documents/Data Mining/Assignments/Assignment_6/trainingData.txt",header=T,sep="\t") 
Test.Data<-read.table("/Users/Ravi/Documents/Data Mining/Assignments/Assignment_6/TestData_Insurance.txt",header=T,sep="\t") 

myFormula <- Number_of_mobile_home_policies ~ Customer_Subtype_see_L0__ + 
  Number_of_houses + Avg_size_household + Avg_age_see_L1 + 
  Customer_main_type_see + Roman_catholic_see_L3__ + Protestant + 
  Other_religion____ + No_religion____ + Married_____ + Living_together____ + 
  Other_relation____ + Singles_____ + Household_without_children___ + 
  Household_with_children___ + High_level_education___ + Medium_level_education___ + 
  Lower_level_education___ + High_status____ + Entrepreneur_____ + 
  Farmer_____ + Middle_management____ + Skilled_labourers____ + 
  Unskilled_labourers____ + Social_class_A___ + Social_class_B1___
  


iris_ctree <- ctree(myFormula, data = Training.Data)

# check the prediction

#table(predict(iris_ctree), Training.Data$Number_of_mobile_home_policies)

print(iris_ctree)
plot(iris_ctree, type = "simple")

predicted <- predict(iris_ctree, newdata = Test.Data)
Class<-ifelse(predicted < 0.05, 0, 1)
#print(Class)
