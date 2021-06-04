require "Hotbar/ISHotbarAttachDefinition"
if not ISHotbarAttachDefinition then
    return
end

local SwordSheath = {
	type = "SwordSheath",
	name = "Back",
	animset = "back",
	attachments = {
		BigBlade = "SwordSheath",
	},
}
table.insert(ISHotbarAttachDefinition, SwordSheath);