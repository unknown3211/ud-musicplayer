RegisterNetEvent('ud-musicplayer:openMusicMenu')
AddEventHandler('ud-musicplayer:openMusicMenu', function()
    local data = {
        {
            title = "UnknownJohn Music Player",
        },
        {   
            disabled = false,
            title = "Play Song Link",
            action = "ud-musicplayer:PlayMusicLink"
        },
        {   
            disabled = false,
            title = "Pause Song",
            action = "ud-musicplayer:PauseSong"
        },
        {   
            disabled = false,
            title = "Resume Song",
            action = "ud-musicplayer:ResumeSong"
        },
    }
    exports["ud_ui"]:showContextMenu(data)
end)

RegisterUICallback('ud-musicplayer:PlayMusicLink', function(data, cb)
    exports['ud_ui']:openApplication('textbox', {
        callbackUrl = 'ud-musicplayer:MusicLink',
        key = 1,
        items = {
          {
            icon = "circle",
            label = "Song Link",
            name = "song",
          },
        },
        show = true,
    })
    cb({ data = {}, meta = { ok = true } })
end)

RegisterUICallback('ud-musicplayer:MusicLink', function(data, cb)
    cb({ data = {}, meta = { ok = true, message = '' } })
    local Song = data.values.song
    TriggerServerEvent('ud-musicplayer:PlayMusic', Song)
end)

RegisterNetEvent('songPlaying', function(Song)
    exports.xsound:PlayUrl("ud-musicplayer", Song, 0.5)
end)

RegisterUICallback('ud-musicplayer:PauseSong', function(data, cb)
    cb({ data = {}, meta = { ok = true, message = '' } })
    TriggerServerEvent('ud-musicplayer:PauseMusic', Song)
end)

RegisterNetEvent('pauseSongPlaying', function(Song)
    exports.xsound:Pause("ud-musicplayer", Song)
end)

RegisterUICallback('ud-musicplayer:ResumeSong', function(data, cb)
    cb({ data = {}, meta = { ok = true, message = '' } })
    TriggerServerEvent('ud-musicplayer:ResumeMusic', Song)
end)

RegisterNetEvent('resumeSongPlaying', function(Song)
    exports.xsound:Resume("ud-musicplayer", Song)
end)

AddEventHandler("ud_inventory:itemUsed", function (item, info)
    if item ~= "musicwalkman" then return end
    TriggerEvent('ud-musicplayer:openMusicMenu')
end)