-- 
-- Please see the license.html file included with this distribution for 
-- attribution and copyright information.
--

function getRecordLinkFromPowerName()
end

function addPowerFromRecordLink(rAdd, sPowerName, sPowerPath)
	if not rAdd or not sPowerName or not sPowerPath then
		ChatManager.SystemMessageResource("char_error_addclassspower");
		return;
	end
	local tCurrentPowers = DB.getChildren(rAdd.nodeChar, "powers");
	local isPowerInList = false;
	for _, powerNode in pairs(tCurrentPowers) do
		if DB.getText(powerNode, "name") == sPowerName then
			isPowerInList = true;
			break;
		end
	end
	if isPowerInList == false and DB.findNode(DB.getPath(sPowerPath)) then
		local sPowerActionSpeed = DB.getText(DB.getPath(sPowerPath, "action"));
		local sPowerSource = DB.getText(DB.getPath(sPowerPath, "source"));
		local sPowerKeywords = DB.getText(DB.getPath(sPowerPath, "keywords"));
		local sPowerRange = DB.getText(DB.getPath(sPowerPath, "range"));
		local sPowerRecharge = DB.getText(DB.getPath(sPowerPath, "recharge"));
		local sPowerFullDescription = DB.getText(DB.getPath(sPowerPath, "flavor")) .. "\n\n" .. DB.getText(DB.getPath(sPowerPath, "description"))
		local rCreatedIDChildNode = DB.createChild(rAdd.nodeChar.getPath("powers"));
		DB.setValue(rCreatedIDChildNode, "action", "string", sPowerActionSpeed);
		DB.setValue(rCreatedIDChildNode, "name", "string", sPowerName);
		DB.setValue(rCreatedIDChildNode, "source", "string", sPowerSource);
		DB.setValue(rCreatedIDChildNode, "keywords", "string", sPowerKeywords);
		DB.setValue(rCreatedIDChildNode, "range", "string", sPowerRange);
		DB.setValue(rCreatedIDChildNode, "recharge", "string", sPowerRecharge);
		DB.setValue(rCreatedIDChildNode, "shortdescription", "string", sPowerFullDescription);
		CharManager.parseDescription(rCreatedIDChildNode);
		ChatManager.SystemMessageResource("char_abilities_message_poweradd", sPowerName, rAdd.sCharName);
	end	
end

---------------------------------------------
--- Generic Non-Dialogue Power Add Methods
---------------------------------------------
--Adds all powers that are in the text of a class feature
function addAllFeaturePowers(rAdd, sClassFeatureOriginalDescription, sClassFeatureName)
	if not rAdd or not sClassFeatureOriginalDescription or not sClassFeatureName then
		ChatManager.SystemMessageResource("char_error_addclassspower");
		return;
	end
	local sPattern = '<link class="powerdesc" recordname="reference.powers.(%w+)@([%w%s]+)">';
	local sPowersLink = string.gmatch(sClassFeatureOriginalDescription, sPattern);
	for w,v in sPowersLink do
		local sPowerPath = "reference.powers." .. w .. "@" .. v;
		local sPowerName = DB.getText(DB.getPath(sPowerPath, "name"));
		addPowerFromRecordLink(rAdd, sPowerName, sPowerPath);
	end
end

--Adds a power based that matches the name of a feature
function addFeatureNamePower(rAdd, sClassFeatureName)
	if not rAdd or not sClassFeatureName then
		ChatManager.SystemMessageResource("char_error_addclassspower");
		return;
	end
	local tPowerNodes = DB.getChildrenGlobal("reference.powers");
	for _,powerNode in ipairs(tPowerNodes) do
		local sPowerName = DB.getText(DB.getPath(powerNode, "name"));
		if sClassFeatureName == sPowerName then
			local sPowerPath = DB.getPath(powerNode);
			addPowerFromRecordLink(rAdd, sPowerName, sPowerPath);
			break;
		end
	end
end

--Searches Sub-Feature Text for Name of all Powers from the parent class feature text, and adds them
function addAllPowersFromFeatureText(rAdd, sSubClassFeatureOriginalDescription, sParentClassFeatureOriginalDescription)
	if not rAdd or not sSubClassFeatureOriginalDescription or not sParentClassFeatureOriginalDescription then
		ChatManager.SystemMessageResource("char_error_addclassspower");
		return;
	end
	local sPattern = '<link class="powerdesc" recordname="reference.powers.(%w+)@([%w%s]+)">';
	local sPowersLink = string.gmatch(sParentClassFeatureOriginalDescription, sPattern);
	local tPowersInFeature = {};
	for w,v in sPowersLink do
		local sPowerPath = "reference.powers." .. w .. "@" .. v;
		local sPowerName = DB.getText(DB.getPath(sPowerPath, "name"));
		--Is power name in Sub-Feature, add it to table
		if sPowerName and string.find(sSubClassFeatureOriginalDescription:lower(), sPowerName:lower()) then
			tPowersInFeature[sPowerName] = sPowerPath;
		end
	end
	--Add all the powers that were found in the Sub-Feature
	for powerName,powerPath in pairs(tPowersInFeature) do
		addPowerFromRecordLink(rAdd, powerName, powerPath);
	end
end

---------------------------------------------
--- Generic Dialogue Selection Methods
---------------------------------------------

function displayClassPowerSelectionsDialog(rAdd, sClassFeatureOriginalDescription, sClassFeatureName, nMaxSelections)
	local tOptions = {};
	--Display information on the selections in chat
	local sPattern = '<link class="powerdesc" recordname="reference.powers.(%w+)@([%w%s]+)">';
	local sPowersLink = string.gmatch(sClassFeatureOriginalDescription, sPattern);
	for w,v in sPowersLink do
		local sPattern = "reference.powers." .. w .. "@" .. v;
		local sClassFeatureName = DB.getText(DB.getPath(sPattern, "name"));
		local sClassFeatureDescription = DB.getText(DB.getPath(sPattern, "description"));
		table.insert(tOptions, { text = sClassFeatureName, linkclass = "powerdesc", linkrecord = DB.getPath(sPattern), });
	end
	--Display a pop-up where we choose from the class power options
	if not nMaxSelections or nMaxSelections < 1 then
		nMaxSelections = 1;
	end
	local msg = string.format(Interface.getString("char_build_message_chooseclasspowers"), nMaxSelections, sClassFeatureName);
	local tDialogData = {
		title = sClassFeatureName,
		msg = msg,
		options = tOptions,
		min = nMaxSelections,
		max = nMaxSelections,
		callback = CharClassPowerManager.callbackResolveClassPowersSelectionsDialogSelection,
		custom = rAdd, 
	};
	DialogManager.requestSelectionDialog(tDialogData);	
end
function callbackResolveClassPowersSelectionsDialogSelection(tSelection, rAdd, tSelectionLinks)
	if not tSelection or not tSelection[1] then
		ChatManager.SystemMessageResource("char_error_addclassspower");
		return;
	end
	if not tSelectionLinks then
		ChatManager.SystemMessageResource("char_error_addclassspower");
		return;
	end
	for i, selectedPower in ipairs(tSelectionLinks) do
		local sPowerPath = selectedPower.linkrecord;
		local sPowerName = tSelection[i];
		addPowerFromRecordLink(rAdd, sPowerName, sPowerPath);
	end
end

function dispayItalicPowersDialog(rAdd, sClassFeatureOriginalDescription, sClassFeatureName, nMaxSelections)
	if not rAdd or not sClassFeatureOriginalDescription then
		ChatManager.SystemMessageResource("char_error_addclassspower");
		return;
	end
	local tOptions = {};
	local tTotalPowerNames = {};
	local nTotalPowerCount = 1;
	--Get all the italicized powers first
	local sPattern = "<i>(.-)</i>";
	local fItalicizedSections = string.gmatch(sClassFeatureOriginalDescription, sPattern);
	for italicsPowerName in fItalicizedSections do
		if not string.find(italicsPowerName, ",") then
			if italicsPowerName and StringManager.trim(italicsPowerName) ~= "" then
				tTotalPowerNames[nTotalPowerCount] = StringManager.trim(italicsPowerName);
				nTotalPowerCount = nTotalPowerCount + 1;
			end
		else
			local tItalicsPowerSplit = StringManager.splitByPattern(italicsPowerName, ",", true);
			for key,x in pairs(tItalicsPowerSplit) do
				if x and StringManager.trim(x) ~= "" then
					tTotalPowerNames[nTotalPowerCount] = StringManager.trim(x);
					nTotalPowerCount = nTotalPowerCount + 1;
				end
			end
		end
	end

	--Check the number of selections
	local sChoiceNumberMatch = string.match(sClassFeatureOriginalDescription, "gain ([%w'-]+).*%sof your choice%s*:");
	if sChoiceNumberMatch then
		nMaxSelections = convertWordToNumber(sChoiceNumberMatch);
	end
	if not nMaxSelections or nMaxSelections < 1 then
		nMaxSelections = 1;
	end

	--Decide whether we get all of them or choose
	local bIsOrConjunction = false;
	if string.find(sClassFeatureOriginalDescription, "[%s>]or[%s<]") then
		bIsOrConjunction = true;
	end

	if bIsOrConjunction then
		local tGlobalPowerNodes = DB.getChildrenGlobal("reference.powers");
		for i, italicsPowerName in ipairs(tTotalPowerNames) do
			for _,powerNode in ipairs(tGlobalPowerNodes) do
				local sPowerName = DB.getText(DB.getPath(powerNode, "name"));
				if italicsPowerName:lower() == sPowerName:lower() then
					local sPowerPath = DB.getPath(powerNode);
					table.insert(tOptions, { text = sPowerName, linkclass = "powerdesc", linkrecord = sPowerPath, });
				end
			end
		end

		--Display a pop-up where we choose from the class power options
		local msg = string.format(Interface.getString("char_build_message_chooseclasspowers"), nMaxSelections, sClassFeatureName);
		local tDialogData = {
			title = sClassFeatureName,
			msg = msg,
			options = tOptions,
			min = nMaxSelections,
			max = nMaxSelections,
			callback = CharClassPowerManager.callbackResolveClassPowersSelectionsDialogSelection,
			custom = rAdd, 
		};
		DialogManager.requestSelectionDialog(tDialogData);
	end
end


-------------------------------------------
----- WIZARD (ARCANIST) Class Features ----
-------------------------------------------
function addWizardArcanistSpellbookPowers(rAdd, sClassName, nNumberOfPowers)
	local sDailyAttackText = "Daily";
	local sAttackTypeText = "Attack";
	local sUtilityTypeText = "Utility";
	local sRefreshText = sDailyAttackText;

	local tPowersforLevelAndClass = {};
	local tPowers = {};
	local nPowersCount = 1;
	local nOptionsCount = 1;
	--Use version of class name without the parentheses
	local sFilteredClassName = StringManager.trim(string.gsub(sClassName, "%b()", ""));
	local tPowerNodes = DB.getChildrenGlobal("reference.powers");
	for _,powerNode in ipairs(tPowerNodes) do
		local sPowerClass = Classes4eExtensionLibraryData.getClassOrRaceValue(powerNode);
		local sPowerLevel = Classes4eExtensionLibraryData.getPowerLevelValue(powerNode);
		local sPowerRecharge = Classes4eExtensionLibraryData.getRechargeValue(powerNode);
		if sPowerClass == sFilteredClassName and sPowerLevel == "1" then
			tPowersforLevelAndClass[nOptionsCount] = powerNode;
			nOptionsCount = nOptionsCount + 1;
			if sPowerRecharge == sRefreshText then
				tPowers[nPowersCount] = powerNode;
				nPowersCount = nPowersCount + 1;
			end
		end
	end

	displayWizardArcanistSpellbookDailyAttackDialog(rAdd, sClassName, tPowers, nNumberOfPowers, sRefreshText);
end
function displayWizardArcanistSpellbookDailyAttackDialog(rAdd, sClassName, tPowers, nNumberOfPowers, sRefreshText)
	local tOptions = {};
	for _,y in ipairs(tPowers) do
		local sClassFeatureName = DB.getText(DB.getPath(y, "name"));
		local sClassFeatureDescription = DB.getText(DB.getPath(y, "description"));
		table.insert(tOptions, { text = sClassFeatureName, linkclass = "powerdesc", linkrecord = DB.getPath(y), });
	end
	if not nNumberOfPowers then
		nNumberOfPowers = 2;
	end
	local tDialogData = {
		title = "Wizard Spellbook",
		msg = "Choose 2 Daily Attack powers.",
		options = tOptions,
		min = nNumberOfPowers,
		max = nNumberOfPowers,
		callback = CharClassPowerManager.callbackResolveSpellbookPowerDialogSelection,
		custom = rAdd, 
	};
	DialogManager.requestSelectionDialog(tDialogData);
end
function callbackResolveSpellbookPowerDialogSelection(tSelection, rAdd, tSelectionLinks)
	if not tSelection or not tSelection[1] then
		ChatManager.SystemMessageResource("char_error_addclasssfeature");
		return;
	end
	if not tSelectionLinks then
		ChatManager.SystemMessageResource("char_error_addclasssfeature");
		return;
	end
	for i, selectedPower in ipairs(tSelectionLinks) do
		local sPowerPath = selectedPower.linkrecord;
		local sPowerName = tSelection[i];

		local tCurrentPowers = DB.getChildren(rAdd.nodeChar, "powers");
		local isPowerInList = false;
		for _, powerNode in pairs(tCurrentPowers) do
			if DB.getText(powerNode, "name") == sPowerName then
				isPowerInList = true;
				break;
			end
		end
		if isPowerInList == false then
			local sPowerActionSpeed = DB.getText(DB.getPath(sPowerPath, "action"));
			local sPowerSource = DB.getText(DB.getPath(sPowerPath, "source"));
			local sPowerKeywords = DB.getText(DB.getPath(sPowerPath, "keywords"));
			local sPowerRange = DB.getText(DB.getPath(sPowerPath, "range"));
			local sPowerRecharge = DB.getText(DB.getPath(sPowerPath, "recharge"));
			local sPowerFullDescription = DB.getText(DB.getPath(sPowerPath, "flavor")) .. "\n\n" .. DB.getText(DB.getPath(sPowerPath, "description"))
			local rCreatedIDChildNode = DB.createChild(rAdd.nodeChar.getPath("powers"));
			DB.setValue(rCreatedIDChildNode, "action", "string", sPowerActionSpeed);
			DB.setValue(rCreatedIDChildNode, "name", "string", sPowerName);
			DB.setValue(rCreatedIDChildNode, "source", "string", sPowerSource);
			DB.setValue(rCreatedIDChildNode, "keywords", "string", sPowerKeywords);
			DB.setValue(rCreatedIDChildNode, "range", "string", sPowerRange);
			DB.setValue(rCreatedIDChildNode, "recharge", "string", sPowerRecharge);
			DB.setValue(rCreatedIDChildNode, "shortdescription", "string", sPowerFullDescription);
			CharManager.parseDescription(rCreatedIDChildNode);
			ChatManager.SystemMessageResource("char_abilities_message_poweradd", sPowerName, rAdd.sCharName);
		end
	end
	displayWizardArcanistSpellbookPreparationDialog(rAdd, tSelectionLinks);
end
function displayWizardArcanistSpellbookPreparationDialog(rAdd, tPowerLinks)
	local tOptions = {};
	for _,y in ipairs(tPowerLinks) do
		local sPowerPath = y.linkrecord;
		local sClassFeatureName = DB.getText(DB.getPath(sPowerPath, "name"));
		local sClassFeatureDescription = DB.getText(DB.getPath(sPowerPath, "description"));
		table.insert(tOptions, { text = sClassFeatureName, linkclass = "powerdesc", linkrecord = DB.getPath(sPowerPath), });
	end
	local tDialogData = {
		title = "Wizard Spellbook",
		msg = "Choose 1 of these spells to prepare.",
		options = tOptions,
		min = 1,
		max = 1,
		callback = CharClassPowerManager.callbackResolveSpellbookPreparationDialogSelection,
		custom = { rAdd=rAdd, tTotalOptions=tOptions }, 
	};
	DialogManager.requestSelectionDialog(tDialogData);
end
function callbackResolveSpellbookPreparationDialogSelection(tSelection, tData, tSelectionLinks)
	if not tSelection or not tSelection[1] then
		ChatManager.SystemMessageResource("char_error_addclasssfeature");
		return;
	end
	if not tSelectionLinks then
		ChatManager.SystemMessageResource("char_error_addclasssfeature");
		return;
	end
	--Set the selected power to prepared
	-- for i, selectedPower in ipairs(tSelectionLinks) do
	-- 	local sPowerPath = selectedPower.linkrecord;
	-- 	local sPowerName = tSelection[i];
	-- 	Debug.console("Preparing sPowerName", sPowerName);

	-- 	local tCurrentPowers = DB.getChildren(tData.rAdd.nodeChar, "powers");
	-- 	local isPowerInList = false;
	-- 	for _, powerNode in pairs(tCurrentPowers) do
	-- 		if DB.getText(powerNode, "name") == sPowerName then
	-- 			isPowerInList = true;
	-- 			break;
	-- 		end
	-- 	end
	-- 	if isPowerInList == true then
	-- 		local rChildNode = DB.getChild(tData.rAdd.nodeChar.getPath("powers"), "name");
	-- 		DB.setValue(rChildNode, "prepared", "number", 1);
	-- 		ChatManager.SystemMessageResource("char_abilities_message_poweradd", sPowerName, tData.rAdd.sCharName);
	-- 	end
	-- end
	--Set every other power not selected to not prepared
	for i, allPowers in ipairs(tData.tTotalOptions) do
		local sAllPowerName = allPowers.text;
		Debug.console("all Powers", sAllPowerName);
		local isASelectedPower = false;
		for x,selectedPower in ipairs(tSelectionLinks) do
			local sSelectedPowerName = tSelection[x];
			Debug.console("Checking against ", sSelectedPowerName);
			if sSelectedPowerName == sAllPowerName then
				isASelectedPower = true;
				Debug.console("isASelectedPower", isASelectedPower);
			end
		end
		local tCurrentPowers = DB.getChildren(tData.rAdd.nodeChar, "powers");
		Debug.console("tCurrentPowers", tCurrentPowers);
		for _,existingPowerNode in pairs(tCurrentPowers) do
			Debug.console("Existing power named", DB.getText(existingPowerNode, "name"));
			if DB.getText(existingPowerNode, "name") == sAllPowerName then
				Debug.console("Found power");
				if isASelectedPower then
					DB.setValue(existingPowerNode, "prepared", "number", 1);
				else
					DB.setValue(existingPowerNode, "prepared", "number", 0);
				end
			end
		end
	end
end 

function addSpellbookToInventory(rAdd)
end


---------------------------------------
-- Utility functions
---------------------------------------
function convertWordToNumber(word)
	local numberWords = {
	    ["zero"] = 0,
	    ["one"] = 1,
	    ["two"] = 2,
	    ["three"] = 3,
	    ["four"] = 4,
	    ["five"] = 5,
	    ["six"] = 6,
	};

    local lowerCaseWord = string.lower(word)
    return numberWords[lowerCaseWord]
end