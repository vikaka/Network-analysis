

library("twitteR")


consumer_key <- 'JNQcRToX7L0sQmtvT1pegIrfs'
consumer_secret <- '8IKVhuSecjbTdlEbkqzyktGFcl47zlQGouQz8ltcAgTkgMdywL'
access_token <- '73908899-RgxpF9n30enPFxpnKQYKqCc2Qev3FVvWgpF57LyP1'
access_secret <- 'LgXhCc5WSxm3c7gpsmgPMc7aA3ih1L8h9AA6rOB3nMlQ8'
setup_twitter_oauth(consumer_key , consumer_secret, access_token, access_secret)



tw.df <- do.call("rbind", lapply(searchTwitter("#SXSW2016",n =100,lang= "en"), as.data.frame))

usernames <- as.character((1:100))

for( i in 1:100)
{
  usernames.object[i] <- data.frame(getUser(tw.df$screenName[i]))
  
  
}
test$getFriends()
