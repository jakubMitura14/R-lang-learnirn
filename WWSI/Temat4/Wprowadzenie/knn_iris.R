d<-read.csv(file="iris.csv",header=TRUE,sep=',')
d
#randomly shuffle the data
d<-d[sample(nrow(d)),]
d


#Create equally size folds
nbreaks<-10

folds <- cut(seq(1,nrow(d)),breaks=nbreaks,labels=FALSE)
folds

av_err_rate<-0

for(i in seq(1:nbreaks)){
  #Segement your data by fold using the which() function 
  test_indices <- which(folds==i,arr.ind=TRUE)
  test_indices
  d.test <- d[test_indices,1:4]  #without class
  d.test
  d.test.class<- d[test_indices,5]    #only class
  d.test.class
  d.train <- d[-test_indices, 1:4]
  d.train
  d.train.class <- d[-test_indices, 5]
  d.train.class

  #Use the test and train data partitions in knn algorith
  knn.result <- knn(d.train, d.test, d.train.class, k = 1)
  t<-table(d.test.class,knn.result)
  err_rate<-(nrow(d.test)-sum(diag(t)))/nrow(d.test)
  av_err_rate = av_err_rate + err_rate 
    
  cat("\n\nFold = ",i,"\t error rate = ",err_rate,"\n")
  print(t)
  
  }

  av_err_rate = av_err_rate/nbreaks
  av_err_rate
