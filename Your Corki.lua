if myHero.charName ~= "Corki" then return end

assert(load(Base64Decode("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"), nil, "bt", _ENV))() ScriptStatus("XKNLOMKKQSO")

local ts, SxO

local version = 1.02
local AUTO_UPDATE = false
local UPDATE_HOST = "raw.github.com"
local UPDATE_PATH = "/jineyne/bol/master/Your Corki.lua".."?rand="..math.random(1,10000)
local UPDATE_FILE_PATH = LIB_PATH.."Your Corki.lua"
local UPDATE_URL = "https://"..UPDATE_HOST..UPDATE_PATH

local function AutoupdaterMsg(msg) print("<font color=\"#6699ff\"><b>Your Corki:</b></font> <font color=\"#FFFFFF\">"..msg..".</font>") end
if AUTO_UPDATE then
	local ServerData = GetWebResult(UPDATE_HOST, "/jineyne/bol/master/Your Corki.version")
	if ServerData then
		ServerVersion = type(tonumber(ServerData)) == "number" and tonumber(ServerData) or nil
		if ServerVersion then
			if tonumber(version) < ServerVersion then
				AutoupdaterMsg("New version available"..ServerVersion)
				AutoupdaterMsg("Updating, please don't press F9")
				DelayAction(function() DownloadFile(UPDATE_URL, UPDATE_FILE_PATH, function () AutoupdaterMsg("Successfully updated. ("..version.." => "..ServerVersion.."), press F9 twice to load the updated version.") end) end, 3)
			else
				AutoupdaterMsg("You have got the latest version ("..ServerVersion..")")
			end
		end
	else
		AutoupdaterMsg("Error downloading version info")
	end
end
---------------------------------------------------------------------------------------------------



---------------------------------

require 'HPrediction'

function OnLoad()

	HPred = HPrediction()

	LoadMenu()
	ts = TargetSelector(TARGET_LESS_CAST_PRIORITY, 1300, DAMAGE_PHYSICAL, false)

	if Config.useorb then
		require "SxOrbWalk"
		SxO = SxOrbWalk()
		Config:addSubMenu("OrbWalk", "orbwalk")
		SxO:LoadToMenu(Config.orbwalk)
	end
end

function LoadMenu()
	Config = scriptConfig("Your Corki", "Your Corki")

	Config:addSubMenu("Combo", "combo")
		Config.combo:addParam("active", "Combo Active", SCRIPT_PARAM_ONKEYDOWN, false, 32)
		Config.combo:addParam("useq", "Use Q", SCRIPT_PARAM_ONOFF, true)
		Config.combo:addParam("usee", "Use E", SCRIPT_PARAM_ONOFF, true)
		Config.combo:addParam("user", "Use R", SCRIPT_PARAM_ONOFF, true)

	Config:addSubMenu("Harass", "harass")
		Config.harass:addParam("active", "Harass Active", SCRIPT_PARAM_ONKEYDOWN, false, string.byte("V"))
		Config.harass:addParam("useq", "Use Q", SCRIPT_PARAM_ONOFF, true)
		Config.harass:addParam("user", "Use R", SCRIPT_PARAM_ONOFF, true)

	Config:addSubMenu("Draw", "draw")
		Config.draw:addParam("drawq", "Draw Q", SCRIPT_PARAM_ONOFF, true)
		Config.draw:addParam("drawr", "Draw R", SCRIPT_PARAM_ONOFF, true)

	Config:addParam("useorb", "Use OrbWalk", SCRIPT_PARAM_ONOFF, true)
end

function Combo()
	if Config.combo.active then
		ts:update()
		if ts.target ~= nil then
		Target = ts.target
			if GetDistance(Target, myHero) < 825 and Qready and Config.combo.useq then
				local Pos, HitChance = HPred:GetPredict("Q", Target, myHero)
				if HitChance >= 1 then
					CastSpell(_Q, Pos.x, Pos.z)
				end
			end
			if GetDistance(Target, myHero) < 600 and Eready and Config.combo.usee then
				CastSpell(_E, Target)
			end
			if GetDistance(Target, myHero) < 1225 and Rready and Config.combo.user then
				local Pos, HitChance = HPred:GetPredict("R", Target, myHero)
				if HitChance >= 1 then
					CastSpell(_R, Pos.x, Pos.z)
				end
			end
		end
	end
end

function Harass()
	if Config.harass.active then
		ts:update()
		if ts.target ~= nil then
			Target = ts.target
			if GetDistance(Target, myHero) < 825 and Qready then
				local Pos, HitChance = HPred:GetPredict("Q", Target, myHero)
				if HitChance >= 1 then
					CastSpell(_Q, Pos.x, Pos.z)
				end
			end
			if GetDistance(Target, myHero) < 1225 and Rready then
				local Pos, HitChance = HPred:GetPredict("R", Target, myHero)
				if HitChance >= 1 then
					CastSpell(_R, Pos.x, Pos.z)
				end
			end
		end
	end
end


function OnTick()
	OnSpellcheck()
	Combo()
	Harass()
end

function OnDraw()
	if Config.draw.drawq then DrawCircle(myHero.x, myHero.y, myHero.z, 825, 0xFFFF0000) end
	if Config.draw.drawr then DrawCircle(myHero.x, myHero.y, myHero.z, 1225, 0xFFFF0000) end
end

function OnSpellcheck()
	if myHero:CanUseSpell(_Q) == READY then
		Qready = true
	else
		Qready = false
	end

	if myHero:CanUseSpell(_W) == READY then
		Wready = true
	else
		Wready = false
	end

	if myHero:CanUseSpell(_E) == READY then
		Eready = true
	else
		Eready = false
	end

	if myHero:CanUseSpell(_R) == READY then
		Rready = true
	else
		Rready = false
	end
end
