-- 
-- Please see the license.html file included with this distribution for 
-- attribution and copyright information.
--

function addHybridClass(nodeChar, sRecord, tData)
	local rAdd = CharClassBuildDropManager.helperBuildAddStructure(nodeChar, "powerdesc", sRecord, tData);
	local sClassName = DB.getText(DB.getPath(sRecord, "name"));

	-- Get Class Node Information
	---- First tries through the description of the database module
	local sRecordDescriptionNode = DB.findNode(DB.getPath(sRecord, "description"));
	local sDescriptionText = DB.getValue(sRecordDescriptionNode);

	--Choose second hybrid class at the same time so we can do calculations together, with proper rounding
	--Otherwise if we do one hybrid class at a time, then values being put in the number of fields will get automatically rounded before the end.
	chooseSecondHybridClassDialogue(rAdd, sRecord, sDescriptionText, sClassName);
	
end

function chooseSecondHybridClassDialogue(rAdd, sRecord, sDescriptionText, sClassName)
	local tOptions = {};
	local nOptionsCount = 1;
	local tClassNodes = DB.getChildrenGlobal("reference.classes");
	for _,classNode in ipairs(tClassNodes) do
		local sDialogClassName = DB.getText(DB.getPath(classNode, "name"));
		if string.find(sDialogClassName:lower(), "hybrid") and sDialogClassName ~= sClassName then
			table.insert(tOptions, { text = sDialogClassName, linkclass = "powerdesc", linkrecord = DB.getPath(classNode), });
			nOptionsCount = nOptionsCount + 1;
		end
	end

	if #tOptions > 0 then
		local tDialogData = {
			title = Interface.getString("char_build_title_secondhybridclass"),
			msg = Interface.getString("char_build_message_choosesecondhybridclass"),
			options = tOptions,
			min = nNumberOfPowers,
			max = nNumberOfPowers,
			callback = CharHybridClassManager.callbackResolveChooseSecondHybridClassDialogSelection,
			custom = { rAdd=rAdd, sRecord=sRecord, sDescriptionText=sDescriptionText, sClassName=sClassName }, 
		};
		DialogManager.requestSelectionDialog(tDialogData);
	else
		CharManager.outputUserMessage("char_error_nosecondhybridclass");
	end	
end
function callbackResolveChooseSecondHybridClassDialogSelection(tSelection, tData, tSelectionLinks)
	if not tSelection or not tSelection[1] then
		ChatManager.SystemMessageResource("char_error_addbothhybridclasses");
		return;
	end
	if not tSelectionLinks or not tSelectionLinks[1] then
		ChatManager.SystemMessageResource("char_error_addbothhybridclasses");
	end

	local sRecordOne = tData.sRecord;
	local sDescriptionTextOne = tData.sDescriptionText;
	local sClassNameOne = tData.sClassName;
	local sRecordTwo = tSelectionLinks[1].linkrecord;
	local sRecordTwoDescriptionNode = DB.findNode(DB.getPath(sRecordTwo, "description"));
	local sDescriptionTextTwo = DB.getValue(sRecordTwoDescriptionNode);
	local sClassNameTwo = DB.getText(DB.getPath(sRecordTwo, "name"));
	addBothHybridClasses(tData.rAdd, sRecordOne, sRecordTwo, sDescriptionTextOne, sDescriptionTextTwo, sClassNameOne, sClassNameTwo);
end

function addBothHybridClasses(rAdd, sRecordOne, sRecordTwo, sDescriptionTextOne, sDescriptionTextTwo, sClassNameOne, sClassNameTwo)
	addHybridClassName(rAdd, sClassNameOne, sClassNameTwo);

	addHybridClassLevel(rAdd);

	addHybridClassLinks(rAdd, sRecordTwo);

	--Add all the armor proficiencies from the first hybrid class, 
	--then remove the ones that aren't in the second hybrid class
	CharClassManager.addClassArmorProficiencies(rAdd, sRecordOne, sDescriptionTextOne);
	CharHybridClassManager.addHybridClassArmorProficiencies(rAdd, sRecordTwo, sDescriptionTextTwo);

	--Add weapon proficiencies from both classes
	CharClassManager.addClassWeaponProficiencies(rAdd, sRecordOne, sDescriptionTextOne);
	CharClassManager.addClassWeaponProficiencies(rAdd, sRecordTwo, sDescriptionTextTwo);

	addHybridClassHitPoints(rAdd, sRecordOne, sDescriptionTextOne, sRecordTwo, sDescriptionTextTwo);

	addHybridClassHealingSurges(rAdd, sRecordOne, sDescriptionTextOne, sRecordTwo, sDescriptionTextTwo);

	--Add class features from both hybrid classes
	CharClassManager.addClassFeatures(rAdd, sRecordOne, sDescriptionTextOne, sClassNameOne);
	CharClassManager.addClassFeatures(rAdd, sRecordTwo, sDescriptionTextTwo, sClassNameTwo);
end


function addHybridClassName(rAdd, sClassNameOne, sClassNameTwo)
	DB.setValue(rAdd.nodeChar, "class.base", "string", sClassNameOne .. " / " .. sClassNameTwo);
end
function addHybridClassLevel(rAdd)
	DB.setValue(rAdd.nodeChar, "level", "number", "1");
end
function addHybridClassLinks(rAdd, sRecordTwo)
	DB.setValue(rAdd.nodeChar, "classlink", "windowreference", "powerdesc", DB.getPath(rAdd.nodeSource));
	DB.setValue(rAdd.nodeChar, "hybridclasslink", "windowreference", "powerdesc", DB.getPath(sRecordTwo));
end

function addHybridClassArmorProficiencies(rAdd, sRecord, sDescriptionText)
	local sArmorProficienciesValue = '';
	local tArmorProficiencies = { };
	-- local rArmorProficienciesNode = DB.findNode(DB.getPath(sRecord, "armorproficiencies"));
	-- if rArmorProficienciesNode then
	-- 		sArmorProficienciesValue = DB.getText(rArmorProficienciesNode);
	-- elseif DB.findNode(DB.getPath(sRecord, "traits")) then
	-- 	local rRecordTraitsNode = DB.findNode(DB.getPath(sRecord, "traits"));
	-- 	if rRecordTraitsNode then
	-- 		local rArmorProficienciesTraitsNode = DB.getChild(rRecordTraitsNode, "armorproficiencies");
	-- 		if rArmorProficienciesTraitsNode then
	-- 			local rArmorProficiencyTextNode = DB.getChild(rArmorProficienciesTraitsNode, "text");
	-- 			sArmorProficienciesValue = DB.getText(rArmorProficiencyTextNode);
	-- 		end
	-- 	end
	--elseif sDescriptionText then
	if sDescriptionText then
		local sArmorProficiencyDescriptionTextLine = string.match(sDescriptionText, "<p>%s*<b>%s*Armor Proficiencies%s*:%s*</b>(.-)</p>");
		sArmorProficienciesValue = string.match(sArmorProficiencyDescriptionTextLine, "[%a,;%s]+");
	end
	local tArmorArmorProficienciesCategories = StringManager.split(sArmorProficienciesValue, ";");
	local isShieldsInList = false;
	if #tArmorArmorProficienciesCategories > 1 then
		isShieldsInList = true;

	end
	if isShieldsInList then
		tArmorProficiencies = StringManager.split(tArmorArmorProficienciesCategories[1], ",");
		local tShieldsProficiencies = StringManager.split(tArmorArmorProficienciesCategories[2], ",");
		local nShieldProfIndex = #tArmorProficiencies + 1;
		for shieldProfIndex, shieldProfValue in pairs(tShieldsProficiencies) do
			tArmorProficiencies[nShieldProfIndex] = shieldProfValue;
			nShieldProfIndex = nShieldProfIndex + 1;
		end
	else
		tArmorProficiencies = StringManager.split(sArmorProficienciesValue, ",");
	end
	local tCurrentArmorProficiencies = DB.getChildren(rAdd.nodeChar, "proficiencyarmor");
	for armorProficiencyName,armorProficiencyNode in pairs(tCurrentArmorProficiencies) do
		local isArmorProficiencyInList = false;
		for _,x in pairs(tArmorProficiencies) do
			x = x:gsub("^%s+", ""):gsub("%s+$", "");
			if DB.getText(DB.getPath(armorProficiencyNode, "value")) == x then
				isArmorProficiencyInList = true;
				break;
			end
		end
		if isArmorProficiencyInList == false then
			DB.deleteNode(armorProficiencyNode);
		end
	end
end

function addHybridClassHitPoints(rAdd, sRecordOne, sDescriptionTextOne, sRecordTwo, sDescriptionTextTwo)
	local sHybridClassOneHitPointsAtFirstLevelValue = '';
	local sHybridClassTwoHitPointsAtFirstLevelValue = '';
	local nHitPointsAtFirstLevelTotal = 0;
	if sDescriptionTextOne then
		local sHybridClassOneHitPointsAtFirstLevelDescriptionTextLine = string.match(sDescriptionTextOne, "<p>%s*<b>%s*Hit Points at 1st Level%s*</b>:%s*(.-)</p>");
		sHybridClassOneHitPointsAtFirstLevelValue = string.match(sHybridClassOneHitPointsAtFirstLevelDescriptionTextLine, "[%d%.]+");
	end
	if sDescriptionTextTwo then
		local sHybridClassTwoHitPointsAtFirstLevelDescriptionTextLine = string.match(sDescriptionTextTwo, "<p>%s*<b>%s*Hit Points at 1st Level%s*</b>:%s*(.-)</p>");
		sHybridClassTwoHitPointsAtFirstLevelValue = string.match(sHybridClassTwoHitPointsAtFirstLevelDescriptionTextLine, "[%d%.]+");
	end	
	local rCharacterHPNode = DB.findNode(rAdd.nodeChar.getPath("hp"));
	local rCharacterConNode = DB.findNode(rAdd.nodeChar.getPath("abilities", "constitution"));
	local nCharacterConValue = DB.getValue(rCharacterConNode, "score", 0);
	--Add hybrid one hit points to hybrid class two hit points and round down, then add Con
	nHitPointsAtFirstLevelTotal = sHybridClassOneHitPointsAtFirstLevelValue + sHybridClassTwoHitPointsAtFirstLevelValue;
	nHitPointsAtFirstLevelTotal = math.floor(nHitPointsAtFirstLevelTotal);
	nHitPointsAtFirstLevelTotal = nHitPointsAtFirstLevelTotal + nCharacterConValue; 
	if rCharacterHPNode and nHitPointsAtFirstLevelTotal then
		DB.setValue(rCharacterHPNode, "total", "number", nHitPointsAtFirstLevelTotal);
		ChatManager.SystemMessageResource("char_combat_message_hitpointsatfirstleveladd", nHitPointsAtFirstLevelTotal, rAdd.sCharName);
	end
end

function addHybridClassHealingSurges(rAdd, sRecordOne, sDescriptionTextOne, sRecordTwo, sDescriptionTextTwo)
	local sHybridClassOneHealingSurgesPerDayValue = '';
	local sHybridClassTwoHealingSurgesPerDayValue = '';
	if sDescriptionTextOne then
		local sHybridClassOneHealingSurgesPerDayDescriptionTextLine = string.match(sDescriptionTextOne, "<p>%s*<b>%s*Healing Surges per Day%s*</b>:%s*(.-)</p>");
		sHybridClassOneHealingSurgesPerDayValue = string.match(sHybridClassOneHealingSurgesPerDayDescriptionTextLine, "[%d%.]+");
	end
	if sDescriptionTextTwo then
		local sHybridClassTwoHealingSurgesPerDayDescriptionTextLine = string.match(sDescriptionTextTwo, "<p>%s*<b>%s*Healing Surges per Day%s*</b>:%s*(.-)</p>");
		sHybridClassTwoHealingSurgesPerDayValue = string.match(sHybridClassTwoHealingSurgesPerDayDescriptionTextLine, "[%d%.]+");
	end	
	local rCharacterHPNode = DB.findNode(rAdd.nodeChar.getPath("hp"));
	local rCharacterConNode = DB.findNode(rAdd.nodeChar.getPath("abilities", "constitution"));
	local nCharacterConModValue = DB.getValue(rCharacterConNode, "bonus", 0);
	local nHealingSurgesPerDayTotal = tonumber(sHybridClassOneHealingSurgesPerDayValue) + tonumber(sHybridClassTwoHealingSurgesPerDayValue);
	nHealingSurgesPerDayTotal = math.floor(nHealingSurgesPerDayTotal);
	nHealingSurgesPerDayTotal = nHealingSurgesPerDayTotal + nCharacterConModValue;
	if rCharacterHPNode and nHealingSurgesPerDayTotal then
		DB.setValue(rCharacterHPNode, "surgesmax", "number", nHealingSurgesPerDayTotal);
		ChatManager.SystemMessageResource("char_combat_message_healingsurgesperdayadd", nHealingSurgesPerDayTotal, rAdd.sCharName);
	end
end

function addHybridClassFeatures(rAdd, sRecordOne, sRecordTwo, sDescriptionTextOne, sDescriptionTextTwo, sClassNameOne, sClassNameTwo)
	local sClassFeaturesValue = '';
	local sClassFeatureSpecificDescriptionText = '';
	local sClassFeatureFilteredDescriptionText = '';
	local tCurrentFeatures = DB.getChildren(rAdd.nodeChar, "specialabilitylist");
	---- first through the newly added feature tag
	-- local sRecordFeatureNode = DB.findNode(DB.getPath(sRecord, "features"));
	-- if sRecordFeatureNode then
	-- 	local nodeFeatureChildren = DB.getChildren(sRecordFeatureNode);
	-- 	for nodeName,nodeChild in pairs(nodeFeatureChildren) do
	-- 		local isFeatureInList = false;
	-- 		for _, featureNode in pairs(tCurrentFeatures) do
	-- 			if DB.getText(featureNode, "value") == DB.getText(nodeChild, "name") then
	-- 				isFeatureInList = true;
	-- 				break;
	-- 			end
	-- 		end
	-- 		if isFeatureInList == false then
	-- 			local rCreatedIDChildNode = DB.createChild(rAdd.nodeChar.getPath("specialabilitylist"));
	-- 			DB.setValue(rCreatedIDChildNode, "description", "string", DB.getText(DB.getPath(nodeChild, "description")));
	--       		DB.createChild(rCreatedIDChildNode, "shortcut", "windowreference");
	--       		DB.setValue(rCreatedIDChildNode, "value", "string", DB.getText(DB.getPath(nodeChild, "name")));
	--       		local sRacialFeatureName = DB.getText(rCreatedIDChildNode, "value");
	--       		ChatManager.SystemMessageResource("char_abilities_message_featureadd", sRacialFeatureName, rAdd.sCharName);
	--       	end
	-- 	end
	-- elseif sDescriptionText then
	if sDescriptionTextOne then
	-- then through the description text
		local sClassFeaturesDescriptionTextLine = string.match(sDescriptionTextOne, "<p>%s*<b>%s*Class features%s*:%s*</b>(.-)</p>");
		--If it's an essentials class, keep the text down to just level 1 (for now)
		if sDescriptionTextOne and string.find(sDescriptionTextOne, "<p><b>Level 1:</b></p>") and string.find(sDescriptionTextOne, "<p><b>Level 2:</b></p>") then
			sDescriptionTextOne = string.match(sDescriptionTextOne, "(.-)<p><b>Level 2:</b></p>");
		end
		if sClassFeaturesDescriptionTextLine then
			sClassFeaturesValue = string.match(sClassFeaturesDescriptionTextLine, "[%w,'%(%)%-%s]+");
		end
		local tClassFeatures = StringManager.split(sClassFeaturesValue, ',', true);
		--Pre-Feature Class Feature added here, features that must be chosen before other features, like warpriest domains
		local tClassesWithPreFeatures = {};
		tClassesWithPreFeatures = loadClassesWithPreFeatures(tClassesWithPreFeatures);
		if tClassesWithPreFeatures[sClassName:upper()] then
			CharClassFeatureManager.addClassSpecificPreFeatures(sClassName, rAdd, sDescriptionTextOne, tClassFeatures);
		else
			for w,v in pairs(tClassFeatures) do
				local sClassFeatureDescriptionPattern = '';
				v = v:gsub("[%(%)%-]", "%%%0");
				v = v:gsub("(%a)([%w_']*)", titleCase);
				if w < #tClassFeatures then
					sClassFeatureDescriptionPattern = "<p>%s*<b>%s*" .. v .. "%s*</b></p>%s*(.-)<p><b>";
					sClassFeatureSpecificDescriptionText = string.match(sDescriptionTextOne, sClassFeatureDescriptionPattern);
				elseif w == #tClassFeatures then
					sClassFeatureSpecificDescriptionText, sClassFeatureDescriptionPattern = cutoffLastClassFeatureDescription(sDescriptionTextOne, sClassFeatureSpecificDescriptionText, v, sClassName);
				end
				if sClassFeatureSpecificDescriptionText then
					sClassFeatureFilteredDescriptionText = convertHTMLTable(removeLinkLists(sClassFeatureSpecificDescriptionText));
				end
				--Revert v back to unescaped version
				v = v:gsub("%%", "");
				local isFeatureInList = false;
				for _, featureNode in pairs(tCurrentFeatures) do
					if DB.getText(DB.getPath(featureNode, "value")) == v then
						isFeatureInList = true;
						break;
					end
				end
				if isFeatureInList == false then
					CharClassFeatureManager.addClassSpecificFeatures(sClassName, rAdd, v, sClassFeatureFilteredDescriptionText, sClassFeatureSpecificDescriptionText);
					--For each feature, add all powers in it (if it doesn't have the words implying a choice, like "choose", "choice", or "following")
					if not string.find(sClassFeatureSpecificDescriptionText:lower(), "choose") 
						and not string.find(sClassFeatureSpecificDescriptionText:lower(), "choice")
						and not string.find(sClassFeatureSpecificDescriptionText:lower(), "following") then
							CharClassPowerManager.addAllFeaturePowers(rAdd, sClassFeatureSpecificDescriptionText, sClassName);
					end
				end
			end
		end
	end
end