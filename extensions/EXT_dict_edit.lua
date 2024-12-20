local conf = require("configuration")
local DictEdit = {
	description = "This extension can be used to replace certain patterns in specific dictionaries.",
	enabled_dictionaries = {
		["JMdict Japanese-English dictionary"] = true,
		["JMdict-ja-en"] = true,
	},
}

function DictEdit:run(note)
	local selected_dict = self.popup_dict.results[self.popup_dict.dict_index].dict
	if not self.enabled_dictionaries[selected_dict] then
		return note
	end
	local def = note.fields[conf.def_field:get_value()]

	def = def
		:gsub(";", ",")
		--
		:gsub("%.%.%.", "x")
		:gsub(", etc%.", "")
		:gsub("e%.g%. ", "")
		:gsub("esp%. ", "")
		:gsub(", to ", ", ")
		--
		:gsub("【.-】,", "")
		:gsub("%., ", ", ")
		:gsub(", %d ", ", ")
		:gsub("%.$", "")
		--
		:gsub("^.-〘.-〙, ", "")
		:gsub("〘.-〙, ", "")
		:gsub("〘.-〙 ", "")
		--
		:gsub(", [↔→](.-),", " (%1),")
		:gsub(", [↔→](.-)$", " (%1)")
		:gsub("%d([%)%]・])", "%1")

	note.fields[conf.def_field:get_value()] = def
	return note
end

return DictEdit
