--====================================================================================
-- #Author: Jonathan D @ Gannon
--====================================================================================

RegisterNetEvent("gcPhone:sendMessage:twitter_getTweets")
AddEventHandler("gcPhone:sendMessage:twitter_getTweets", function(tweets)
  SendNUIMessage({event = 'twitter_tweets', tweets = tweets})
end)

RegisterNetEvent("gcPhone:sendMessage:twitter_getFavoriteTweets")
AddEventHandler("gcPhone:sendMessage:twitter_getFavoriteTweets", function(tweets)
  SendNUIMessage({event = 'twitter_favoritetweets', tweets = tweets})
end)

RegisterNetEvent("gcPhone:sendMessage:twitter_newTweets")
AddEventHandler("gcPhone:sendMessage:twitter_newTweets", function(tweet)
  SendNUIMessage({event = 'twitter_newTweet', tweet = tweet})
end)

RegisterNetEvent("gcPhone:sendMessage:twitter_updateTweetLikes")
AddEventHandler("gcPhone:sendMessage:twitter_updateTweetLikes", function(tweetId, likes)
  SendNUIMessage({event = 'twitter_updateTweetLikes', tweetId = tweetId, likes = likes})
end)

RegisterNetEvent("gcPhone:sendMessage:twitter_setAccount")
AddEventHandler("gcPhone:sendMessage:twitter_setAccount", function(username, password, avatarUrl)
  SendNUIMessage({event = 'twitter_setAccount', username = username, password = password, avatarUrl = avatarUrl})
end)

RegisterNetEvent("gcPhone:sendMessage:twitter_createAccount")
AddEventHandler("gcPhone:sendMessage:twitter_createAccount", function(account)
  SendNUIMessage({event = 'twitter_createAccount', account = account})
end)

RegisterNetEvent("gcPhone:sendMessage:twitter_showError")
AddEventHandler("gcPhone:sendMessage:twitter_showError", function(title, message)
  SendNUIMessage({event = 'twitter_showError', message = message, title = title})
end)

RegisterNetEvent("gcPhone:sendMessage:twitter_showSuccess")
AddEventHandler("gcPhone:sendMessage:twitter_showSuccess", function(title, message)
  SendNUIMessage({event = 'twitter_showSuccess', message = message, title = title})
end)

RegisterNetEvent("gcPhone:sendMessage:twitter_setTweetLikes")
AddEventHandler("gcPhone:sendMessage:twitter_setTweetLikes", function(tweetId, isLikes)
  SendNUIMessage({event = 'twitter_setTweetLikes', tweetId = tweetId, isLikes = isLikes})
end)



RegisterNUICallback('twitter_login', function(data, cb)
  TriggerServerEvent('gcPhone:sendMessage:twitter_login', data.username, data.password)
end)
RegisterNUICallback('twitter_changePassword', function(data, cb)
  TriggerServerEvent('gcPhone:sendMessage:twitter_changePassword', data.username, data.password, data.newPassword)
end)


RegisterNUICallback('twitter_createAccount', function(data, cb)
  TriggerServerEvent('gcPhone:sendMessage:twitter_createAccount', data.username, data.password, data.avatarUrl)
end)

RegisterNUICallback('twitter_getTweets', function(data, cb)
  TriggerServerEvent('gcPhone:sendMessage:twitter_getTweets', data.username, data.password)
end)

RegisterNUICallback('twitter_getFavoriteTweets', function(data, cb)
  TriggerServerEvent('gcPhone:sendMessage:twitter_getFavoriteTweets', data.username, data.password)
end)

RegisterNUICallback('twitter_postTweet', function(data, cb)
  TriggerServerEvent('gcPhone:sendMessage:twitter_postTweets', data.username or '', data.password or '', data.message)
end)

RegisterNUICallback('twitter_toggleLikeTweet', function(data, cb)
  TriggerServerEvent('gcPhone:sendMessage:twitter_toogleLikeTweet', data.username or '', data.password or '', data.tweetId)
end)

RegisterNUICallback('twitter_setAvatarUrl', function(data, cb)
  TriggerServerEvent('gcPhone:sendMessage:twitter_setAvatarUrl', data.username or '', data.password or '', data.avatarUrl)
end)
