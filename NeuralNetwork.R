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
#printing graph of the accuracy
fourfoldplot(accuracy, color = c("#CC6666", "#99CC99"), conf.level = 0, margin = 1, main = "Confusion Matrix")
mosaicplot(accuracy, main = "Accuracy", color = TRUE)

#applying model on the Test Data
TestResult<-predict(model, Test.Data, type="class")
print(TestResult)

#plotting model this function requires clusterGeneration and devtools library
plot.nnet(model)



 