pollutantmean <- function  ( pollutant,id ) {
  setwd("C:\\Users\\jakub\\OneDrive\\Documents\\GitHub\\R-lang-learnirn\\Coursera R course\\R programming\\week2")
  mydir = "specdata"
  myfiles = list.files(path=mydir, pattern="*.csv", full.names=TRUE)
  
  dat_csv = ldply(myfiles, read_csv)
  dat_csv
  
}


getnonNa <- function(name) {
read_csv(paste("specdata/",name,".csv",sep="")) %>%
  mutate(nanNumb = ifelse( !is.na(sulfate) &  !is.na(nitrate),1,0 )) %>%
  .$nanNumb %>%
  sum()}



# when frame is given
getnonNaFrame <- function(frame) {
     frame  %>%
    mutate(nanNumb = ifelse( !is.na(sulfate) &  !is.na(nitrate),1,0 )) %>%
    .$nanNumb %>%
    sum()}

getCorrel <- function (frame){
  frameA<-na.omit(frame)
  cor(frameA$sulfate, frameA$nitrate )
}


fileNames <- myfiles %>% str_replace("\\.csv","")  %>% 
  str_replace("specdata/","")

frames <- map(fileNames,read_csv(paste("specdata/",.x,".csv",sep="")) )
mappedNona <-  flatten_dbl(map(frames, getnonNaFrame))



mapped<-map(fileNames, getnonNa)


namees<- parse_number(fileNames)
noNaa = flatten_dbl(mapped)
tibble(names = namees, noNa = noNaa )

main %>% filter(names %in%  c(6, 10, 20, 34, 100, 200, 310) )



pThree <- function (main,treshold ){
 numberNames-> main %>% filter(noNa > treshold ) # tribble with names column of number names that we are intrested in 
  
}


vect <- filter(main, noNa>129)$corr

