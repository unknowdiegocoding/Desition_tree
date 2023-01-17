
## Arbol de desición para clasificar en R 

install.packages("titanic")
install.packages("rpart")
install.packages("rattle")
install.packages("rpart.plot")

library(tidyverse)
library(titanic)
library(rpart)
library(rattle)
library(rpart.plot)



data("titanic_train")
head(titanic_train)
view(titanic_train)


### Modelando con arboles de desición

arbol <- rpart(
  formula = Survived ~ Sex + Age,
  data = titanic_train,
  method = "class"
)

## graficando el arbol
fancyRpartPlot(arbol)


## prediciendo con el arbol
pred_arbol <- predict(arbol, type = "class")
titanic_pred <- cbind(titanic_train, pred_arbol)

#pasajero masculino de 4 años, vive o no?
predict(object = arbol, 
        newdata = data.frame(Age = 4,
                             Sex = "male"),
        type = "class")








