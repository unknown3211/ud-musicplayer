RegisterServerEvent('ud-musicplayer:PlayMusic')
AddEventHandler('ud-musicplayer:PlayMusic', function(Song)
    local playerId = source    
    TriggerClientEvent('songPlaying', playerId, Song)
end)

RegisterServerEvent('ud-musicplayer:PauseMusic')
AddEventHandler('ud-musicplayer:PauseMusic', function(Song)
    local playerId = source    
    TriggerClientEvent('pauseSongPlaying', playerId, Song)
end)

RegisterServerEvent('ud-musicplayer:ResumeMusic')
AddEventHandler('ud-musicplayer:ResumeMusic', function(Song)
    local playerId = source    
    TriggerClientEvent('resumeSongPlaying', playerId, Song)
end)
