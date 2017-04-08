
#install.packages("e1071");
library(e1071); 

#Loading Training Data
Training.Data<-read.table("/Users/Ravi/Documents/Data Mining/Assignments/Assignment_7/data/trainingData.txt",header=T,sep="\t") 

#Loading Test Data
Test.Data<-read.table("/Users/Ravi/Documents/Data Mining/Assignments/Assignment_7/data/TestData_Insurance.txt",header=T,sep="\t") 

#creading navive Bayes Model with important attributes (removed trivial attributes for accuracy)
model <- naiveBayes(as.factor(Number_of_mobile_home_policies) ~Customer_Subtype_see_L0__ +
                      Number_of_houses + Avg_size_household + Avg_age_see_L1 +
                      Customer_main_type_see + Roman_catholic_see_L3__ + Protestant +
                      Other_religion____ + No_religion____ + Married_____ + Living_together____ +
                      Other_relation____ + Singles_____ + Household_without_children___ +
                      Household_with_children___ + High_level_education___ +
                      Medium_level_education___ +
                      Lower_level_education___ + High_status____ + Entrepreneur_____ +
                      Farmer_____ + Middle_management____ + Skilled_labourers____ +
                      Unskilled_labourers____ + Social_class_A___ , data = Training.Data);

#Testing model on Training Data
predicted<-predict(model, Training.Data[,-86]);
print(predicted);

#Showing contigency Table to see accuracy of the model  
accuracy<-table(predicted, Training.Data$Number_of_mobile_home_policies);
print(accuracy)
#printing graph of the accuracy
fourfoldplot(accuracy, color = c("#CC6666", "#99CC99"), conf.level = 0, margin = 1, main = "Confusion Matrix")
mosaicplot(accuracy, main = "Accuracy", color = TRUE)


#Testing model on Test data
Predicted.Test<-predict(model, Test.Data);
print(Predicted.Test)


