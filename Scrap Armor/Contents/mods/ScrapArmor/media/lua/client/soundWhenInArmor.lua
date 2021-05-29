local armorList = {
	"Hat_ScrapHelmet",
	"ScrapVest"
}

local function isEquippedArmor(itemName)
	local item = getPlayer():getInventory():getItemFromType(itemName)
	return item and item:isEquipped()
end


local function soundWhenInArmor()
	local playerObj = getPlayer()
	if playerObj == nil then return end
	
	if playerObj:isMoving() then
		for i, armor in ipairs(armorList) do
			if isEquippedArmor(armor) then
				if not playerObj:getEmitter():isPlaying("UnlockDoor") then
					playerObj:playSound("UnlockDoor")
				end
			end
		end
	end
end

Events.OnTick.Add(soundWhenInArmor)