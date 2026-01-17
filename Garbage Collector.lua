--!nonstrict

local GetService: (any, string) -> any = clonefunction and clonefunction(game.GetService) or game.GetService
local Reference: (any) -> any = cloneref and (clonefunction and clonefunction(cloneref) or cloneref) or function(x: any): any return x end
local SWarn: (...any) -> () = clonefunction and clonefunction(warn) or warn

local Services: any = setmetatable({}, {
	__index = function(s: any, n: any): any
		s[n] = Reference(GetService(game, n))
		return s[n]
	end
})

local function RandomString(): string
	local chars: {string} = {
		"㊀", "㊁", "㊂", "㊃", "㊄", "㊅", "㊆", "㊇", "㊈", "㊉",
		"㊊", "㊋", "㊌", "㊍", "㊎", "㊏", "㊐", "㊑", "㊒", "㊓",
		"㊔", "㊕", "㊖", "㊗", "㊘", "㊙", "㊚", "㊛", "㊜", "㊝",
		"㊞", "㊟", "㊠", "㊡", "㊢", "㊣", "㊤", "㊥", "㊦", "㊧",
		"㊨", "㊩", "㊪", "㊫", "㊬", "㊭", "㊮", "㊯", "㊰", "㋀",
		"㋁", "㋂", "㋃", "㋄", "㋅", "㋆", "㋇", "㋈", "㋉", "㋊",
		"㋋", "㋌", "㋍", "㋎", "㋏", "㋐", "㋑", "㋒", "㋓", "㋔",
		"㋕", "㋖", "㋗", "㋘", "㋙", "㋚", "㋛", "㋜", "㋝", "㋞",
		"㋟", "㋠", "㋡", "㋢", "㋣", "㋤", "㋥", "㋦", "㋧", "㋨",
		"㋩", "㋪", "㋫", "㋬", "㋭", "㋮", "㋯", "㋰", "㋱", "㋲",
		"㋳", "㋴", "㋵", "㋶", "㋷", "㋸", "㋹", "㋺", "㋻", "㋼",
		"㋽", "㋾", "㌀", "㌁", "㌂", "㌃", "㌄", "㌅", "㌆", "㌇",
		"㌈", "㌉", "㌊", "㌋", "㌌", "㌍", "㌎", "㌏", "㌐", "㌑",
		"㌒", "㌓", "㌔", "㌕", "㌖", "㌗", "㌘", "㌙", "㌚", "㌛",
		"㌜", "㌝", "㌞", "㌟", "㌠", "㌡", "㌢", "㌣", "㌤", "㌥",
		"㌦", "㌧", "㌨", "㌩", "㌪", "㌫", "㌬", "㌭", "㌮", "㌯",
		"㌰", "㌱", "㌲", "㌳", "㌴", "㌵", "㌶", "㌷", "㌸", "㌹",
		"㌺", "㌻", "㌼", "㌽", "㌾", "㌿", "㍀", "㍁", "㍂", "㍃",
		"㍄", "㍅", "㍆", "㍇", "㍈", "㍉", "㍊", "㍋", "㍌", "㍍",
		"㍎", "㍏", "㍐", "㍑", "㍒", "㍓", "㍔", "㍕", "㍖", "㍗",
		"ㄅ", "ㄆ", "ㄇ", "ㄈ", "ㄉ", "ㄊ", "ㄋ", "ㄌ", "ㄍ", "ㄎ",
		"ㄏ", "ㄐ", "ㄑ", "ㄒ", "ㄓ", "ㄔ", "ㄕ", "ㄖ", "ㄗ", "ㄘ",
		"ㄙ", "ㄚ", "ㄛ", "ㄜ", "ㄝ", "ㄞ", "ㄟ", "ㄠ", "ㄡ", "ㄢ",
		"ㄣ", "ㄤ", "ㄥ", "ㄦ", "ㄧ", "ㄨ", "ㄩ", "ㄪ", "ㄫ", "ㄬ",
		"ݐ", "ݑ", "ݒ", "ݓ", "ݔ", "ݕ", "ݖ", "ݗ", "ݘ", "ݙ",
		"ݚ", "ݛ", "ݜ", "ݝ", "ݞ", "ݟ", "ݠ", "ݡ", "ݢ", "ݣ",
		"ݤ", "ݥ", "ݦ", "ݧ", "ݨ", "ݩ", "ݪ", "ݫ", "ݬ", "ݭ",
		"ࠀ", "ࠁ", "ࠂ", "ࠃ", "ࠄ", "ࠅ", "ࠆ", "ࠇ", "ࠈ", "ࠉ",
		"ࠊ", "ࠋ", "ࠌ", "ࠍ", "ࠎ", "ࠏ", "ࠐ", "ࠑ", "ࠒ", "ࠓ"
	}
	
	local len: number = math.random(10, 30)
	local arr: {string} = {}
	for i: number = 1, len do
		arr[i] = chars[math.random(1, #chars)]
	end
	return table.concat(arr)
end

local function GregorianToHijri(year: number, month: number, day: number): (number, number, number)
	local a: number = math.floor((14 - month) / 12)
	local y: number = year + 4800 - a
	local m: number = month + 12 * a - 3
	local jd: number = day + math.floor((153 * m + 2) / 5) + 365 * y + math.floor(y / 4) - math.floor(y / 100) + math.floor(y / 400) - 32045
	
	local l: number = jd - 1948440 + 10632
	local n: number = math.floor((l - 1) / 10631)
	l = l - 10631 * n + 354
	local j: number = (math.floor((10985 - l) / 5316)) * (math.floor((50 * l) / 17719)) + (math.floor(l / 5670)) * (math.floor((43 * l) / 15238))
	l = l - (math.floor((30 - j) / 15)) * (math.floor((17719 * j) / 50)) - (math.floor(j / 16)) * (math.floor((15238 * j) / 43)) + 29
	m = math.floor((24 * l) / 709)
	day = l - math.floor((709 * m) / 24)
	month = m
	year = 30 * n + j - 30
	
	return year, month, day
end

local function HijriToGregorian(year: number, month: number, day: number): (number, number, number)
	local jd: number = math.floor((11 * year + 3) / 30) + 354 * year + 30 * month - math.floor((month - 1) / 2) + day + 1948440 - 385
	
	local l: number = jd + 68569
	local n: number = math.floor((4 * l) / 146097)
	l = l - math.floor((146097 * n + 3) / 4)
	local i: number = math.floor((4000 * (l + 1)) / 1461001)
	l = l - math.floor((1461 * i) / 4) + 31
	local j: number = math.floor((80 * l) / 2447)
	day = l - math.floor((2447 * j) / 80)
	l = math.floor(j / 11)
	month = j + 2 - 12 * l
	year = 100 * (n - 49) + i + l
	
	return year, month, day
end

local function GetIslamicDate(gmonth: number, gday: number, gyear: number): string
	local hy: number, hm: number, hd: number = GregorianToHijri(gyear, gmonth, gday)
	local gy: number, gm: number, gd: number = HijriToGregorian(hy, hm, hd)
	return ("%02d %02d"):format(gm, gd)
end

local function CalculateRamazanStart(gyear: number): string
	local hy: number = GregorianToHijri(gyear, 1, 1)
	local gy: number, gm: number, gd: number = HijriToGregorian(hy, 9, 1)
	return ("%02d %02d"):format(gm, gd)
end

local function CalculateKurbanStart(gyear: number): string
	local hy: number = GregorianToHijri(gyear, 1, 1)
	local gy: number, gm: number, gd: number = HijriToGregorian(hy, 12, 10)
	return ("%02d %02d"):format(gm, gd)
end

local function CalculateMevlid(gyear: number): string
	local hy: number = GregorianToHijri(gyear, 1, 1)
	local gy: number, gm: number, gd: number = HijriToGregorian(hy, 3, 12)
	return ("%02d %02d"):format(gm, gd)
end

local function CalculateMirac(gyear: number): string
	local hy: number = GregorianToHijri(gyear, 1, 1)
	local gy: number, gm: number, gd: number = HijriToGregorian(hy, 7, 27)
	return ("%02d %02d"):format(gm, gd)
end

type GarbageData = {
	Visible: boolean;
	Minimized: boolean;
	Tab: string?;
	Filters: {any};
	UI: {[string]: any};
}

type GarbageMethods = {
	new: () -> Garbage;
	Toggle: (Garbage, state: boolean?) -> ();
	Filter: (Garbage, name: string, state: boolean?) -> ();
	Open: (Garbage, target: string) -> ();
	Tab: (Garbage, tab: string) -> ();
	Minimize: (Garbage, state: boolean?) -> ();
	LoadConfig: (Garbage) -> ();
	Destroy: (Garbage) -> ();
}

type Garbage = GarbageData & GarbageMethods

local Garbage: Garbage = {} :: Garbage
Garbage.__index = Garbage

function Garbage.new(): Garbage
	local self: GarbageData = setmetatable({} :: GarbageData, Garbage)
	
	self.Visible = false
	self.Minimized = false
	self.Tab = nil
	self.Filters = {}
	self.UI = {}
	
	if not isfolder("GarbageThing") then
		makefolder("GarbageThing")
	end
	
	if not isfolder("GarbageThing/Images") then
		makefolder("GarbageThing/Images")
	end
	
	local MinimizeImageExists: boolean = false
	local CloseImageExists: boolean = false
	
	if isfile("GarbageThing/Images/minimize.png") then
		MinimizeImageExists = true
	else
		local ok: boolean, MinimizeImage: any = pcall(function(): string
			return game:HttpGet("https://assets.streamlinehq.com/image/private/w_300,h_300,ar_1/f_auto/v1/icons/all-3/shrink-jxkoyu8jp1c1m3toj5waf.png/shrink-c8haz3iieaa0oev8qlz8h.png?_a=DATAiZAAZAA0")
		end)
		if ok and MinimizeImage then
			writefile("GarbageThing/Images/minimize.png", MinimizeImage)
			MinimizeImageExists = true
		end
	end
	
	if isfile("GarbageThing/Images/close.png") then
		CloseImageExists = true
	else
		local ok: boolean, CloseImage: any = pcall(function(): string
			return game:HttpGet("https://assets.streamlinehq.com/image/private/w_300,h_300,ar_1/f_auto/v1/icons/ui-actions/close-2bvdhydne0aehoh6cyv86d.png/close-duch9iwi98meg1h8iu3qp6.png?_a=DATAiZAAZAA0")
		end)
		if ok and CloseImage then
			writefile("GarbageThing/Images/close.png", CloseImage)
			CloseImageExists = true
		end
	end
	
	local Config: {[string]: any} = {
		Filters = {
			Nil = false,
			ReplicatedFirst = false,
			Actor = false,
			Local = true,
			Module = false
		}
	}
	
	if not isfile("GarbageThing/config.json") then
		local ok: boolean, err: any = xpcall(function(): ()
			local Json: string = '{\n  "Filters": {\n    "Nil": false,\n    "ReplicatedFirst": false,\n    "Actor": false,\n    "Local": true,\n    "Module": false\n  }\n}'
			writefile("GarbageThing/config.json", Json)
		end, function(e: any): string
			return debug.traceback(tostring(e))
		end)
		if not ok then
			SWarn("Failed to create config:", err)
		end
	end
	
	local ok2: boolean, data: any = xpcall(function(): any
		return Services.HttpService:JSONDecode(readfile("GarbageThing/config.json"))
	end, function(err: any): string
		return debug.traceback(tostring(err))
	end)
	if ok2 and data then
		Config = data
	else
		SWarn("Failed to load config:", data)
	end
	
	local Parent: any = nil
	local MaxDisplayOrder: number = 2147483647
	
	if gethui then
		local Main: ScreenGui = Instance.new("ScreenGui")
		Main.Name = RandomString()
		Main.ResetOnSpawn = false
		Main.DisplayOrder = MaxDisplayOrder
		Main.Parent = gethui()
		Parent = Main
	elseif Services.CoreGui:FindFirstChild("RobloxGui") then
		Parent = Services.CoreGui.RobloxGui
	else
		local Main: ScreenGui = Instance.new("ScreenGui")
		Main.Name = RandomString()
		Main.ResetOnSpawn = false
		Main.DisplayOrder = MaxDisplayOrder
		Main.Parent = Services.CoreGui
		Parent = Main
	end
	
	self.UI["SG"] = Parent
	
	self.UI["Main"] = Instance.new("Frame", self.UI["SG"])
	self.UI["Main"]["BorderSizePixel"] = 0
	self.UI["Main"]["BackgroundColor3"] = Color3.fromRGB(108, 108, 108)
	self.UI["Main"]["Size"] = UDim2.new(0, 200, 0, 218)
	self.UI["Main"]["Position"] = UDim2.new(0.5, -100, 0.5, -109)
	self.UI["Main"]["Visible"] = false
	
	self.UI["RightLine"] = Instance.new("TextLabel", self.UI["Main"])
	self.UI["RightLine"]["BorderSizePixel"] = 0
	self.UI["RightLine"]["BackgroundColor3"] = Color3.fromRGB(212, 130, 17)
	self.UI["RightLine"]["Size"] = UDim2.new(0, 6, 0, 208)
	self.UI["RightLine"]["Text"] = ""
	self.UI["RightLine"]["Position"] = UDim2.new(0, 196, 0, 12)
	
	self.UI["TopLine"] = Instance.new("TextLabel", self.UI["Main"])
	self.UI["TopLine"]["BorderSizePixel"] = 0
	self.UI["TopLine"]["BackgroundColor3"] = Color3.fromRGB(212, 130, 17)
	self.UI["TopLine"]["Size"] = UDim2.new(0, 202, 0, 6)
	self.UI["TopLine"]["Text"] = ""
	self.UI["TopLine"]["Position"] = UDim2.new(0, 0, 0, 30)
	
	self.UI["LeftLine"] = Instance.new("TextLabel", self.UI["Main"])
	self.UI["LeftLine"]["BorderSizePixel"] = 0
	self.UI["LeftLine"]["BackgroundColor3"] = Color3.fromRGB(212, 130, 17)
	self.UI["LeftLine"]["Size"] = UDim2.new(0, 8, 0, 222)
	self.UI["LeftLine"]["Text"] = ""
	self.UI["LeftLine"]["Position"] = UDim2.new(0, -2, 0, -2)
	
	self.UI["ScriptsTab"] = Instance.new("TextButton", self.UI["Main"])
	self.UI["ScriptsTab"]["BorderSizePixel"] = 0
	self.UI["ScriptsTab"]["TextSize"] = 18
	self.UI["ScriptsTab"]["TextColor3"] = Color3.fromRGB(212, 130, 17)
	self.UI["ScriptsTab"]["BackgroundColor3"] = Color3.fromRGB(108, 108, 108)
	self.UI["ScriptsTab"]["FontFace"] = Font.new("rbxasset://fonts/families/SourceSansPro.json", Enum.FontWeight.Regular, Enum.FontStyle.Normal)
	self.UI["ScriptsTab"]["Size"] = UDim2.new(0, 56, 0, 16)
	self.UI["ScriptsTab"]["Text"] = "Scripts"
	self.UI["ScriptsTab"]["Position"] = UDim2.new(0, 6, 0, 14)
	
	self.UI["Search"] = Instance.new("TextBox", self.UI["Main"])
	self.UI["Search"]["TextXAlignment"] = Enum.TextXAlignment.Left
	self.UI["Search"]["PlaceholderColor3"] = Color3.fromRGB(212, 130, 17)
	self.UI["Search"]["BorderSizePixel"] = 0
	self.UI["Search"]["TextSize"] = 14
	self.UI["Search"]["TextColor3"] = Color3.fromRGB(212, 130, 17)
	self.UI["Search"]["BackgroundColor3"] = Color3.fromRGB(95, 95, 95)
	self.UI["Search"]["FontFace"] = Font.new("rbxasset://fonts/families/SourceSansPro.json", Enum.FontWeight.Regular, Enum.FontStyle.Normal)
	self.UI["Search"]["ClearTextOnFocus"] = false
	self.UI["Search"]["PlaceholderText"] = "Type script name here..."
	self.UI["Search"]["Size"] = UDim2.new(0, 186, 0, 18)
	self.UI["Search"]["Position"] = UDim2.new(0, 8, 0, 38)
	self.UI["Search"]["Text"] = ""
	self.UI["Search"]["ZIndex"] = 9
	self.UI["Search"]["Visible"] = false
	
	self.UI["BottomLine"] = Instance.new("TextLabel", self.UI["Main"])
	self.UI["BottomLine"]["BorderSizePixel"] = 0
	self.UI["BottomLine"]["BackgroundColor3"] = Color3.fromRGB(212, 130, 17)
	self.UI["BottomLine"]["Size"] = UDim2.new(0, 198, 0, 8)
	self.UI["BottomLine"]["Text"] = ""
	self.UI["BottomLine"]["Position"] = UDim2.new(0, 0, 0, 212)
	
	self.UI["ScriptsContent"] = Instance.new("Frame", self.UI["Main"])
	self.UI["ScriptsContent"]["Visible"] = false
	self.UI["ScriptsContent"]["BorderSizePixel"] = 0
	self.UI["ScriptsContent"]["BackgroundColor3"] = Color3.fromRGB(108, 108, 108)
	self.UI["ScriptsContent"]["Size"] = UDim2.new(0, 186, 0, 170)
	self.UI["ScriptsContent"]["Position"] = UDim2.new(0, 10, 0, 40)
	
	self.UI["ConfigContent"] = Instance.new("Frame", self.UI["Main"])
	self.UI["ConfigContent"]["Visible"] = false
	self.UI["ConfigContent"]["BorderSizePixel"] = 0
	self.UI["ConfigContent"]["BackgroundColor3"] = Color3.fromRGB(108, 108, 108)
	self.UI["ConfigContent"]["Size"] = UDim2.new(0, 186, 0, 170)
	self.UI["ConfigContent"]["Position"] = UDim2.new(0, 10, 0, 40)
	
	self.UI["FilterButton"] = Instance.new("TextButton", self.UI["ConfigContent"])
	self.UI["FilterButton"]["TextWrapped"] = true
	self.UI["FilterButton"]["BorderSizePixel"] = 0
	self.UI["FilterButton"]["TextScaled"] = true
	self.UI["FilterButton"]["TextColor3"] = Color3.fromRGB(212, 130, 17)
	self.UI["FilterButton"]["BackgroundColor3"] = Color3.fromRGB(95, 95, 95)
	self.UI["FilterButton"]["FontFace"] = Font.new("rbxasset://fonts/families/SourceSansPro.json", Enum.FontWeight.Regular, Enum.FontStyle.Normal)
	self.UI["FilterButton"]["Size"] = UDim2.new(0, 190, 0, 14)
	self.UI["FilterButton"]["Text"] = "Click me to see Filters"
	self.UI["FilterButton"]["Position"] = UDim2.new(0, -4, 0, -2)
	
	self.UI["FiltersFrame"] = Instance.new("Frame", self.UI["FilterButton"])
	self.UI["FiltersFrame"]["BorderSizePixel"] = 0
	self.UI["FiltersFrame"]["BackgroundColor3"] = Color3.fromRGB(108, 108, 108)
	self.UI["FiltersFrame"]["Size"] = UDim2.new(0, 186, 0, 126)
	self.UI["FiltersFrame"]["Position"] = UDim2.new(0, 0, 0, 16)
	self.UI["FiltersFrame"]["Visible"] = false
	
	self.UI["ModuleButton"] = Instance.new("TextButton", self.UI["FiltersFrame"])
	self.UI["ModuleButton"]["TextWrapped"] = true
	self.UI["ModuleButton"]["BorderSizePixel"] = 0
	self.UI["ModuleButton"]["TextSize"] = 18
	self.UI["ModuleButton"]["TextColor3"] = Color3.fromRGB(208, 208, 208)
	self.UI["ModuleButton"]["BackgroundColor3"] = Color3.fromRGB(212, 130, 17)
	self.UI["ModuleButton"]["FontFace"] = Font.new("rbxasset://fonts/families/SourceSansPro.json", Enum.FontWeight.Regular, Enum.FontStyle.Normal)
	self.UI["ModuleButton"]["Size"] = UDim2.new(0, 186, 0, 20)
	self.UI["ModuleButton"]["Text"] = "Module"
	self.UI["ModuleButton"]["Position"] = UDim2.new(0, 0, 0, 104)
	
	self.UI["ModuleIndicator"] = Instance.new("TextLabel", self.UI["ModuleButton"])
	self.UI["ModuleIndicator"]["BorderSizePixel"] = 0
	self.UI["ModuleIndicator"]["BackgroundColor3"] = Color3.fromRGB(208, 26, 19)
	self.UI["ModuleIndicator"]["Size"] = UDim2.new(0, 38, 0, 20)
	self.UI["ModuleIndicator"]["Text"] = ""
	self.UI["ModuleIndicator"]["Position"] = UDim2.new(0, 148, 0, 0)
	
	self.UI["ActorButton"] = Instance.new("TextButton", self.UI["FiltersFrame"])
	self.UI["ActorButton"]["TextWrapped"] = true
	self.UI["ActorButton"]["BorderSizePixel"] = 0
	self.UI["ActorButton"]["TextSize"] = 18
	self.UI["ActorButton"]["TextColor3"] = Color3.fromRGB(208, 208, 208)
	self.UI["ActorButton"]["BackgroundColor3"] = Color3.fromRGB(212, 130, 17)
	self.UI["ActorButton"]["FontFace"] = Font.new("rbxasset://fonts/families/SourceSansPro.json", Enum.FontWeight.Regular, Enum.FontStyle.Normal)
	self.UI["ActorButton"]["Size"] = UDim2.new(0, 186, 0, 20)
	self.UI["ActorButton"]["Text"] = "Actor"
	self.UI["ActorButton"]["Position"] = UDim2.new(0, 0, 0, 54)
	
	self.UI["ActorIndicator"] = Instance.new("TextLabel", self.UI["ActorButton"])
	self.UI["ActorIndicator"]["BorderSizePixel"] = 0
	self.UI["ActorIndicator"]["BackgroundColor3"] = Color3.fromRGB(208, 26, 19)
	self.UI["ActorIndicator"]["Size"] = UDim2.new(0, 38, 0, 20)
	self.UI["ActorIndicator"]["Text"] = ""
	self.UI["ActorIndicator"]["Position"] = UDim2.new(0, 148, 0, 0)
	
	self.UI["ReplicatedFirstButton"] = Instance.new("TextButton", self.UI["FiltersFrame"])
	self.UI["ReplicatedFirstButton"]["TextWrapped"] = true
	self.UI["ReplicatedFirstButton"]["BorderSizePixel"] = 0
	self.UI["ReplicatedFirstButton"]["TextSize"] = 18
	self.UI["ReplicatedFirstButton"]["TextColor3"] = Color3.fromRGB(208, 208, 208)
	self.UI["ReplicatedFirstButton"]["BackgroundColor3"] = Color3.fromRGB(212, 130, 17)
	self.UI["ReplicatedFirstButton"]["FontFace"] = Font.new("rbxasset://fonts/families/SourceSansPro.json", Enum.FontWeight.Regular, Enum.FontStyle.Normal)
	self.UI["ReplicatedFirstButton"]["Size"] = UDim2.new(0, 186, 0, 20)
	self.UI["ReplicatedFirstButton"]["Text"] = "ReplicatedFirst"
	self.UI["ReplicatedFirstButton"]["Position"] = UDim2.new(0, 0, 0, 28)
	
	self.UI["ReplicatedFirstIndicator"] = Instance.new("TextLabel", self.UI["ReplicatedFirstButton"])
	self.UI["ReplicatedFirstIndicator"]["BorderSizePixel"] = 0
	self.UI["ReplicatedFirstIndicator"]["BackgroundColor3"] = Color3.fromRGB(208, 26, 19)
	self.UI["ReplicatedFirstIndicator"]["Size"] = UDim2.new(0, 38, 0, 20)
	self.UI["ReplicatedFirstIndicator"]["Text"] = ""
	self.UI["ReplicatedFirstIndicator"]["Position"] = UDim2.new(0, 148, 0, 0)
	
	self.UI["NilButton"] = Instance.new("TextButton", self.UI["FiltersFrame"])
	self.UI["NilButton"]["TextWrapped"] = true
	self.UI["NilButton"]["BorderSizePixel"] = 0
	self.UI["NilButton"]["TextSize"] = 18
	self.UI["NilButton"]["TextColor3"] = Color3.fromRGB(208, 208, 208)
	self.UI["NilButton"]["BackgroundColor3"] = Color3.fromRGB(212, 130, 17)
	self.UI["NilButton"]["FontFace"] = Font.new("rbxasset://fonts/families/SourceSansPro.json", Enum.FontWeight.Regular, Enum.FontStyle.Normal)
	self.UI["NilButton"]["Size"] = UDim2.new(0, 186, 0, 18)
	self.UI["NilButton"]["Text"] = "Nil"
	self.UI["NilButton"]["Position"] = UDim2.new(0, 0, 0, 4)
	
	self.UI["NilIndicator"] = Instance.new("TextLabel", self.UI["NilButton"])
	self.UI["NilIndicator"]["BorderSizePixel"] = 0
	self.UI["NilIndicator"]["BackgroundColor3"] = Color3.fromRGB(208, 26, 19)
	self.UI["NilIndicator"]["Size"] = UDim2.new(0, 38, 0, 18)
	self.UI["NilIndicator"]["Text"] = ""
	self.UI["NilIndicator"]["Position"] = UDim2.new(0, 148, 0, 0)
	
	self.UI["LocalButton"] = Instance.new("TextButton", self.UI["FiltersFrame"])
	self.UI["LocalButton"]["TextWrapped"] = true
	self.UI["LocalButton"]["BorderSizePixel"] = 0
	self.UI["LocalButton"]["TextSize"] = 18
	self.UI["LocalButton"]["TextColor3"] = Color3.fromRGB(208, 208, 208)
	self.UI["LocalButton"]["BackgroundColor3"] = Color3.fromRGB(212, 130, 17)
	self.UI["LocalButton"]["FontFace"] = Font.new("rbxasset://fonts/families/SourceSansPro.json", Enum.FontWeight.Regular, Enum.FontStyle.Normal)
	self.UI["LocalButton"]["Size"] = UDim2.new(0, 186, 0, 20)
	self.UI["LocalButton"]["Text"] = "Local"
	self.UI["LocalButton"]["Position"] = UDim2.new(0, 0, 0, 80)
	
	self.UI["LocalIndicator"] = Instance.new("TextLabel", self.UI["LocalButton"])
	self.UI["LocalIndicator"]["BorderSizePixel"] = 0
	self.UI["LocalIndicator"]["BackgroundColor3"] = Color3.fromRGB(76, 175, 80)
	self.UI["LocalIndicator"]["Size"] = UDim2.new(0, 38, 0, 20)
	self.UI["LocalIndicator"]["Text"] = ""
	self.UI["LocalIndicator"]["Position"] = UDim2.new(0, 148, 0, 0)
	
	self.UI["Title"] = Instance.new("TextLabel", self.UI["Main"])
	self.UI["Title"]["TextXAlignment"] = Enum.TextXAlignment.Left
	self.UI["Title"]["TextWrapped"] = true
	self.UI["Title"]["BorderSizePixel"] = 0
	self.UI["Title"]["TextSize"] = 11
	self.UI["Title"]["BackgroundColor3"] = Color3.fromRGB(212, 130, 17)
	self.UI["Title"]["FontFace"] = Font.new("rbxasset://fonts/families/SourceSansPro.json", Enum.FontWeight.Regular, Enum.FontStyle.Normal)
	self.UI["Title"]["TextColor3"] = Color3.fromRGB(154, 95, 12)
	self.UI["Title"]["Size"] = UDim2.new(0, 202, 0, 16)
	self.UI["Title"]["Position"] = UDim2.new(0, 0, 0, -2)
	
	local Year: number = tonumber(os.date("%Y")) :: number
	local Hour: number = tonumber(os.date("%H")) :: number
	
	local Player: Player? = Services.Players.LocalPlayer
	local DisplayName: string = Player and (Player.DisplayName ~= "" and Player.DisplayName or Player.Name) or "User"
	
	local TimeGreeting: string
	local TimeEmoji: string
	if Hour >= 5 and Hour < 12 then
		TimeGreeting = "Good Morning"
		TimeEmoji = "🌅"
	elseif Hour >= 12 and Hour < 17 then
		TimeGreeting = "Good Afternoon"
		TimeEmoji = "☀️"
	elseif Hour >= 17 and Hour < 21 then
		TimeGreeting = "Good Evening"
		TimeEmoji = "🌆"
	else
		TimeGreeting = "Hello Owl"
		TimeEmoji = "🦉"
	end
	
	local Eclipses: {[number]: {[string]: string}} = {
		[2026] = {["03 03"] = "🌑", ["08 12"] = "☀️", ["08 28"] = "🌘"},
		[2027] = {["02 06"] = "☀️", ["08 02"] = "☀️"},
		[2028] = {["01 12"] = "🌘", ["07 06"] = "🌑", ["07 22"] = "☀️", ["12 31"] = "🌑"},
		[2029] = {["01 01"] = "🌑", ["06 26"] = "🌑", ["12 20"] = "☀️"},
		[2030] = {["06 01"] = "☀️", ["06 15"] = "🌑", ["11 25"] = "☀️", ["12 09"] = "🌑"}
	}
	
	local CurrentEclipse: string? = nil
	if Eclipses[Year] then
		CurrentEclipse = Eclipses[Year][os.date("%m %d")]
	end
	
	local SpecialDays: {[string]: {emoji: string?, message: string}} = {
		["01 01"] = {emoji = "🎆", message = `Happy New Year, {DisplayName}!`},
		["02 14"] = {emoji = "💝", message = `Happy Valentine's Day, {DisplayName}!`},
		["03 08"] = {emoji = "💐", message = `Happy Women's Day, {DisplayName}!`},
		["03 17"] = {emoji = "☘️", message = `Happy St. Patrick's Day, {DisplayName}!`},
		["04 01"] = {emoji = "🤡", message = `Happy April Fools' Day, {DisplayName}!`},
		["04 23"] = {emoji = "📚", message = `Happy National Sovereignty Day, {DisplayName}!`},
		["05 01"] = {emoji = "⚒️", message = `Happy Labor Day, {DisplayName}!`},
		["05 19"] = {emoji = "🇹🇷", message = `Happy Commemoration of Atatürk Day, {DisplayName}!`},
		["06 19"] = {emoji = "👔", message = `Happy Father's Day, {DisplayName}!`},
		["07 04"] = {emoji = "🇺🇸", message = `Happy Independence Day, {DisplayName}!`},
		["08 30"] = {emoji = "🏆", message = `Happy Victory Day, {DisplayName}!`},
		["10 29"] = {emoji = "🇹🇷", message = `Happy Republic Day, {DisplayName}!`},
		["10 31"] = {emoji = "🎃", message = `Happy Halloween, {DisplayName}!`},
		["11 10"] = {emoji = "🇹🇷", message = `Today is Atatürk's Day! {TimeGreeting}, {DisplayName}!`},
		["12 25"] = {emoji = "🎄", message = `Merry Christmas, {DisplayName}!`},
		["12 31"] = {emoji = "🎉", message = `Happy New Year's Eve, {DisplayName}!`}
	}
	
	local EasterDate: string = (function(Y: number): string
		local A: number = math.floor(Y/100)
		local B: number = math.floor((13+8*A)/25)
		local C: number = (15-B+A-math.floor(A/4))%30
		local D: number = (4+A-math.floor(A/4))%7
		local E: number = (19*(Y%19)+C)%30
		local F: number = (2*(Y%4)+4*(Y%7)+6*E+D)%7
		local G: number = (22+E+F)
		if E == 29 and F == 6 then
			return "04 19"
		elseif E == 28 and F == 6 then
			return "04 18"
		elseif 31 < G then
			return ("04 %02d"):format(G-31)
		end
		return ("03 %02d"):format(G)
	end)(Year)
	
	SpecialDays[EasterDate] = {emoji = "🥚", message = `Happy Easter, {DisplayName}!`}
	
	local RamazanDate: string = CalculateRamazanStart(Year)
	local KurbanDate: string = CalculateKurbanStart(Year)
	local MevlidDate: string = CalculateMevlid(Year)
	local MiracDate: string = CalculateMirac(Year)
	
	SpecialDays[RamazanDate] = {emoji = "🌙", message = `Ramazan Kareem, {DisplayName}!`}
	SpecialDays[KurbanDate] = {emoji = "🐑", message = `Eid al-Adha Mubarak, {DisplayName}!`}
	SpecialDays[MevlidDate] = {emoji = "☪️", message = `Blessed Mawlid, {DisplayName}!`}
	SpecialDays[MiracDate] = {emoji = "🌟", message = `Blessed Lailat al-Miraj, {DisplayName}!`}
	
	local TodayDate: string = os.date("%m %d")
	local FinalMessage: string
	local FinalEmoji: string?
	
	if CurrentEclipse then
		FinalEmoji = CurrentEclipse
		FinalMessage = `Eclipse Today! {TimeGreeting}, {DisplayName}!`
	elseif SpecialDays[TodayDate] then
		local DayData: any = SpecialDays[TodayDate]
		FinalMessage = DayData.message
		FinalEmoji = DayData.emoji
	else
		FinalEmoji = TimeEmoji
		FinalMessage = `{TimeGreeting}, {DisplayName}!`
	end
	
	if FinalEmoji then
		self.UI["Title"]["Text"] = `{FinalEmoji} • {FinalMessage}`
	else
		self.UI["Title"]["Text"] = FinalMessage
	end
	
	if MinimizeImageExists then
		self.UI["MinimizeBtn"] = Instance.new("ImageButton", self.UI["Main"])
		self.UI["MinimizeBtn"]["BorderSizePixel"] = 0
		self.UI["MinimizeBtn"]["BackgroundColor3"] = Color3.fromRGB(212, 130, 17)
		self.UI["MinimizeBtn"]["Size"] = UDim2.new(0, 16, 0, 16)
		self.UI["MinimizeBtn"]["Position"] = UDim2.new(1, -34, 0, -2)
		self.UI["MinimizeBtn"]["Image"] = getcustomasset("GarbageThing/Images/minimize.png")
		self.UI["MinimizeBtn"]["ScaleType"] = Enum.ScaleType.Fit
	else
		self.UI["MinimizeBtn"] = Instance.new("TextButton", self.UI["Main"])
		self.UI["MinimizeBtn"]["BorderSizePixel"] = 0
		self.UI["MinimizeBtn"]["BackgroundColor3"] = Color3.fromRGB(212, 130, 17)
		self.UI["MinimizeBtn"]["Size"] = UDim2.new(0, 16, 0, 16)
		self.UI["MinimizeBtn"]["Position"] = UDim2.new(1, -34, 0, -2)
		self.UI["MinimizeBtn"]["Text"] = "—"
		self.UI["MinimizeBtn"]["TextSize"] = 18
		self.UI["MinimizeBtn"]["TextColor3"] = Color3.fromRGB(154, 95, 12)
		self.UI["MinimizeBtn"]["FontFace"] = Font.new("rbxasset://fonts/families/SourceSansPro.json", Enum.FontWeight.Bold, Enum.FontStyle.Normal)
	end
	
	if CloseImageExists then
		self.UI["CloseBtn"] = Instance.new("ImageButton", self.UI["Main"])
		self.UI["CloseBtn"]["BorderSizePixel"] = 0
		self.UI["CloseBtn"]["BackgroundColor3"] = Color3.fromRGB(212, 130, 17)
		self.UI["CloseBtn"]["Size"] = UDim2.new(0, 16, 0, 16)
		self.UI["CloseBtn"]["Position"] = UDim2.new(1, -16, 0, -2)
		self.UI["CloseBtn"]["Image"] = getcustomasset("GarbageThing/Images/close.png")
		self.UI["CloseBtn"]["ScaleType"] = Enum.ScaleType.Fit
	else
		self.UI["CloseBtn"] = Instance.new("TextButton", self.UI["Main"])
		self.UI["CloseBtn"]["BorderSizePixel"] = 0
		self.UI["CloseBtn"]["BackgroundColor3"] = Color3.fromRGB(212, 130, 17)
		self.UI["CloseBtn"]["Size"] = UDim2.new(0, 16, 0, 16)
		self.UI["CloseBtn"]["Position"] = UDim2.new(1, -16, 0, -2)
		self.UI["CloseBtn"]["Text"] = "X"
		self.UI["CloseBtn"]["TextSize"] = 14
		self.UI["CloseBtn"]["TextColor3"] = Color3.fromRGB(154, 95, 12)
		self.UI["CloseBtn"]["FontFace"] = Font.new("rbxasset://fonts/families/SourceSansPro.json", Enum.FontWeight.Bold, Enum.FontStyle.Normal)
	end
	
	self.UI["ConfigTab"] = Instance.new("TextButton", self.UI["Main"])
	self.UI["ConfigTab"]["BorderSizePixel"] = 0
	self.UI["ConfigTab"]["TextSize"] = 18
	self.UI["ConfigTab"]["TextColor3"] = Color3.fromRGB(212, 130, 17)
	self.UI["ConfigTab"]["BackgroundColor3"] = Color3.fromRGB(108, 108, 108)
	self.UI["ConfigTab"]["FontFace"] = Font.new("rbxasset://fonts/families/SourceSansPro.json", Enum.FontWeight.Regular, Enum.FontStyle.Normal)
	self.UI["ConfigTab"]["Size"] = UDim2.new(0, 132, 0, 16)
	self.UI["ConfigTab"]["Text"] = "Config"
	self.UI["ConfigTab"]["Position"] = UDim2.new(0, 64, 0, 14)
	
	self.UI["MidLine"] = Instance.new("TextLabel", self.UI["Main"])
	self.UI["MidLine"]["BorderSizePixel"] = 0
	self.UI["MidLine"]["BackgroundColor3"] = Color3.fromRGB(212, 130, 17)
	self.UI["MidLine"]["Size"] = UDim2.new(0, 4, 0, 20)
	self.UI["MidLine"]["Text"] = ""
	self.UI["MidLine"]["Position"] = UDim2.new(0, 60, 0, 12)
	
	self.UI["MidLineCorner"] = Instance.new("UICorner", self.UI["MidLine"])
	
	self.UI["Loading"] = Instance.new("Frame", self.UI["SG"])
	self.UI["Loading"]["BorderSizePixel"] = 0
	self.UI["Loading"]["BackgroundColor3"] = Color3.fromRGB(108, 108, 108)
	self.UI["Loading"]["Size"] = UDim2.new(0, 246, 0, 30)
	self.UI["Loading"]["Position"] = UDim2.new(0.5, -123, 0.5, -15)
	
	self.UI["LoadingText"] = Instance.new("TextLabel", self.UI["Loading"])
	self.UI["LoadingText"]["TextWrapped"] = true
	self.UI["LoadingText"]["BorderSizePixel"] = 0
	self.UI["LoadingText"]["TextSize"] = 22
	self.UI["LoadingText"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255)
	self.UI["LoadingText"]["FontFace"] = Font.new("rbxasset://fonts/families/SourceSansPro.json", Enum.FontWeight.Regular, Enum.FontStyle.Normal)
	self.UI["LoadingText"]["TextColor3"] = Color3.fromRGB(212, 130, 17)
	self.UI["LoadingText"]["BackgroundTransparency"] = 1
	self.UI["LoadingText"]["Size"] = UDim2.new(0, 246, 0, 12)
	self.UI["LoadingText"]["Text"] = "Loading... Please be Patient!"
	
	self.UI["LoadingLine"] = Instance.new("TextLabel", self.UI["Loading"])
	self.UI["LoadingLine"]["BorderSizePixel"] = 0
	self.UI["LoadingLine"]["BackgroundColor3"] = Color3.fromRGB(8, 8, 8)
	self.UI["LoadingLine"]["Size"] = UDim2.new(0, 246, 0, 2)
	self.UI["LoadingLine"]["Text"] = ""
	self.UI["LoadingLine"]["Position"] = UDim2.new(0, 0, 0, 14)
	
	self.UI["LoadingBar"] = Instance.new("TextLabel", self.UI["Loading"])
	self.UI["LoadingBar"]["BorderSizePixel"] = 0
	self.UI["LoadingBar"]["BackgroundColor3"] = Color3.fromRGB(100, 164, 40)
	self.UI["LoadingBar"]["Size"] = UDim2.new(0, 30, 0, 12)
	self.UI["LoadingBar"]["Text"] = "1%"
	self.UI["LoadingBar"]["Position"] = UDim2.new(0, 0, 0, 18)
	
	local function Drag(Frame: any, Handle: any): ()
		task.spawn(function(): ()
			local Dragging: boolean
			local DragInput: any
			local DragStart: Vector3 = Vector3.new(0, 0, 0)
			local StartPos: UDim2
			
			local function Update(Input: any): ()
				local Delta: any = Input.Position - DragStart
				local Position: UDim2 = UDim2.new(StartPos.X.Scale, StartPos.X.Offset + Delta.X, StartPos.Y.Scale, StartPos.Y.Offset + Delta.Y)
				Services.TweenService:Create(Frame, TweenInfo.new(0.2), {Position = Position}):Play()
			end
			
			Handle.InputBegan:Connect(function(Input: any): ()
				if Input.UserInputType == Enum.UserInputType.MouseButton1 or Input.UserInputType == Enum.UserInputType.Touch then
					Dragging = true
					DragStart = Input.Position
					StartPos = Frame.Position
					
					Input.Changed:Connect(function(): ()
						if Input.UserInputState == Enum.UserInputState.End then
							Dragging = false
						end
					end)
				end
			end)
			
			Handle.InputChanged:Connect(function(Input: any): ()
				if Input.UserInputType == Enum.UserInputType.MouseMovement or Input.UserInputType == Enum.UserInputType.Touch then
					DragInput = Input
				end
			end)
			
			Services.UserInputService.InputChanged:Connect(function(Input: any): ()
				if Input == DragInput and Dragging then
					Update(Input)
				end
			end)
		end)
	end
	
	Drag(self.UI["Main"], self.UI["Title"])
	
	local FilterData: any = {
		{Button = self.UI["NilButton"], Indicator = self.UI["NilIndicator"], Name = "Nil", State = Config.Filters.Nil},
		{Button = self.UI["ReplicatedFirstButton"], Indicator = self.UI["ReplicatedFirstIndicator"], Name = "ReplicatedFirst", State = Config.Filters.ReplicatedFirst},
		{Button = self.UI["ActorButton"], Indicator = self.UI["ActorIndicator"], Name = "Actor", State = Config.Filters.Actor},
		{Button = self.UI["LocalButton"], Indicator = self.UI["LocalIndicator"], Name = "Local", State = Config.Filters.Local},
		{Button = self.UI["ModuleButton"], Indicator = self.UI["ModuleIndicator"], Name = "Module", State = Config.Filters.Module}
	}
	
	for Index: number, Filter: any in FilterData do
		self.Filters[Index] = Filter
		local Color: Color3 = Filter.State and Color3.fromRGB(76, 175, 80) or Color3.fromRGB(208, 26, 19)
		Filter.Indicator.BackgroundColor3 = Color
	end
	
	local Object: any = self
	
	self.UI["ScriptsTab"].MouseButton1Click:Connect(function(): ()
		Garbage.Tab(Object, "Scripts")
	end)
	
	self.UI["ConfigTab"].MouseButton1Click:Connect(function(): ()
		Garbage.Tab(Object, "Config")
	end)
	
	self.UI["FilterButton"].MouseButton1Click:Connect(function(): ()
		Garbage.Open(Object, "Filters")
	end)
	
	for Index: number, Filter: any in FilterData do
		Filter.Button.MouseButton1Click:Connect(function(): ()
			Garbage.Filter(Object, Filter.Name)
		end)
	end
	
	self.UI["MinimizeBtn"].MouseButton1Click:Connect(function(): ()
		Garbage.Minimize(Object)
	end)
	
	self.UI["CloseBtn"].MouseButton1Click:Connect(function(): ()
		Garbage.Destroy(Object)
	end)
	
	task.spawn(function(): ()
		local HasImages: boolean = MinimizeImageExists and CloseImageExists
		local WaitTime: number = HasImages and 0.005 or 0.01
		
		for Index: number = 1, 100 do
			self.UI["LoadingBar"]["Size"] = UDim2.new(0, Index * 2.46, 0, 12)
			self.UI["LoadingBar"]["Text"] = Index .. "%"
			task.wait(WaitTime)
		end
		
		self.UI["Loading"]:Destroy()
		self.UI["Main"]["Visible"] = true
		Garbage.Tab(Object, "Scripts")
	end)
	
	return (self :: any) :: Garbage
end

function Garbage:Toggle(state: boolean?): ()
	if state == nil then
		self.Visible = not self.Visible
	else
		self.Visible = state
	end
	self.UI["Main"]["Visible"] = self.Visible
end

function Garbage:Filter(name: string, state: boolean?): ()
	for Index: number, Filter: any in self.Filters do
		if Filter.Name == name then
			if state == nil then
				local Active: number = 0
				for J: number, FilterItem: any in self.Filters do
					if FilterItem.State then
						Active += 1
					end
				end
				if Active <= 1 and Filter.State then
					return
				end
				Filter.State = not Filter.State
			else
				if not state then
					local Active: number = 0
					for J: number, FilterItem: any in self.Filters do
						if FilterItem.State then
							Active += 1
						end
					end
					if Active <= 1 then
						return
					end
				end
				Filter.State = state
			end
			
			local Color: Color3 = Filter.State and Color3.fromRGB(76, 175, 80) or Color3.fromRGB(208, 26, 19)
			Services.TweenService:Create(Filter.Indicator, TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
				BackgroundColor3 = Color
			}):Play()
			
			local Json: string = '{\n  "Filters": {\n    "Nil": ' .. tostring(self.Filters[1].State) .. ',\n    "ReplicatedFirst": ' .. tostring(self.Filters[2].State) .. ',\n    "Actor": ' .. tostring(self.Filters[3].State) .. ',\n    "Local": ' .. tostring(self.Filters[4].State) .. ',\n    "Module": ' .. tostring(self.Filters[5].State) .. '\n  }\n}'
			local ok: boolean, err: any = xpcall(function(): ()
				writefile("GarbageThing/config.json", Json)
			end, function(e: any): string
				return debug.traceback(tostring(e))
			end)
			if not ok then
				SWarn("Failed to save config:", err)
			end
			break
		end
	end
end

function Garbage:Open(target: string): ()
	if target == "Filters" then
		local Current: boolean = self.UI["FiltersFrame"]["Visible"]
		self.UI["FiltersFrame"]["Visible"] = not Current
	end
end

function Garbage:Tab(tab: string): ()
	if self.Tab == tab then
		return
	end
	
	if self.Tab then
		local PreviousTab: any = self.Tab == "Scripts" and self.UI["ScriptsTab"] or self.UI["ConfigTab"]
		Services.TweenService:Create(PreviousTab, TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
			BackgroundColor3 = Color3.fromRGB(108, 108, 108)
		}):Play()
	end
	
	self.Tab = tab
	local NewTab: any = tab == "Scripts" and self.UI["ScriptsTab"] or self.UI["ConfigTab"]
	Services.TweenService:Create(NewTab, TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
		BackgroundColor3 = Color3.fromRGB(76, 175, 80)
	}):Play()
	
	if tab == "Scripts" then
		self.UI["Search"]["Visible"] = true
		self.UI["ScriptsContent"]["Visible"] = true
		self.UI["ConfigContent"]["Visible"] = false
	else
		self.UI["Search"]["Visible"] = false
		self.UI["ScriptsContent"]["Visible"] = false
		self.UI["ConfigContent"]["Visible"] = true
	end
end

function Garbage:Minimize(state: boolean?): ()
	if state == nil then
		self.Minimized = not self.Minimized
	else
		self.Minimized = state
	end
	
	if self.Minimized then
		self.UI["ScriptsContent"]["Visible"] = false
		self.UI["ConfigContent"]["Visible"] = false
		self.UI["Search"]["Visible"] = false
		self.UI["ScriptsTab"]["Visible"] = false
		self.UI["ConfigTab"]["Visible"] = false
		self.UI["MidLine"]["Visible"] = false
		self.UI["TopLine"]["Visible"] = false
		self.UI["BottomLine"]["Visible"] = false
		self.UI["RightLine"]["Visible"] = false
		self.UI["LeftLine"]["Visible"] = false
		
		self.UI["Main"]["Size"] = UDim2.new(0, 202, 0, 16)
		self.UI["Main"]["BackgroundTransparency"] = 1
		self.UI["MinimizeBtn"]["Position"] = UDim2.new(1, -34, 0, 0)
		self.UI["CloseBtn"]["Position"] = UDim2.new(1, -16, 0, 0)
		self.UI["Title"]["Position"] = UDim2.new(0, 0, 0, 0)
	else
		self.UI["ScriptsTab"]["Visible"] = true
		self.UI["ConfigTab"]["Visible"] = true
		self.UI["MidLine"]["Visible"] = true
		self.UI["TopLine"]["Visible"] = true
		self.UI["BottomLine"]["Visible"] = true
		self.UI["RightLine"]["Visible"] = true
		self.UI["LeftLine"]["Visible"] = true
		
		self.UI["Main"]["Size"] = UDim2.new(0, 200, 0, 218)
		self.UI["Main"]["BackgroundTransparency"] = 0
		self.UI["MinimizeBtn"]["Position"] = UDim2.new(1, -34, 0, -2)
		self.UI["CloseBtn"]["Position"] = UDim2.new(1, -16, 0, -2)
		self.UI["Title"]["Position"] = UDim2.new(0, 0, 0, -2)
		
		if self.Tab == "Scripts" then
			self.UI["Search"]["Visible"] = true
			self.UI["ScriptsContent"]["Visible"] = true
		else
			self.UI["ConfigContent"]["Visible"] = true
		end
	end
end

function Garbage:LoadConfig(): ()
	local ok: boolean, data: any = xpcall(function(): any
		if not isfile("GarbageThing/config.json") then
			return nil
		end
		return Services.HttpService:JSONDecode(readfile("GarbageThing/config.json"))
	end, function(err: any): string
		return debug.traceback(tostring(err))
	end)
	
	if ok and data and data.Filters then
		for Index: number, Filter: any in self.Filters do
			if data.Filters[Filter.Name] ~= nil then
				Filter.State = data.Filters[Filter.Name]
				local Color: Color3 = Filter.State and Color3.fromRGB(76, 175, 80) or Color3.fromRGB(208, 26, 19)
				Filter.Indicator.BackgroundColor3 = Color
			end
		end
	else
		SWarn("Failed to load config:", data)
	end
end

function Garbage:Destroy(): ()
	if self.UI and self.UI["SG"] then
		self.UI["SG"]:Destroy()
	end
end

return Garbage.new()