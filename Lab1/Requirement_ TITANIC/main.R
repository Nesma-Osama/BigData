# 1-Cleaning the working directory
rm(list=ls())
#--------------------------------------------------------------------
# 2- Read dataset
data=read.csv("Requirement_ TITANIC/titanic.csv")
#--------------------------------------------------------------------
# 3- It’s time to explore the dataset as a whole.
# a-Dimensions
dim(data)
#  b-Structure
str(data)
# c---
#  First 10 rows
head(data,n=10L)
#  Last 10 rows
tail(data,n=10L)
# d----
#  Summary
summary(data)
#-------------------------------------------------------------------------------------
# 4- Let’sexploresomevariablesinthedataset
# a-Summary on Age
summary(data$Age)
# b--
# first quartile is 20.12 and third is 38.00 
# first quartile is the mean of first half of the data and third mean of second half

# c--
#is.na(data$Age)
anyNA(data$Age)
# the difference between is.na and anyNA the first one return boolean matrix with the same dimenssion
# say is this value missing or not. but anyNA return is this variable has missing value on it or not 
# the best choice is anyNA for this case

# d--
class(data$Embarked)
f=factor(data$Embarked)
levels(f)
# we expected 3 values C,Q,S but there is empty string
# e--
# we need to preprocess this data solve nulls empty string and so on

#-------------------------------------------------------------------------------------
# 5- preprocessing
# a--
data=subset(data,!is.na(data$Age))
# b--
data=subset(data,data$Embarked%in%c("Q","C","S"))
# c--
anyNA(data$Age)# yes as expected
levels(factor(data$Embarked))# yes as expected
# d--
data=subset(data,select = -c(Cabin,Ticket))
#---------------------------------------------------------
## 6 -plots
# a-
gender_value_count=table(data$Gender)
gender_value_count
## b-
pie(gender_value_count)
# c--
pie(gender_value_count,col=c("red","blue"))
# c--
gender_survived=table(data$Survived,data$Gender)
gender_survived
# d--
pie(gender_survived["1",],col=c("red","blue"))
# e-- 
# female survived greater than male

# f--
pclass_survived=table(data$Survived,data$Pclass)
pclass_survived
# g--
barplot(pclass_survived,beside = FALSE)
## h--
barplot(pclass_survived,beside = FALSE,col=c("red","blue"))
# i--
# concluded that people with high class more survived than low class people 

## j--
boxplot(data$Age)
# K --
# box plot it shows the first quritle and second and third 
# whiskers show IQR and  the outiluers (points outside it like here around 70)

# l
plot(density(data$Age,na.rm = TRUE))
#-----------------------------------------
# 7
data=subset(data,select=c(Name,Survived))
write.csv(data,"titanic_preprocessed.csv",row.names=FALSE)




