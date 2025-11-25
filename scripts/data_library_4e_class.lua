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

function getPowerSourceValues(node)
	local sPowerSourceValue = '';
	local aFilterValues = {};
	---- First tries through the description of the database module
	local sDescriptionNode = DB.findNode(DB.getPath(node, "description"));
	local sDescriptionText = DB.getValue(sDescriptionNode);
	if sDescriptionText then
		local sPowerSourceDescriptionTextLine = string.match(sDescriptionText, "<p>%s*<b>%s*Power Source%s*:%s*</b>%s*(.-).</p>");
		if sPowerSourceDescriptionTextLine then
			sPowerSourceValue = string.match(sPowerSourceDescriptionTextLine, "[%w%s]+");
			sPowerSourceValue = StringManager.titleCase(sPowerSourceValue);
			aFilterValues = StringManager.split(sPowerSourceValue, " ", true);
			for i,x in ipairs(aFilterValues) do
				if x == "And" then
					table.remove(aFilterValues, i);
				end
			end
		end
	end
	--return StringManager.trim(sPowerSourceValue);
	if #aFilterValues > 0 then
			return aFilterValues;
	else
		return Interface.getString("library_recordtype_filter_empty");
	end
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
		if not sBookSourceDescriptionTextLine then
			sBookSourceDescriptionTextLine = string.match(sDescriptionText, "%s*Published in%s(.+).");
		end
		if sBookSourceDescriptionTextLine then
			sBookSource = string.match(sBookSourceDescriptionTextLine, "[%w%s']+");	
		end
	end
	--Then try through the short description
	if not sBookSourceDescriptionTextLine then
		sDescriptionNode = DB.findNode(DB.getPath(node, "shortdescription"));
		sDescriptionText = DB.getValue(sDescriptionNode);
		if sDescriptionText then
			local sBookSourceDescriptionTextLine = string.match(sDescriptionText, "<p>%s*Published in(.-), page");
			if not sBookSourceDescriptionTextLine then
				sBookSourceDescriptionTextLine = string.match(sDescriptionText, "<p>%s*Published in(.+).</p>");
			end
			if not sBookSourceDescriptionTextLine then
				sBookSourceDescriptionTextLine = string.match(sDescriptionText, "%s*Published in%s(.+).");
			end
			if sBookSourceDescriptionTextLine then
				sBookSource = string.match(sBookSourceDescriptionTextLine, "[%w%s']+");	
			end
		end	
	end
	return StringManager.trim(sBookSource);
end

--Get class or race for powers
function getClassOrRaceValue(node)
	local sClassOrRace = '';
	---- Get the first part of the source tag in the power
	local sSourceNode = DB.findNode(DB.getPath(node, "source"));
	local sSourceText = DB.getValue(sSourceNode);
	if sSourceText then
		local sGetBeforeWords = "Attack Utility Feature";
		for item in string.gmatch(sGetBeforeWords, "%S+") do 
			local sItemMatch = "([%w%-%(%)%s]+)" .. item;
			sClassOrRace = string.match(string.lower(sSourceText), string.lower(sItemMatch));
			if sClassOrRace and StringManager.trim(sClassOrRace) ~= "" then
				sClassOrRace = StringManager.titleCase(sClassOrRace);
				sClassOrRace = StringManager.trim(sClassOrRace);
				return sClassOrRace;
			end
		end
	end
	return Interface.getString("library_recordtype_filter_empty");
end

function getPowerLevelValue(node)
	local aFilterValues = {};
	local nLevel = "0";
	---- Get the last part of the source tag in the power
	local sSourceNode = DB.findNode(DB.getPath(node, "source"));
	local sSourceText = DB.getValue(sSourceNode);
	if sSourceText then
		return string.match(sSourceText, "(%d+)") or Interface.getString("library_recordtype_filter_empty");
	end
	return nLevel;
end

--get power type: either Attack or Utility or Feature
function getPowerTypeValue(node)
	---- Get the first part of the source tag in the power
	local sSourceNode = DB.findNode(DB.getPath(node, "source"));
	local sSourceText = DB.getValue(sSourceNode);
	if sSourceText then
		local sGetPowerTypeWords = "Attack Utility Feature";
		for item in string.gmatch(sGetPowerTypeWords, "%S+") do 
			if string.match(string.lower(sSourceText), string.lower(item)) then
				return StringManager.trim(item);
			end
		end
	end
	return Interface.getString("library_recordtype_filter_empty");
end

function getRechargeValue(node)
	local sRechargeValue = DB.getText(node, "recharge", "");
	-- Different spelling of At-Will and At Will count together
	if sRechargeValue == "At Will" then
		sRechargeValue = "At-Will";
	end
	-- Strip the word "(Special)" for the purposes of having 3 neat categories
	sRechargeValue = string.gsub(sRechargeValue, "%(Special%)", "");
	return StringManager.trim(sRechargeValue);
end

function getPowerKeywordsValues(node)
	local sKeywordsValue = DB.getText(node, "keywords", "");
	local aFilterValues = {};
	if sKeywordsValue then
		aFilterValues = StringManager.split(sKeywordsValue, ",", true);
	end

	if #aFilterValues > 0 then
			return aFilterValues;
	else
		return Interface.getString("library_recordtype_filter_empty");
	end
end



aRecordOverrides = {
	["class"] = {
		aDataMap = { "class", "reference.classes" }, 
		sListDisplayClass = "masterindexitem_id",
		sRecordDisplayClass = "reference_class", 
		tOptions = {
			bExport = true,
		},
		aCustomFilters = {
			["Role"] = { sField = "role", fGetValue = getRoleValue },
			["Power Source"] = { sField = "powersource", fGetValue = getPowerSourceValues },
			["Type"] = { sField = "classtype", fGetValue = getClassTypeValue },
			["Published Source"] = { sField = "booksource", fGetValue = getBookSourceValue }
		}
	},
	["power"] = {
		aCustomFilters = {
			["Class"] = { sField = "class", fGetValue = getClassOrRaceValue },
			["Level"] = { sField = "level", sType="number", fGetValue = getPowerLevelValue },
			["Type"] = { sField = "powertype", fGetValue = getPowerTypeValue },
			["Recharge"] = { sField = "recharge", fGetValue = getRechargeValue},
			["Keywords"] = { sField = "keywords", fGetValue = getPowerKeywordsValues},
			["Published Source"] = { sField = "booksource", fGetValue = getBookSourceValue},
		}
	},
};

function onInit()
	LibraryData.overrideRecordTypes(aRecordOverrides);
end