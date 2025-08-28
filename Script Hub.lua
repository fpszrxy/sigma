
local function httpget(url)
    return game:HttpGet(url)
end

local function run_remote(url, label)
    local ok, err = pcall(function()
        return loadstring(httpget(url))()
    end)
    if ok then
        print(("[Loader] Loaded: %s"):format(label or url))
    else
        warn(("[Loader] Failed: %s -> %s"):format(label or url, tostring(err)))
    end
end


run_remote("https://raw.githubusercontent.com/fpszrxy/sigma/refs/heads/main/sigmaster", "sigmaster")


local MarketplaceService = game:GetService("MarketplaceService")
local ok, info = pcall(MarketplaceService.GetProductInfo, MarketplaceService, game.PlaceId)
local title = ""
if ok and info and typeof(info.Name) == "string" then
    title = string.lower(info.Name)
else
    warn("[Loader] Could not fetch game name; title-based detection may fail.")
end

-- Map of friendly names -> URLs
local PLACEID_URLS = {
    -- Blade Ball (main + alternate places)
    [13772394625] = "https://raw.githubusercontent.com/fpszrxy/sigma/refs/heads/main/Bladeball",
    [14525514348] = "https://raw.githubusercontent.com/fpszrxy/sigma/refs/heads/main/Bladeball",
    [14732610803] = "https://raw.githubusercontent.com/fpszrxy/sigma/refs/heads/main/Bladeball",

    -- 99 Nights
    [15532962292] = "https://raw.githubusercontent.com/fpszrxy/sigma/refs/heads/main/99nightsforest",

    -- Basketball Legends
    [12355337193] = "https://raw.githubusercontent.com/fpszrxy/sigma/refs/heads/main/Basketball%20Legends.lua",
	[14386691987] = "https://raw.githubusercontent.com/fpszrxy/sigma/refs/heads/main/Basketball%20Legends.lua",
}


local matched = false
if title ~= "" then
    if title:find("blade%p*%s*ball") or title:find("bladeball") then
        run_remote(URLS.bladeball, "Blade Ball")
        matched = true
    elseif title:find("%f[%w]99%f[%W]%s*nights") or title:find("99%s*nights") or title:find("99nights") then
        run_remote(URLS["99 nights"], "99 Nights")
        matched = true
    elseif title:find("basketball%s*legends") then
        run_remote(URLS["basketball legends"], "Basketball Legends")
        matched = true
    end
end

-- =========================
-- PlaceId fallback (optional)
-- =========================
if not matched then
    local url = PLACEID_URLS[game.PlaceId]
    if url then
        run_remote(url, "PlaceId=" .. tostring(game.PlaceId))
        matched = true
    end
end

if not matched then
    warn("[Loader] No script configured for this experience. PlaceId=" .. tostring(game.PlaceId) .. ", Title='" .. title .. "'")
end
