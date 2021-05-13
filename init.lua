local addonName, hiAlert = ...
local hiAAA = LibStub("AceAddon-3.0"):NewAddon("hiAlert", "AceConsole-3.0", "AceEvent-3.0") -- NewAddon takes a name to create, and mixins.

local defaults = {
	global = {
		USING_DEFAULTS = true,
	},
	profile = {
		setting = true,
	},
	char = {
		-- If a setting is for this character only.
		-- This should be empty by default. Entries should be moved from
		-- other profiles into character specific 
	},
}

local options = {
	name = "hiAlert",
	type = "group",
	args = {
		enable = {
			name = "Enable",
			desc = "Enable the addon?",
			descStyle = "inline",
			type = "toggle",
			set = function(info, val) HiAlertDB.USING_DEFAULTS = val end,
			get = function(info) return HiAlertDB.USING_DEFAULTS end,
		},
		sayhi = {
			name = "Say hello",
			type = "execute",
			guiHidden = true,
			desc = "Print hi in chat.",
			func = function(info) DEFAULT_CHAT_FRAME:AddMessage("Hi!") end,
		},
	},
}


function hiAAA:runParts(tableOfFuncs, ...)
	for func, _ in pairs(tableOfFuncs) do
		tableOfFuncs[func](self)
	end
end

--function hiAAA:handleSlashCommand(input)
--	if not input or input:trim() == "" then
--		InterfaceOptionsFrame_OpenToCategory(self.optionsFrame)
--		InterfaceOptionsFrame_OpenToCategory(self.optionsFrame)
--	else
--		LibStub("AceConfigCmd-3.0"):HandleCommand("hia", "hiAlertOptionsTable", input)
--	end
--end



local OnInitialize = {
	CreateOptionsTable = function(self)
		LibStub("AceConfig-3.0"):RegisterOptionsTable("hiAlertOptionsTable", options, {"hia", "hialert"})
		self.optionsFrame = LibStub("AceConfigDialog-3.0"):AddToBlizOptions("hiAlertOptionsTable")
	end,

	EstablishDB = function(self)
		self.db = LibStub("AceDB-3.0"):New("hiAlertDB", defaults, "Hiui")
		options.args.profile = LibStub("AceDBOptions-3.0"):GetOptionsTable(self.db)
	end,
}

function hiAAA:OnInitialize()
	-- Options table creates the name using table.
	
	--self:RegisterChatCommand("hialert", "handleSlashCommand")
	--self:RegisterChatCommand("hia", "handleSlashCommand")

	self:runParts(OnInitialize)

end



local OnEnable = {
	fakefunc = function(self)
		self:RegisterEvent("ZONE_CHANGED")
		self:Print("Zone change registered.")
	end,
}

function hiAAA:OnEnable()
	self:runParts(OnEnable)
end



local OnDisable = {

}

function hiAAA:OnDisable()
	self:runParts(OnDisable)
end



--[[	Exports		]]--
hiAlert.Ace = hiAAA
hiAlert.options = options
--hiAlert.OnInitialize = OnInitialize
--hiAlert.OnEnable = OnEnable
--hiAlert.OnDisable = OnDisable
