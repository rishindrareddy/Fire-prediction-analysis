library("RWeka")
library("party")
library("partykit")
test=read.arff("forestfire.arff")
str(test)
tree <- J48(fire~., data = test)
if(require("party", quietly = TRUE)) plot(tree)
e <- evaluate_Weka_classifier(tree,cost = matrix(c(0,2,1,0), ncol = 2),numFolds = 10, complexity = TRUE,
                              seed = 123, class = TRUE)
summary(tree)
tree