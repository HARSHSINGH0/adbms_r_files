library(e1071)
library(MASS)
library(klaR)
library(lattice)
library(ggplot2)
library("caret")


data(iris)

head(iris)

unique(iris$Species)

pairs(iris[1:4],main="Iris Data(red=satosa,green=versicolor,blue=verginica)",
      pch=21,bg=c("red","green3","blue")[unclass(iris$Species)])

index= sample(nrow(iris),floor(nrow(iris)+0.7))
train = iris[index,]
test=iris[-index,]

xtrain=train[,-5]
ytrain=train$Species

xtest=test[,-5]
ytest=test$Species

model=train(xtrain,ytrain,'nb',trControl=trainControl(method='cv',number = 10))

model

prop.table(table(predict(model$finalModel,xtest)$class,ytest))


