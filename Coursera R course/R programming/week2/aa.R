pollutantmean <- function  ( pollutant,id ) {
  setwd("C:\\Users\\jakub\\OneDrive\\Documents\\GitHub\\R-lang-learnirn\\Coursera R course\\R programming\\week2")
  mydir = "specdata"
  myfiles = list.files(path=mydir, pattern="*.csv", full.names=TRUE)
  
  dat_csv = ldply(myfiles, read_csv)
  dat_csv
  
}

getToTask1 <- function  ( frame, pollutant,ids ) { 
  a <- longFrame %>% filter(
    ID %in% ids )  
  mean(a[[pollutant]], na.rm=TRUE)
}


#task 
analyzeNa <- function() {
myfiles = list.files(path=mydir, pattern="*.csv", full.names=TRUE)
df <- data.frame(id=character(),nobs=double() ) 
for(name in  myfiles) {
table <- read_csv(paste("specdata/",name,".csv",sep=""))
nob <- length(table[complete.cases(table),]$ID)
df ->df %>% add_row(id = name, nobs =nob)
}
df
}
