library(class)  #for knn algorithm

d<-read.csv(file="mwine.csv",header=TRUE,sep=',')
d

d<-d[sample(nrow(d)),]   #randomly shuffle the data
d

#save(d, file='d_permute.RData')
#load("d_permute.RData")
#d

with(d, plot(alcohol,  malic_acid, col = wine_type)) #scatter plot

test_indices<-c(1:10)  #test set will contain 10 first records 
test_indices


# creating test and training sets
d.test <- d[test_indices,2:3]       #without wine_type (class)
d.test
d.test.class<- d[test_indices,1]    #only wine_type (class)
d.test.class
d.train <- d[-test_indices, 2:3]
d.train
d.train.class <- d[-test_indices, 1]
d.train.class

#knn algorithm
knn.result <- knn(d.train, d.test, d.train.class, k = 1)
knn.result 

t<-table(d.test.class,knn.result)
err_rate<-mean(knn.result!=d.test.class)

cat("\n\nerror rate = ",err_rate,"\n\n")
print(t)







