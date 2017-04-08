library(nnet) 
#Loading Training Data
Training.Data<-read.table("/Users/Ravi/Documents/Data Mining/Assignments/Assignment_7/data/trainingData.txt",header=T,sep="\t") 

#Loading Test Data
Test.Data<-read.table("/Users/Ravi/Documents/Data Mining/Assignments/Assignment_7/data/TestData_Insurance.txt",header=T,sep="\t") 

# Defining Class Attribute - Number_of_mobile_home_policies
class_label <- class.ind(Training.Data$Number_of_mobile_home_policies)

#creating  Neural Network 
model = nnet(Training.Data, class_label , size=10, softmax=TRUE)

#Checking accuracy of the model
accuracy<-table(predict(model,Training.Data, type="class"),Training.Data$Number_of_mobile_home_policies)
print(accuracy)

#applying model on the Test Data
TestResult<-predict(model, Test.Data, type="class")
print(TestResult)





 