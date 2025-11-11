-- 
-- Please see the license.html file included with this distribution for 
-- attribution and copyright information.
--

function getRoleValue(node)
	local sRoleValue = '';
	---- First tries through the description of the database module
	local sDescriptionNode = DB.findNode(DB.getPath(node, "description"));
	local sDescriptionText = DB.getValue(sDescriptionNode);
	if sDescriptionText then
		local sRoleDescriptionTextLine = string.match(sDescriptionText, "<p>%s*<b>%s*Role%s*:%s*</b>%s*(.-).</p>");
		if sRoleDescriptionTextLine then
			sRoleValue = string.match(sRoleDescriptionTextLine, "[%w]+");
		end
	end
	return StringManager.trim(sRoleValue);
end

function getPowerSourceValue(node)
	local sPowerSourceValue = '';
	---- First tries through the description of the database module
	local sDescriptionNode = DB.findNode(DB.getPath(node, "description"));
	local sDescriptionText = DB.getValue(sDescriptionNode);
	if sDescriptionText then
		local sPowerSourceDescriptionTextLine = string.match(sDescriptionText, "<p>%s*<b>%s*Power Source%s*:%s*</b>%s*(.-).</p>");
		if sPowerSourceDescriptionTextLine then
			sPowerSourceValue = string.match(sPowerSourceDescriptionTextLine, "[%w]+");
		end
	end
	return StringManager.trim(sPowerSourceValue);
end

function getClassTypeValue(node)
	local sClassName = DB.getText(DB.getPath(node, "name"));
	local sBookSource = '';
	--First just checks the name for a hybrid class
	if string.find(sClassName, "Hybrid") then
		return "Hybrid";
	end
	-- Second go through and identify the essentials class via the source
	local sDescriptionNode = DB.findNode(DB.getPath(node, "description"));
	local sDescriptionText = DB.getValue(sDescriptionNode);
	if sDescriptionText then
		local sBookSourceDescriptionTextLine = string.match(sDescriptionText, "<p>%s*Published in(.-), page");
		if not sBookSourceDescriptionTextLine then
			sBookSourceDescriptionTextLine = string.match(sDescriptionText, "<p>%s*Published in(.+).</p>");
		end
		if sBookSourceDescriptionTextLine then
			sBookSource = string.match(sBookSourceDescriptionTextLine, "[%w]+");
			if string.find(sBookSourceDescriptionTextLine, "Heroes of") or string.find(sBookSourceDescriptionTextLine, "Neverwinter") then
				return "Essentials";
			end			
		end
	end
	-- And if it's not any of the above, just call it the Default type
	return "Default"
end

function getBookSourceValue(node)
	local sBookSource = '';
	---- First tries through the description of the database module
	local sDescriptionNode = DB.findNode(DB.getPath(node, "description"));
	local sDescriptionText = DB.getValue(sDescriptionNode);
	if sDescriptionText then
		local sBookSourceDescriptionTextLine = string.match(sDescriptionText, "<p>%s*Published in(.-), page");
		if not sBookSourceDescriptionTextLine then
			sBookSourceDescriptionTextLine = string.match(sDescriptionText, "<p>%s*Published in(.+).</p>");
		end
		if sBookSourceDescriptionTextLine then
			sBookSource = string.match(sBookSourceDescriptionTextLine, "[%w%s']+");	
		end
	end
	return StringManager.trim(sBookSource);
end

aRecordOverrides = {
	["class"] = {
		aDataMap = { "class", "reference.classes" }, 
		sListDisplayClass = "masterindexitem_id",
		sRecordDisplayClass = "powerdesc", 
		tOptions = {
			bExport = true,
		},
		aCustomFilters = {
			["Role"] = { sField = "role", fGetValue = getRoleValue },
			["Power Source"] = { sField = "powersource", fGetValue = getPowerSourceValue },
			["Type"] = { sField = "classtype", fGetValue = getClassTypeValue },
			["Published Source"] = { sField = "booksource", fGetValue = getBookSourceValue }
		}	
	}
};

function onInit()
	LibraryData.overrideRecordTypes(aRecordOverrides);
end