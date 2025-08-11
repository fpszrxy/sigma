--[[
 .____                  ________ ___.    _____                           __                
 |    |    __ _______   \_____  \\_ |___/ ____\_ __  ______ ____ _____ _/  |_  ___________ 
 |    |   |  |  \__  \   /   |   \| __ \   __\  |  \/  ___// ___\\__  \\   __\/  _ \_  __ \
 |    |___|  |  // __ \_/    |    \ \_\ \  | |  |  /\___ \\  \___ / __ \|  | (  <_> )  | \/
 |_______ \____/(____  /\_______  /___  /__| |____//____  >\___  >____  /__|  \____/|__|   
         \/          \/         \/    \/                \/     \/     \/                   
          \_Welcome to LuaObfuscator.com   (Alpha 0.10.9) ~  Much Love, Ferib 

]]--

local v0=game.PlaceId;print("Current PlaceId:",v0);local v1={[126509999114328]="https://raw.githubusercontent.com/VapeVoidware/VW-Add/main/nightsintheforest.lua",[125009265613167]="https://api.luarmor.net/files/v3/loaders/0785b4b8f41683be513badd57f6a71c0.lua"};local v2=v1[v0];if  not v2 then warn("No script configured for this game PlaceId:",v0);return;end local v3,v4=pcall(function() return game:HttpGet(v2,true);end);if (v3 and v4) then local v5,v6=loadstring(v4);if v5 then v5();print("Script loaded for PlaceId:",v0);else warn("Failed to compile script:",v6);end else warn("Failed to download script for PlaceId:",v0);end
