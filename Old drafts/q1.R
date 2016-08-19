library(ggplot2)
library(geomnet)
library(gcookbook)
library(reshape2)

library(networkD3)
library(igraph)
#read the data

consumer_key <- 'JNQcRToX7L0sQmtvT1pegIrfs'
consumer_secret <- '8IKVhuSecjbTdlEbkqzyktGFcl47zlQGouQz8ltcAgTkgMdywL'
access_token <- '73908899-RgxpF9n30enPFxpnKQYKqCc2Qev3FVvWgpF57LyP1'
access_secret <- 'LgXhCc5WSxm3c7gpsmgPMc7aA3ih1L8h9AA6rOB3nMlQ8'



keys <- read.table("~/Assignment 4/keys.txt", sep = "\t", fill = FALSE, col.names = c("node_id","name"))
Subs <- read.table("~/Assignment 4/subs.txt", sep = "\t", fill = FALSE, col.names = c("ingredient_A","ingredient_B"))

#visualize the data

data = Subs

ggplot(data = Subs, aes(from_id = ingredient_A, to_id = ingredient_B)) + geom_net(vertices = keys$name, aes(colour = "blue"))

ggplot(Subs)

grap <- induced.subgraph(Subs,idx)
graph <- get.data.frame(Subs,what = "edges")
ggplot(graph)

graph <- graph.data.frame(Subs,keys, directed = T)
degree(graph,mode = "Total")
degree_distribution(graph)
plot(graph)
simpleNetwork(Subs, zoom = T)
              
keys$group <- 1
keys$node_id <- keys$node_id-1
Subs$ingredient_A <- Subs$ingredient_A-1
Subs$ingredient_B <- Subs$ingredient_B-1
keys$group[keys$name == "cocoa powder"] <- 2
forceNetwork(Links = Subs,Nodes = keys,Source = "ingredient_A", Target = "ingredient_B",NodeID = "name",Group = "group",zoom = TRUE, opacityNoHover = T)

From <- "from:"
sxsw <- "+#SXSW2016"

tweets_list <- data.frame(stringsAsFactors=FALSE) 

for(j in 1:100)
{
  #if(j %% 5 == 0){Sys.sleep(600)}
    tweets_object<-do.call("rbind", lapply(searchTwitter(paste(From,unique_usernames[j],sxsw,sep = ""),resultType = "recent",lang= "en"), as.data.frame))
    tweets_list <- merge(tweets_list, tweets_object,  all=T)
}



test_twet1 <- do.call("rbind", lapply(searchTwitter(paste(From,unique_usernames[3],sxsw,sep = ""),lang= "en"), as.data.frame))

test_twet2 <- do.call("rbind", lapply(searchTwitter(paste(From,unique_usernames[4],sxsw,sep = ""),lang= "en"), as.data.frame))

test_twet3 <- merge(test_twet3,test_twet2, all = T)


tweets_list_1 <- data.frame(stringsAsFactors=FALSE) 

for(j in 91:100)
{
  tweets_object<-do.call("rbind",lapply(searchTwitter(paste(From,unique_usernames[j],sxsw,sep = ""),lang= "en"), as.data.frame))
  tweets_list_1 <- merge(tweets_list_1, tweets_object,  all=T)
}

tweets_list <- merge(tweets_list, tweets_list_1,  all=T)





