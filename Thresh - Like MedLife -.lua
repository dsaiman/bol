if not VIP_USER or myHero.charName ~= "Thresh" then return end

 if VIP_USER then
 	AdvancedCallback:bind('OnApplyBuff', function(s, u, b) OnApplyBuff(s, u, b) end)
	AdvancedCallback:bind('OnRemoveBuff', function(u, b) OnRemoveBuff(u, b) end)
	AdvancedCallback:bind('OnUpdateBuff', function(u, b) OnUpdateBuff(u, b) end)
end

local function AutoupdaterMsg(msg) print("<font color=\"#6699ff\"><b>Thresh - Like MedLife -:</b></font> <font color=\"#FFFFFF\">"..msg..".</font>") end
local version = 1.15
local AUTO_UPDATE = true
local UPDATE_HOST = "raw.github.com"
local UPDATE_PATH = "/jineyne/bol/master/Thresh - Like MedLife -.lua".."?rand="..math.random(1,10000)
local UPDATE_FILE_PATH = LIB_PATH.."Thresh - Like MedLife -.lua"
local UPDATE_URL = "https://"..UPDATE_HOST..UPDATE_PATH

if AUTO_UPDATE then
	local ServerData = GetWebResult(UPDATE_HOST, "/jineyne/bol/master/version/Thresh - Like MedLife -.version")
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

local SCRIPT_LIBS = {
	["SourceLib"] = "https://raw.github.com/LegendBot/Scripts/master/Common/SourceLib.lua",
	["VPrediction"] = "https://raw.github.com/LegendBot/Scripts/master/Common/VPrediction.lua",
	["DivinePred"] = "http://divinetek.rocks/divineprediction/DivinePred.lua",
	["SxOrbWalk"] = "https://github.com/Superx321/BoL/blob/master/common/SxOrbWalk.lua",
}
function Initiate()
	for LIBRARY, LIBRARY_URL in pairs(SCRIPT_LIBS) do
		if FileExist(LIB_PATH..LIBRARY..".lua") then
			require(LIBRARY)
		else
			DOWNLOADING_LIBS = true
			if LIBRARY == "DivinePred" then
				AutoupdaterMsg("Missing Library! Downloading "..LIBRARY..". If the library doesn't download, please download it manually.")
				DownloadFile("http://divinetek.rocks/divineprediction/DivinePred.lua", LIB_PATH.."DivinePred.lua",function() AutoupdaterMsg("Successfully downloaded "..LIBRARY) end)
				DownloadFile("http://divinetek.rocks/divineprediction/DivinePred.luac", LIB_PATH.."DivinePred.luac",function() AutoupdaterMsg("Successfully downloaded "..LIBRARY) end)
			else
				AutoupdaterMsg("Missing Library! Downloading "..LIBRARY..". If the library doesn't download, please download it manually.")
				DownloadFile(LIBRARY_URL,LIB_PATH..LIBRARY..".lua",function() AutoupdaterMsg("Successfully downloaded "..LIBRARY) end)
			end
		end
	end	
	if DOWNLOADING_LIBS then return true end
end
if Initiate() then return end


--local
local gapcloserspell = {
	--        ['Ahri']        = {true, spell = _R,},
        ['Aatrox']      = {true, spell = _Q,},
        ['Akali']       = {true, spell = _R,}, -- Targeted ability
        ['Alistar']     = {true, spell = _W,}, -- Targeted ability
        ['Diana']       = {true, spell = _R,}, -- Targeted ability
        ['Gragas']      = {true, spell = _E,},
        ['Graves']      = {true, spell = _E,},
        --['Hecarim']     = {true, spell = _R,},
        ['Irelia']      = {true, spell = _Q,}, -- Targeted ability
        --['JarvanIV']    = {true, spell = 'jarvanAddition',}, -- Skillshot/Targeted ability
        ['Jax']         = {true, spell = _Q,}, -- Targeted ability
        --['Jayce']       = {true, spell = 'JayceToTheSkies',}, -- Targeted ability
        ['Khazix']      = {true, spell = _E,},
        ['Leblanc']     = {true, spell = _W,},
        --['LeeSin']      = {true, spell = 'blindmonkqtwo',},
        ['Leona']       = {true, spell = _E,},
        --['Malphite']    = {true, spell = _R,},
        ['Maokai']      = {true, spell = _W,}, -- Targeted ability
        ['MonkeyKing']  = {true, spell = _E,}, -- Targeted ability
        ['Pantheon']    = {true, spell = _W,}, -- Targeted ability
        ['Poppy']       = {true, spell = _E,}, -- Targeted ability
        --['Quinn']       = {true, spell = _E,}, -- Targeted ability
        ['Renekton']    = {true, spell = _E,},
        ['Sejuani']     = {true, spell = _Q,},
        ['Shen']        = {true, spell = _E,},
        ['Tristana']    = {true, spell = _W,},
		['Thresh']		= {true, spell = _Q},
        --['Tryndamere']  = {true, spell = 'Slash',,
        ['XinZhao']     = {true, spell = _E,}, -- Targeted ability
}

local InterruptList = {
    { charName = "Caitlyn", spellName = "CaitlynAceintheHole"},
    { charName = "FiddleSticks", spellName = "Crowstorm"},
    { charName = "FiddleSticks", spellName = "DrainChannel"},
    { charName = "Galio", spellName = "GalioIdolOfDurand"},
    { charName = "Karthus", spellName = "FallenOne"},
    { charName = "Katarina", spellName = "KatarinaR"},
    { charName = "Lucian", spellName = "LucianR"},
    { charName = "Malzahar", spellName = "AlZaharNetherGrasp"},
    { charName = "MissFortune", spellName = "MissFortuneBulletTime"},
    { charName = "Nunu", spellName = "AbsoluteZero"},
    { charName = "Pantheon", spellName = "Pantheon_GrandSkyfall_Jump"},
    { charName = "Shen", spellName = "ShenStandUnited"},
    { charName = "Urgot", spellName = "UrgotSwap2"},
    { charName = "Varus", spellName = "VarusQ"},
    { charName = "Warwick", spellName = "InfiniteDuress"}
}
local ToInterrupt = {}

local dp, VP, SxO, STS = nil, nil, nil, nil
local player = myHero
local enemyHeroes = GetEnemyHeroes()
local allyHeroes = GetAllyHeroes()
local Qrange, Wrange, Erange, Rrange = 1075, 950, 500, 450 
local Healrange = 0

local Mikael = 3222
local healpos = nil

function LoadItem()
	ItemNames				= {
		[3222]				= "Mikael's Crucible",
	}
	
	_G.ITEM_1				= 06
	_G.ITEM_2				= 07
	_G.ITEM_3				= 08
	_G.ITEM_4				= 09
	_G.ITEM_5				= 10
	_G.ITEM_6				= 11
	_G.ITEM_7				= 12
	
	___GetInventorySlotItem	= rawget(_G, "GetInventorySlotItem")
	_G.GetInventorySlotItem	= GetSlotItem
end

function GetSlotItem(id, unit)
	
	unit 		= unit or myHero

	if (not ItemNames[id]) then
		return ___GetInventorySlotItem(id, unit)
	end

	local name	= ItemNames[id]
	
	for slot = ITEM_1, ITEM_7 do
		local item = unit:GetSpellData(slot).name
		if ((#item > 0) and (item:lower() == name:lower())) then
			return slot
		end
	end
end

function OnLoad()
	for i = 1, heroManager.iCount do
        local hero = heroManager:GetHero(i)
		for _, champ in pairs(InterruptList) do
			if hero.charName == champ.charName then
				table.insert(ToInterrupt, champ.spellName)
			end
        end
    end
	
	STS 	= SimpleTS()
	VP 		= VPrediction()
	dp 		= DivinePred()
	SxO 	= SxOrbWalk() 
	
	OnLoadMenu()
	
	healpos = GetSummoner()
end

function OnTick()

	OnSpellcheck()
	
	if Config.key.combo then
		Combo()
	end
	
	help()
end

function OnDraw()
	if Config.draw.qdraw then
		DrawCircle(player.x, player.y, player.z, Qrange, TARGB(Config.draw.qcolor))
	end
	if Config.draw.wdraw then
		DrawCircle(player.x, player.y, player.z, Wrange, TARGB(Config.draw.wcolor))
	end
	if Config.draw.edraw then
		DrawCircle(player.x, player.y, player.z, Erange, TARGB(Config.draw.ecolor))
	end
	if Config.draw.rdraw then
		DrawCircle(player.x, player.y, player.z, Rrange, TARGB(Config.draw.rcolor))
	end
end

function OnLoadMenu()
	Config = MenuWrapper("[Your] " .. player.charName, "unique" .. player.charName:gsub("%s+", ""))
	
		Config:SetTargetSelector(STS)
		Config:SetOrbwalker(SxO)
		Config = Config:GetHandle()
		
		Config:addSubMenu("Key", "key")
			Config.key:addParam("combo", "Combo Active", SCRIPT_PARAM_ONKEYDOWN, false, 32)
			
		Config:addSubMenu("Ads", "ads")
			Config.ads:addParam("pred", "Chooes Pred Type", SCRIPT_PARAM_LIST, 1, {"DivinePred", "VPrediction"})
			
		Config:addSubMenu("Q Setting", "qsetting")
			Config.qsetting:addParam("use", "Use", SCRIPT_PARAM_ONOFF, true)
			
		Config:addSubMenu("W Setting", "wsetting")
			Config.wsetting:addParam("use", "Use", SCRIPT_PARAM_ONOFF, true)
			Config.wsetting:addParam("help", "Help", SCRIPT_PARAM_ONOFF, true)
			Config.wsetting:addParam("helparound", "Help W around enemy", SCRIPT_PARAM_SLICE, 1, 1, 5, 0)
			Config.wsetting:addParam("helprange", "Help W help range", SCRIPT_PARAM_SLICE, 100, 100, 1000, 0)
			Config.wsetting:addParam("cc", "Help W to cc", SCRIPT_PARAM_ONOFF, true)
		
		Config:addSubMenu("E Setting", "esetting")
			Config.esetting:addParam("use", "Use", SCRIPT_PARAM_ONOFF, true)
			--Config.esetting:addParam("gape", "Use E to Gapcloser", SCRIPT_PARAM_ONOFF, true)
			Config.esetting:addParam("inte", "Use E to Interrupt", SCRIPT_PARAM_ONOFF, true)
			Config.esetting:addParam("pull", "Pull E in Combo", SCRIPT_PARAM_ONOFF, true)
		
		Config:addSubMenu("R Setting", "rsetting")
			Config.rsetting:addParam("use", "Use", SCRIPT_PARAM_ONOFF, true)
			Config.rsetting:addParam("perr", "Use R", SCRIPT_PARAM_SLICE, 1, 1, 5, 0)
			
		Config:addSubMenu("Item Setting", "isetting")
			Config.isetting:addParam("use", "Use Item", SCRIPT_PARAM_ONOFF, true)
			Config.isetting:addSubMenu("Mikael's Crucible", "Mikael")
				Config.isetting.Mikael:addParam("Mikael", "Mikael's Crucible", SCRIPT_PARAM_ONOFF, true)
				Config.isetting.Mikael:addParam("Stun", "Use Stun", SCRIPT_PARAM_ONOFF, true)
				--Config.isetting.Mikael:addParam()
			
		Config:addSubMenu("Summoner Setting", "ssetting")
			Config.ssetting:addParam("use", "Use", SCRIPT_PARAM_ONOFF, true)
			Config.ssetting:addParam("heal", "heal", SCRIPT_PARAM_ONOFF, true)
			Config.ssetting:addParam("healper", "use heal %", SCRIPT_PARAM_SLICE, 30, 5, 100, 0)
			
		Config:addSubMenu("Draw", "draw")
			Config.draw:addParam("qdraw", "Q Draw", SCRIPT_PARAM_ONOFF, true)
				Config.draw:addParam("qcolor","Q Color", SCRIPT_PARAM_COLOR, {100, 255, 0, 0})
			Config.draw:addParam("wdraw", "W Draw", SCRIPT_PARAM_ONOFF, true)
				Config.draw:addParam("wcolor","W Color", SCRIPT_PARAM_COLOR, {100, 255, 0, 0})
			Config.draw:addParam("edraw", "E Draw", SCRIPT_PARAM_ONOFF, true)
				Config.draw:addParam("ecolor","E Color", SCRIPT_PARAM_COLOR, {100, 255, 0, 0})
			Config.draw:addParam("rdraw", "R Draw", SCRIPT_PARAM_ONOFF, true)
				Config.draw:addParam("rcolor","R Color", SCRIPT_PARAM_COLOR, {100, 255, 0, 0})
end

function Combo()
	local target = STS:GetTarget(1500)
	if target ~= nil then
		if Qready and GetDistance(target) < Qrange and Config.qsetting.use and not target.dead  then
			CastQ(target)
		end
		
		if Wready and Config.wsetting.use and not target.dead then
		end
		
		if Eready and GetDistance(target) < Erange and Config.esetting.use and not target.dead  then
			if Config.esetting.pull then
				CastE(behind(target))
			else
				CastE(target)
			end
		end
		if Wready and Config.rsetting.use and not target.dead  then
			CastR()
		end
	end

end

function help()
	if Config.wsetting.help then
		for i, j in pairs(allyHeroes) do
			if GetNearEnemy(j, Config.wsetting.helprange) >= Config.wsetting.helparound then
				CastW(j)
			end
		end
	end
end

function UseSummoner()
	if Config.ssetting.use then
		if Config.ssetting.heal then
			for i, j in pairs(allyHeroes) do
				if j.health <= j.maxHealth*(Config.ssetting.healper*0.01) and ValidTarget(j, 790, false) or player.health <= player.maxHealth*(Config.ssetting.healper*0.01) then
					CastSummoner(heal)
				end
			end
		end
	end
end

-----------------------------

function CastQ(t)
	if Config.ads.pred == 1 then
		if player:GetSpellData(_Q).name ~= "threshqleap" then
			local Target = DPTarget(t)
			local state,hitPos,perc = dp:predict(Target, LineSS(1150, Qrange, 60, 0.5, 0))
			if state == SkillShot.STATUS.SUCCESS_HIT then
				CastSpell(_Q, hitPos.x, hitPos.z)
			end
		end
	elseif Config.ads.pred == 2 then
		local CastPosition,  HitChance,  Position = VP:GetLineCastPosition(t, 0.5, 60, Qrange, 1150, player, true)
		if HitChance >= 2 then
			CastSpell(_Q, Position.x, Position.z)
		end
	end
end

function CastW(target)
	CastSpell(_W, target.x, target.z)
end

function CastE(target)
	CastSpell(_E, target.x, target.z)
end

function CastR()
	if GetNearEnemy(player, Rrange) >= Config.rsetting.perr then
		CastSpell(_R)
	end
end

function CastSummoner(typee)
	if typee == "heal" then
		if player:GetSpellData(heal) == READY then
			CastSpell(heal)
		end
	end
end

function UseItem(item, target)
	if player:GetSpellData(item) == READY then
		CastSpell(item, target)
		if Config.wsetting.cc then
			CastW(target)
		end
	end
end

-----------------------------

function GetNearEnemy(unit, range)
	local count = 0
	for i, j in pairs(enemyHeroes) do
		if GetDistance(j, unit) < range then
			count = count + 1
		end
	end
	return count
end

function GetSummoner()
	if myHero:GetSpellData(SUMMONER_1).name:find("summonerheal") then
		local heal = SUMMONER_1
	elseif myHero:GetSpellData(SUMMONER_2).name:find("summonerheal") then
		local heal = SUMMONER_2
	end
	return heal
end

function behind(target)
	return target + Vector(myHero.x-target.x,myHero.y,myHero.z-target.z):normalized()*(GetDistance(myHero,target)+100)
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

	if myHero:CanUseSpell(_Q) == READY then
		Rready = true
	else
		Rready = false
	end
end

function OnProcessSpell(unit, spell)
	if #ToInterrupt > 0 then
		for _, ability in pairs(ToInterrupt) do
			if spell.name == ability and unit.team ~= player.team and GetDistance(unit) < Erange and Config.esetting.inte then
				CastE(unit)
			end
		end
	end
	--[[if unit.type == player.type and unit.team ~= player.team and spell then
		if gapcloserspell[unit.charName] ~= nil then
			for i=1, #gapcloserspell[unit.charName] do
				if spell.name == unit:GetSpellData(gapcloserspell[unit.charName].spell).name then
					local t = tostring(math.ceil(GetDistance(Vector(spell.endPos), player)))
					local a = Erange
					if t < a and Config.esetting.gape then
						CastE(unit)
					end
				end
			end
		end
	end]]
end

function OnRemoveBuff(u, b)
	if u.team == player.team and u.type == player.type then
	end
end

function OnUpdateBuff(u, b, s)
end

function OnApplyBuff(s, u, b)
	if u.team == player.team and u.type == player.type then
		if Config.isetting.Mikael.Mikael then
			-- stun
			if b.name == "stun" and Config.isetting.Mikael.stun then
				UseItem(Mikael, u)
			end
		end
	end
end
