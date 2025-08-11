--[[
 .____                  ________ ___.    _____                           __                
 |    |    __ _______   \_____  \\_ |___/ ____\_ __  ______ ____ _____ _/  |_  ___________ 
 |    |   |  |  \__  \   /   |   \| __ \   __\  |  \/  ___// ___\\__  \\   __\/  _ \_  __ \
 |    |___|  |  // __ \_/    |    \ \_\ \  | |  |  /\___ \\  \___ / __ \|  | (  <_> )  | \/
 |_______ \____/(____  /\_______  /___  /__| |____//____  >\___  >____  /__|  \____/|__|   
         \/          \/         \/    \/                \/     \/     \/                   
          \_Welcome to LuaObfuscator.com   (Alpha 0.10.9) ~  Much Love, Ferib 

]]--

local v0=loadstring(game:HttpGet("https://sirius.menu/rayfield"))();local v1=v0:CreateWindow({Name="FpsSploits Free Script Hub",LoadingTitle="Loading Free Hub...",ConfigurationSaving={Enabled=false}});local v2=v1:CreateTab("Scripts",4483362458);v2:CreateButton({Name="Load Nights in the Forest Script",Callback=function() local v3,v4=pcall(function() loadstring(game:HttpGet("https://raw.githubusercontent.com/VapeVoidware/VW-Add/main/nightsintheforest.lua",true))();end);if v3 then print("Nights in the Forest script loaded successfully!");else warn("Failed to load Nights in the Forest script:",v4);end end});v2:CreateButton({Name="Load INK Games Script",Callback=function() local v5,v6=pcall(function() loadstring(game:HttpGet("https://api.luarmor.net/files/v3/loaders/0785b4b8f41683be513badd57f6a71c0.lua"))();end);if v5 then print("INK Games script loaded successfully!");else warn("Failed to load INK Games script:",v6);end end});v0:Notify({Title="Script Hub",Content="Loaded successfully!",Duration=5,Callback=function() end});
