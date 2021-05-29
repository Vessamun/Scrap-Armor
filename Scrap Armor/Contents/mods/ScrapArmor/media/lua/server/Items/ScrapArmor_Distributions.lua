require 'Items/SuburbsDistributions';

--##################################################################################
-- Code adapted from the excelent Commander's Mods - Hobbies - PZCF_HobbyDistribution.lua
-- @ https://steamcommunity.com/sharedfiles/filedetails/?id=2321449952
--##################################################################################


--##################################################################################
-- Util Functions
--##################################################################################

local function insertTable(t1, t2)
	local n = #t1
	for i=1,#t2 do 
		t1[n+i] = t2[i]
	end
end

local function createProcList(name, minValue, maxValue)
	local procList = {}
	procList["name"] = name
	procList["min"] = minValue
	procList["max"] = maxValue
	return procList
end

local function insertProcList(roomdef, container, list)
	if roomdef ~= nil and container ~= nil then
		if SuburbsDistributions[roomdef] and SuburbsDistributions[roomdef][container] then
			table.insert(SuburbsDistributions[roomdef][container].procList, list)
		else
			print("insertProcList: error generating list for "..roomdef.."-"..container)
		end
	end
end

--##################################################################################
-- Item Reference Tables
--##################################################################################

--Magazines

--Bookstore
local ScrapArmor_Magbase = {
	"SArmor.ArmorMag1", 0.15,
	"SArmor.ArmorMag2", 0.15,
	"SArmor.ArmorMag3", 0.07,
	"SArmor.ArmorMag4", 0.05,
	"SArmor.ArmorMag5", 0.03,

}
--Assorted Shelves (Homes)
local ScrapArmor_Magshelves = {
    "SArmor.ArmorMag1", 0.09,
    "SArmor.ArmorMag2", 0.09,
	"SArmor.ArmorMag3", 0.06,
	"SArmor.ArmorMag4", 0.04,
	"SArmor.ArmorMag5", 0.02,
	"SArmor.Rucksack", 0.5,
}
--Garage All
local ScrapArmor_Maggarage = {
    "SArmor.ArmorMag1", 0.05,
	"SArmor.ArmorMag2", 0.05,
	"SArmor.ArmorMag3", 0.03,
	"SArmor.ArmorMag4", 0.02,
	"SArmor.ArmorMag5", 0.01,
	"SArmor.Rucksack", 0.5,
}        




--##################################################################################
-- Base Distribution Table Modifications
--##################################################################################

--MAGS
insertTable(SuburbsDistributions["library"]["counter"].items, ScrapArmor_Magbase)
insertTable(SuburbsDistributions["bookstore"]["other"].items, ScrapArmor_Magbase)
insertTable(SuburbsDistributions["gigamart"]["shelvesmag"].items, ScrapArmor_Magbase)
insertTable(SuburbsDistributions["Electrician"]["counter"].items, ScrapArmor_Magbase)
insertTable(SuburbsDistributions["all"]["shelves"].items, ScrapArmor_Magshelves)
insertTable(SuburbsDistributions["all"]["shelvesmag"].items, ScrapArmor_Magshelves)
--insertTable(SuburbsDistributions["all"]["sidetable"].items, ScrapArmor_Magshelves)
insertTable(SuburbsDistributions["poststorage"]["all"].items, ScrapArmor_Maggarage)
insertTable(SuburbsDistributions["cornerstore"]["shelvesmag"].items, ScrapArmor_Maggarage)
insertTable(SuburbsDistributions["garage"]["metal_shelves"].items, ScrapArmor_Maggarage)
insertTable(SuburbsDistributions["garagestorage"]["other"].items, ScrapArmor_Maggarage)
insertTable(SuburbsDistributions["all"]["postbox"].items, ScrapArmor_Maggarage)

--##################################################################################
-- # Print Tables
--##################################################################################

local function printTable(room, container)
	for k, v in pairs (SuburbsDistributions[room][container]["items"]) do
		print("\t", k..": "..v)
	end
end

local function printInnerTabler(room, container)
	for i,d in ipairs(SuburbsDistributions[room][container]["procList"])do
		print(i)
		for k, v in pairs(d) do
			print("\t", k..": "..v)
		end
	end
end

