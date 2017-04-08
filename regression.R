Training.Data<-read.table("/Users/Ravi/Documents/Data Mining/Assignments/Assignment_6/newData12.txt",header=T,sep=" ") 
Test.Data<-read.table("/Users/Ravi/Documents/Data Mining/Assignments/Assignment_6/testData12.txt",header=T,sep=" ")
lm.out=lm(Median_home_price~Year,data=Training.Data)
summary(lm.out);
plot(lm.out);
plot(Median_home_price~Year, data=Training.Data, main=" plot")
abline(lm.out, col="red")
next_year <- predict(lm.out, newdata = Test.Data)

data<-c(Test.Data,next_year)

print(data)