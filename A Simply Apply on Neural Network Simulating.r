> install.packages("RSNNS")
> library(RSNNS)
> data(iris)
> library("Rcpp")
> iris = iris[sample(1:nrow(iris),length(1:nrow(iris))),1:ncol(iris)]
> irisValues= iris[,1:4]
> irisTargets = decodeClassLabels(iris[,5])
> iris = splitForTrainingAndTest(irisValues, irisTargets, ratio=0.15)
> iris = normTrainingAndTestSet(iris)
> model = mlp(iris$inputsTrain, iris$targetsTrain, size=5, learnFunc="Quickprop", learnFuncParams=c(0.1, 2.0, 0.0001, 0.1),maxit=100, inputsTest=iris$inputsTest, targetsTest=iris$targetsTest)
> predictions = predict(model,iris$inputsTest)
> confusionMatrix(iris$targetsTest,predictions)
