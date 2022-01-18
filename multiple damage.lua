

-- main code
gg.clearResults()
gg.setRanges(gg.REGION_ANONYMOUS)
gg.searchNumber("37905186", gg.TYPE_DWORD, false, gg.SIGN_EQUAL, 0, -1, 0)
gg.processResume()
gg.refineAddress("C", -1, gg.TYPE_DWORD, gg.SIGN_EQUAL, 0, -1, 0)

local t = gg.getResults(90000, nil, nil, nil, nil, nil, nil, nil, nil)
gg.addListItems(t)
t = nil


local copy = false
local t = gg.getListItems()
if not copy then gg.removeListItems(t) end
for i, v in ipairs(t) do
	v.address = v.address + 0xfffffffffffffff0
	if copy then v.name = v.name..' #2' end
end
gg.addListItems(t)
t = nil
copy = nil


revert = gg.getListItems()
local t = gg.getListItems()
for i, v in ipairs(t) do
	if v.flags == gg.TYPE_DWORD then
		v.value = "1097859072"
		v.freeze = true
		v.freezeType = gg.FREEZE_NORMAL
	end
end
gg.addListItems(t)
t = nil
gg.clearResults()

