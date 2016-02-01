
 Needed <- c("tm", "SnowballC","proxy")   
 install.packages(Needed, dependencies=TRUE)  

library(tm)
library(SnowballC)
library(proxy)

path <- "~/Desktop/text_mining/texts/parts" #mac
#path <- "C:/User/yourusername/Desktop/text_mining/texts/parts

#check our path and load the data
dir(path)
docs <- Corpus(DirSource(path))
summary(docs)

inspect(docs[1])
writeLines(as.character(docs[1]))


#clean up our documents
docs <- tm_map(docs,removePunctuation)
docs <- tm_map(docs,removeNumbers)
docs <- tm_map(docs,content_transformer(tolower))
docs <- tm_map(docs,removeWords,stopwords("english"))
docs <- tm_map(docs,stemDocument)
docs <- tm_map(docs,stripWhitespace)

dtm <- DocumentTermMatrix(docs)
inspect(dtm[1:9,1:10])

findAssocs(dtm, "capital", corlimit=0.90)

freq <- colSums(as.matrix(dtm))
length(freq)

ord <- order(freq, decreasing=TRUE)
freq <- freq[ord]
head(freq,10)

inspect(dtm[1:9,ord[1:20]])
#nb if you rerun the order it will corespond w/ the new freq and not the dtm

dtms <- removeSparseTerms(dtm, 0.1)
inspect(dtms[1:9,1:25])

wdtm <- weightTfIdf(dtm)
inspect(dtm[1:9,ord[1:20]])

dist(as.matrix(dtm), method="cosine")