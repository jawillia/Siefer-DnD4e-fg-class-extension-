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
		return;
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

	addHybridClassPowers(rAdd, sRecordOne, sDescriptionTextOne, sRecordTwo, sDescriptionTextTwo, sClassNameOne, sClassNameTwo);

	addHybridClassSkill(rAdd, sRecordOne, sRecordTwo, sDescriptionTextOne, sDescriptionTextTwo, sClassNameOne, sClassNameTwo);

	addBonusToDefense(rAdd, sRecordOne, sRecordTwo, sDescriptionTextOne, sDescriptionTextTwo, sClassNameOne, sClassNameTwo);

	-- Notification
	ChatManager.SystemMessageResource("char_abilities_message_hybridclassadd", sClassNameOne, sClassNameTwo, rAdd.sCharName);	
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

function addHybridClassPowers(rAdd, sRecordOne, sDescriptionTextOne, sRecordTwo, sDescriptionTextTwo, sClassNameOne, sClassNameTwo)
	if not rAdd or not sRecordOne or not sRecordTwo or not sDescriptionTextOne or not sDescriptionTextTwo or not sClassNameOne or not sClassNameTwo then
		ChatManager.SystemMessageResource("char_error_hybridclasspower");
		return;
	end

	--Add one of each at-will power from each class
	--then they decide which class to get a power from
	CharClassManager.addClassPowers(rAdd, sRecordOne, sDescriptionTextOne, sClassNameOne, 1, "At-Will");
	CharClassManager.addClassPowers(rAdd, sRecordTwo, sDescriptionTextTwo, sClassNameTwo, 1, "At-Will");

	local tOptions = {};
	table.insert(tOptions, { text = sClassNameOne, linkclass = "powerdesc", linkrecord = DB.getPath(sRecordOne), });
	table.insert(tOptions, { text = sClassNameTwo, linkclass = "powerdesc", linkrecord = DB.getPath(sRecordTwo), });

	if #tOptions > 0 then
		local tDialogData = {
			title = Interface.getString("char_title_choosehybridclassforencounterpower"),
			msg = Interface.getString("char_message_choosehybridclassforencounterpower"),
			options = tOptions,
			min = 1,
			max = 1,
			callback = CharHybridClassManager.callbackResolveHybridClassEncounterPower,
			custom = { rAdd=rAdd }, 
		};
		DialogManager.requestSelectionDialog(tDialogData);
	end
	
	if #tOptions > 0 then
		local tDialogData = {
			title = Interface.getString("char_title_choosehybridclassfordailypower"),
			msg = Interface.getString("char_message_choosehybridclassfordailypower"),
			options = tOptions,
			min = 1,
			max = 1,
			callback = CharHybridClassManager.callbackResolveHybridClassDailyPower,
			custom = { rAdd=rAdd }, 
		};
		DialogManager.requestSelectionDialog(tDialogData);
	end
end
function callbackResolveHybridClassEncounterPower(tSelection, tData, tSelectionLinks)
	if not tSelection and not tSelection[1] then
		ChatManager.SystemMessageResource("char_error_hybridclasspower");
		return;
	end	
	if not tSelectionLinks and not tSelectionLinks[1] then
		ChatManager.SystemMessageResource("char_error_hybridclasspower");
		return;
	end
	local sClassName = tSelection[1];
	local rNodePath = tSelectionLinks[1].linkrecord;
	local sRecordDescriptionNode = DB.findNode(DB.getPath(tSelectionLinks[1].linkrecord, "description"));
	local sDescriptionText = DB.getValue(sRecordDescriptionNode);

	CharClassManager.addClassPowers(tData.rAdd, rNodePath, sDescriptionText, sClassName, 1, "Encounter");
end
function callbackResolveHybridClassDailyPower(tSelection, tData, tSelectionLinks)
	if not tSelection and not tSelection[1] then
		ChatManager.SystemMessageResource("char_error_hybridclasspower");
		return;
	end	
	if not tSelectionLinks and not tSelectionLinks[1] then
		ChatManager.SystemMessageResource("char_error_hybridclasspower");
		return;
	end
	local sClassName = tSelection[1];
	local rNodePath = tSelectionLinks[1].linkrecord;
	local sRecordDescriptionNode = DB.findNode(DB.getPath(tSelectionLinks[1].linkrecord, "description"));
	local sDescriptionText = DB.getValue(sRecordDescriptionNode);

	CharClassManager.addClassPowers(tData.rAdd, rNodePath, sDescriptionText, sClassName, 1, "Daily");
end

function addHybridClassSkill(rAdd, sRecordOne, sRecordTwo, sDescriptionTextOne, sDescriptionTextTwo, sClassNameOne, sClassNameTwo)
	--Reset class trained skills before adding new ones
	for __,y in pairs(DB.getChildren(rAdd.nodeChar, "skilllist")) do
		DB.setValue(y, "trained", "number", "0");
	end

	local sFirstClassFirstSkillSentence = '';
	local sSecondClassFirstSkillSentence = '';
	local tFirstSkillValues = {};
	local nFirstSkillCount = 1;
	local sSkillValue = '';
	local sNumberOfTrainedSkills = '0';
	--Hybrid classes always choose 3 skills.
	local nNumberOfTrainedSkills = 3;
	local hasExtraTrainedSkillHybridClassOne = false;
	local hasExtraTrainedSkillHybridClassTwo = false;
	--If they have the Extra Trained Skills Feature, you can choose an additional skill from that class's skill list
	if sDescriptionTextOne then
		local sExtraSkillDescriptionTextLine = string.match(sDescriptionTextOne, "<p>%s*<b>%s*Extra Trained Skill%s*:%s*</b>%s*(.-)</p>");
		if sExtraSkillDescriptionTextLine then
			hasExtraTrainedSkillHybridClassOne = true;
		end
	end
	if sDescriptionTextTwo then
		local sExtraSkillDescriptionTextLine = string.match(sDescriptionTextTwo, "<p>%s*<b>%s*Extra Trained Skill%s*:%s*</b>%s*(.-)</p>");
		if sExtraSkillDescriptionTextLine then
			hasExtraTrainedSkillHybridClassTwo = true;
		end
	end	
	if sDescriptionTextOne and sDescriptionTextTwo then
		--Add skills from first hybrid class
		local sFirstClassSkillBonusesDescriptionTextLine = string.match(sDescriptionTextOne, "<p>%s*<b>%s*Trained Skills%s*</b>%s*:%s*(.-)</p>");
		local sFirstClassSkillsDescriptionTextLine = string.match(sDescriptionTextOne, "<p>%s*<i>%s*Class Skills%s*</i>%s*:%s*(.-)</p>");
		--if the first hybrid class description doesn't have the class skill list, then take it from the original class
		if not sFirstClassSkillBonusesDescriptionTextLine and not sFirstClassSkillsDescriptionTextLine then
			local sNonHybridClassName = sClassNameOne:gsub("[Hh]ybrid ", "");
			local tClassNodes = DB.getChildrenGlobal("reference.classes");
			for _,classNode in ipairs(tClassNodes) do
				local sDBClassName = DB.getText(DB.getPath(classNode, "name"));
				if sDBClassName == sNonHybridClassName then
					local sRecordDescriptionNode = DB.findNode(DB.getPath(classNode, "description"));
					sDescriptionTextOne = DB.getValue(sRecordDescriptionNode);
					--Retrieve the proper text from the patterns again using the description text of the non-hybrid version of the class
					if sDescriptionTextOne then
						--I don't think automatically added skills are added for hybrid characters so I will comment this out until I learn otherwise
						--sFirstClassSkillBonusesDescriptionTextLine = string.match(sDescriptionTextOne, "<p>%s*<b>%s*Trained Skills%s*</b>%s*:%s*(.-)</p>");
						sFirstClassSkillsDescriptionTextLine = string.match(sDescriptionTextOne, "<p>%s*<i>%s*Class Skills%s*</i>%s*:%s*(.-)</p>");
					end
				end
			end
		end
		if sFirstClassSkillBonusesDescriptionTextLine then
			local sFirstClassFirstSkillSentence = string.match(sFirstClassSkillBonusesDescriptionTextLine, ".-%.");
			if string.find(sFirstClassFirstSkillSentence:upper(), "FROM") then
				sFirstClassFirstSkillSentence = nil;
			end
		end
		if sFirstClassSkillsDescriptionTextLine then
			sSkillValue = string.match(sFirstClassSkillsDescriptionTextLine, "[%w%(%),%s]+");
		end
		--Add skills from second hybrid class
		local sSecondClassSkillBonusesDescriptionTextLine = string.match(sDescriptionTextTwo, "<p>%s*<b>%s*Trained Skills%s*</b>%s*:%s*(.-)</p>");
		local sSecondClassSkillsDescriptionTextLine = string.match(sDescriptionTextTwo, "<p>%s*<i>%s*Class Skills%s*</i>%s*:%s*(.-)</p>");
		--if the first hybrid class description doesn't have the class skill list, then take it from the original class
		if not sSecondClassSkillBonusesDescriptionTextLine and not sSecondClassSkillsDescriptionTextLine then
			local sNonHybridClassName = sClassNameTwo:gsub("[Hh]ybrid ", "");
			local tClassNodes = DB.getChildrenGlobal("reference.classes");
			for _,classNode in ipairs(tClassNodes) do
				local sDBClassName = DB.getText(DB.getPath(classNode, "name"));
				if sDBClassName == sNonHybridClassName then
					local sRecordDescriptionNode = DB.findNode(DB.getPath(classNode, "description"));
					sDescriptionTextTwo = DB.getValue(sRecordDescriptionNode);
					--Retrieve the proper text from the patterns again using the description text of the non-hybrid version of the class
					if sDescriptionTextTwo then
						--I don't think automatically added skills are added for hybrid characters so I will comment this out until I learn otherwise
						--sSecondClassSkillBonusesDescriptionTextLine = string.match(sDescriptionTextTwo, "<p>%s*<b>%s*Trained Skills%s*</b>%s*:%s*(.-)</p>");
						sSecondClassSkillsDescriptionTextLine = string.match(sDescriptionTextTwo, "<p>%s*<i>%s*Class Skills%s*</i>%s*:%s*(.-)</p>");
					end
				end
			end
		end
		if sSecondClassSkillBonusesDescriptionTextLine then
			sSecondClassFirstSkillSentence = string.match(sSecondClassSkillBonusesDescriptionTextLine, ".-%.");
			if string.find(sSecondClassFirstSkillSentence:upper(), "FROM") then
				sSecondClassFirstSkillSentence = nil;
			end
		end
		if sSecondClassSkillsDescriptionTextLine then
			sSkillValue = sSkillValue .. "," .. string.match(sSecondClassSkillsDescriptionTextLine, "[%w%(%),%s]+");
		end
	end
	--Add any automatically added skills as trained from the first hybrid class
	-- if the first sentence doesn't have a choice and isn't the main sentence
	if sFirstClassFirstSkillSentence and not string.find(sFirstClassFirstSkillSentence, " or ") then
		for sFirstSkillValue in string.gmatch(sFirstClassFirstSkillSentence, "[%w]+") do
			tFirstSkillValues[nFirstSkillCount] = sFirstSkillValue;
			nFirstSkillCount = nFirstSkillCount + 1;
		end
		for skillIndex,x in pairs(tFirstSkillValues) do
			local rCreatedIDChildren = DB.getChildren(rAdd.nodeChar, "skilllist");
			for __,y in pairs(rCreatedIDChildren) do
				if DB.getText(y, "label") == x then
					DB.setValue(y, "trained", "number", "1");
					ChatManager.SystemMessageResource("char_skills_message_skilltrained", x, rAdd.sCharName);
				end
			end			
		end
	end
	--Add automatically added skills from the second hybrid class
	if sSecondClassFirstSkillSentence and not string.find(sSecondClassFirstSkillSentence, " or ") then
		for sFirstSkillValue in string.gmatch(sSecondClassFirstSkillSentence, "[%w]+") do
			tFirstSkillValues[nFirstSkillCount] = sFirstSkillValue;
			nFirstSkillCount = nFirstSkillCount + 1;
		end
		for skillIndex,x in pairs(tFirstSkillValues) do
			local rCreatedIDChildren = DB.getChildren(rAdd.nodeChar, "skilllist");
			for __,y in pairs(rCreatedIDChildren) do
				if DB.getText(y, "label") == x then
					DB.setValue(y, "trained", "number", "1");
					ChatManager.SystemMessageResource("char_skills_message_skilltrained", x, rAdd.sCharName);
				end
			end			
		end		
	end
	--Display dialogue with limited set of skills before they can choose greater set of skills
	--From first hybrid class
	if sFirstClassFirstSkillSentence and string.find(sFirstClassFirstSkillSentence, " or ") then 
		local fnLimitedSkills = string.gmatch(sFirstClassFirstSkillSentence, "[%w]+");
		local tLimitedOptions = {};
		local nlimitedOptionCount = 1;
		for limitedSkill in fnLimitedSkills do
			if limitedSkill ~= "or" and limitedSkill ~= "your" and limitedSkill ~= "choice" then
				tLimitedOptions[nlimitedOptionCount] = limitedSkill;
				nlimitedOptionCount = nlimitedOptionCount + 1;
			end
		end
		if #tLimitedOptions > 1 then
			local tDialogData = {
				title = Interface.getString("char_build_title_selectclassskill"),
				msg = Interface.getString("char_build_message_selectclassskill"):format("1"),
				options = tLimitedOptions,
				min = 1,
				max = 1,
				callback = CharClassManager.callbackResolveSkillTrainOnClassDrop,
				custom = rAdd,
			};
			DialogManager.requestSelectionDialog(tDialogData);
		end
	end	
	--From second hybrid class	
	if sSecondClassFirstSkillSentence and string.find(sSecondClassFirstSkillSentence, " or ") then 
		local fnLimitedSkills = string.gmatch(sSecondClassFirstSkillSentence, "[%w]+");
		local tLimitedOptions = {};
		local nlimitedOptionCount = 1;
		for limitedSkill in fnLimitedSkills do
			if limitedSkill ~= "or" and limitedSkill ~= "your" and limitedSkill ~= "choice" then
				tLimitedOptions[nlimitedOptionCount] = limitedSkill;
				nlimitedOptionCount = nlimitedOptionCount + 1;
			end
		end
		if #tLimitedOptions > 1 then
			local tDialogData = {
				title = Interface.getString("char_build_title_selectclassskill"),
				msg = Interface.getString("char_build_message_selectclassskill"):format("1"),
				options = tLimitedOptions,
				min = 1,
				max = 1,
				callback = CharClassManager.callbackResolveSkillTrainOnClassDrop,
				custom = rAdd,
			};
			DialogManager.requestSelectionDialog(tDialogData);
		end
	end

	if nNumberOfTrainedSkills then
		-- Display a selection dialogue for the choice of trained skills
		local tOptions = StringManager.splitByPattern(sSkillValue, ",", true);
		--Remove empty values
		for i,x in ipairs(tOptions) do
			if StringManager.trim(x) == "" then
				table.remove(tOptions, i);
			end
		end		
		--Remove initial trained skill from the list so they don't train it twice
		if tFirstSkillValues and #tFirstSkillValues > 0 then
			for skillindex,sFirstSkillValue in pairs(tFirstSkillValues) do
				for key,x in pairs(tOptions) do
					local startIndex, endIndex = string.find(x, sFirstSkillValue);
					if startIndex then
						table.remove(tOptions, key);
					end
				end
			end
		end
		--Remove duplicate powers from the list
		local hash = {};
		local result = {};
		for _,v in ipairs(tOptions) do
		   if (not hash[v]) then
		       result[#result+1] = v
		       hash[v] = true
		   end
		end
		tOptions = result;
		local tDialogData = {
			title = Interface.getString("char_build_title_selectclassskill"),
			msg = Interface.getString("char_build_message_selectclassskill"):format(nNumberOfTrainedSkills),
			options = tOptions,
			min = nNumberOfTrainedSkills,
			max = nNumberOfTrainedSkills,
			callback = CharHybridClassManager.callbackResolveSkillTrainOnHybridClassDrop,
			custom = { rAdd=rAdd, hasExtraTrainedSkillHybridClassOne=hasExtraTrainedSkillHybridClassOne, hasExtraTrainedSkillHybridClassTwo=hasExtraTrainedSkillHybridClassTwo, sDescriptionTextOne=sDescriptionTextOne, sDescriptionTextTwo=sDescriptionTextTwo, sClassNameOne=sClassNameOne, sClassNameTwo=sClassNameTwo },
		};
		DialogManager.requestSelectionDialog(tDialogData);
	end	
end
--like the normal version of this in CharClassManager.callbackResolveSkillTrainOnClassDrop
--but also possibly calls a subsequent dialog to add a hybrid class extra trained skill
function callbackResolveSkillTrainOnHybridClassDrop(tSelection, tData, tSelectionLinks)
	if not tSelectionLinks then
		CharManager.outputUserMessage("char_error_addclassskill");
		return;
	end
	if not tSelection then
		CharManager.outputUserMessage("char_error_addclassskill");
		return;
	end
	for _,selectedSkill in pairs(tSelection) do
		local sSkill = string.lower(string.match(selectedSkill, "%a+"));
		local rSkillNodeChildren = DB.getChildren(tData.rAdd.nodeChar, "skilllist");
		local doesSkillExist = false;
		for _,x in pairs(rSkillNodeChildren) do
			if string.lower(DB.getText(x, "label")) == string.lower(sSkill) then
				doesSkillExist = true;
				DB.setValue(x, "trained", "number", "1");
				sSkill = string.gsub(sSkill, "^%l", string.upper);
				ChatManager.SystemMessageResource("char_skills_message_skilltrained", sSkill, tData.rAdd.sCharName);
			end
		end
	end
	if tData.hasExtraTrainedSkillHybridClassOne then
		CharHybridClassManager.addHybridClassExtraTrainedSkill(tData.rAdd, tData.sDescriptionTextOne, tData.sClassNameOne);
	end
	if tData.hasExtraTrainedSkillHybridClassTwo then
		CharHybridClassManager.addHybridClassExtraTrainedSkill(tData.rAdd, tData.sDescriptionTextTwo, tData.sClassNameTwo);
	end
end
function addHybridClassExtraTrainedSkill(rAdd, sDescriptionText, sClassName)
	local sSkillValue = '';
	local nNumberOfTrainedSkills = 1;

	if sDescriptionText then
		local sClassSkillsDescriptionTextLine = string.match(sDescriptionText, "<p>%s*<i>%s*Class Skills%s*</i>%s*:%s*(.-)</p>");
		sSkillValue = string.match(sClassSkillsDescriptionTextLine, "[%w%(%),%s]+");
	end

	-- Display a selection dialogue for the choice of trained skills
	local tOptions = StringManager.splitByPattern(sSkillValue, ",", true);

	--Remove already trained skills from the list
	for __,y in pairs(DB.getChildren(rAdd.nodeChar, "skilllist")) do
		if DB.getValue(y, "trained") == 1 then
			local sSkillName = DB.getText(y, "label");
			for skillKey, skillOption in pairs(tOptions) do
				if string.find(skillOption:lower(), sSkillName:lower()) then
					table.remove(tOptions, skillKey);
					break;
				end
			end
		end
	end
	--Remove duplicate powers from the list
	-- local hash = {};
	-- local result = {};
	-- for _,v in ipairs(tOptions) do
	--    if (not hash[v]) then
	--        result[#result+1] = v
	--        hash[v] = true
	--    end
	-- end
	-- tOptions = result;
	local tDialogData = {
		title = Interface.getString("char_build_title_selecthybridclassskill"),
		msg = Interface.getString("char_build_message_selecthybridclassskill"):format(nNumberOfTrainedSkills,sClassName),
		options = tOptions,
		min = 1,
		max = 1,
		callback = CharClassManager.callbackResolveSkillTrainOnClassDrop,
		custom = rAdd,
	};
	DialogManager.requestSelectionDialog(tDialogData);
end
function addBonusToDefense(rAdd, sRecordOne, sRecordTwo, sDescriptionTextOne, sDescriptionTextTwo, sClassNameOne, sClassNameTwo)
	if not rAdd then
		return;
	end
	if not sRecordOne and not sDescriptionTextOne and not sRecordTwo and not sDescriptionTextTwo then
		return;
	end

	--Reset class defense bonuses before adding new ones
	for __,y in pairs(DB.getChildren(rAdd.nodeChar, "defenses")) do
		local nCurrentDefense = DB.getValue(y, "total", 0);
		local nCurrentDefenseClassBonus = DB.getValue(y, "class", "0");
		if nCurrentDefenseClassBonus and nCurrentDefenseClassBonus ~= "0" then
			--DB.setValue(y, "total", "number", nCurrentDefense - nCurrentDefenseClassBonus);
			DB.setValue(y, "class", "number", "0");
		end
	end

	local sHybridClassOneDefenseValue = '';
	local sHybridClassTwoDefenseValue = '';
	local hasHybridClassOneDefenseChoice = false;
	local hasHybridClassTwoDefenseChoice = false;
	
	if sDescriptionTextOne then
		local sDefensesDescriptionTextLine = string.match(sDescriptionTextOne, "<p>%s*<b>%s*Bonus to Defense%s*:%s*</b>%s*(.-)</p>");
		sHybridClassOneDefenseValue = string.match(sDefensesDescriptionTextLine, "[%w,%s%+]+");
		if sHybridClassOneDefenseValue:find(" or ") then
			hasHybridClassOneDefenseChoice = true;
		end
	end
	if sDescriptionTextTwo then
		local sDefensesDescriptionTextLine = string.match(sDescriptionTextTwo, "<p>%s*<b>%s*Bonus to Defense%s*:%s*</b>%s*(.-)</p>");
		sHybridClassTwoDefenseValue = string.match(sDefensesDescriptionTextLine, "[%w,%s%+]+");
		if sHybridClassTwoDefenseValue:find(" or ") then
			hasHybridClassTwoDefenseChoice = true;
		end
	end
	-- Direct increase defenses that don't have a choice
	if not hasHybridClassOneDefenseChoice then
		local tHOneDefenseBonuses = StringManager.split(sHybridClassOneDefenseValue, ',', true);
		for _,x in pairs(tHOneDefenseBonuses) do
			if not string.find(x, " or ") then
				local rDefensesNode = DB.findNode(DB.getPath(rAdd.nodeChar, "defenses"));
				local sDefenseName = string.match(x, "%a+");
				local nDefenseBonusNumber = string.match(x, "%d+");
				if not nDefenseBonusNumber then
					nDefenseBonusNumber = "1";
				end
				local rDefenseNodeChild = DB.getChild(rDefensesNode, string.lower(sDefenseName));
				if rDefenseNodeChild then
					local nCurrentDefenseClassBonus = DB.getValue(rDefenseNodeChild, "class", "0");
					local nCurrentDefense = DB.getValue(rDefenseNodeChild, "total", 0);
					DB.setValue(rDefenseNodeChild, "class", "number", nDefenseBonusNumber);
					DB.setValue(rDefenseNodeChild, "total", "number", nCurrentDefense + nDefenseBonusNumber);
					ChatManager.SystemMessageResource("char_main_message_defensebonusadd", nDefenseBonusNumber, sDefenseName, rAdd.sCharName);
				end
			end
		end
	end
	if not hasHybridClassTwoDefenseChoice then
		local tHTwoDefenseBonuses = StringManager.split(sHybridClassTwoDefenseValue, ',', true);
		for _,x in pairs(tHTwoDefenseBonuses) do
			-- Direct increase defenses that don't have a choice
			if not string.find(x, " or ") then
				local rDefensesNode = DB.findNode(DB.getPath(rAdd.nodeChar, "defenses"));
				local sDefenseName = string.match(x, "%a+");
				local nDefenseBonusNumber = string.match(x, "%d+");
				if not nDefenseBonusNumber then
					nDefenseBonusNumber = "1";
				end
				local rDefenseNodeChild = DB.getChild(rDefensesNode, string.lower(sDefenseName));
				if rDefenseNodeChild then
					local nCurrentDefenseClassBonus = DB.getValue(rDefenseNodeChild, "class", "0");
					local nCurrentDefense = DB.getValue(rDefenseNodeChild, "total", 0);
					DB.setValue(rDefenseNodeChild, "class", "number", nCurrentDefenseClassBonus + nDefenseBonusNumber);
					DB.setValue(rDefenseNodeChild, "total", "number", nCurrentDefense + nDefenseBonusNumber);
					ChatManager.SystemMessageResource("char_main_message_defensebonusadd", nDefenseBonusNumber, sDefenseName, rAdd.sCharName);
				end
			end
		end	
	end
	-- Add in logic to display a selection dialogue if there is a choice for defense increase
	if hasHybridClassOneDefenseChoice then
		local tOptions = {};
		local tHOneDefenseBonuses = StringManager.split(sHybridClassOneDefenseValue, ',', true);
		for _,x in pairs(tHOneDefenseBonuses) do
			--Remove the word "or" and trim
			if string.find(x, " or ") then
				for i,y in pairs(StringManager.splitByPattern(x, ' or ', true)) do
					if #StringManager.trim(y) > 1 then
						tOptions[#tOptions+1] = y;
					end
				end
			else
				x = StringManager.trim(x);
				tOptions[#tOptions+1] = x;
			end
		end
		local title = string.format(Interface.getString("char_title_hybridclassbonustodefense"), sClassNameOne);
		local msg = string.format(Interface.getString("char_message_hybridclassbonustodefense"), sClassNameOne);
		local tDialogData = {
			title = title,
			msg = msg,
			options = tOptions,
			min = nNumberOfPowers,
			max = nNumberOfPowers,
			callback = CharHybridClassManager.callbackResolveHybridClassBonusToDefense,
			custom = { rAdd=rAdd, sClassName=sClassNameOne }, 
		};
		DialogManager.requestSelectionDialog(tDialogData);		
	end
	if hasHybridClassTwoDefenseChoice then
		local tOptions = {};
		local tHTwoDefenseBonuses = StringManager.split(sHybridClassTwoDefenseValue, ',', true);
		for _,x in pairs(tHTwoDefenseBonuses) do
			--Remove the word "or" and trim
			if string.find(x, " or ") then
				for i,y in pairs(StringManager.splitByPattern(x, ' or ', true)) do
					if #StringManager.trim(y) > 1 then
						tOptions[#tOptions+1] = y;
					end
				end
			else
				x = StringManager.trim(x);
				tOptions[#tOptions+1] = x;
			end
		end
		local title = string.format(Interface.getString("char_title_hybridclassbonustodefense"), sClassNameTwo);
		local msg = string.format(Interface.getString("char_message_hybridclassbonustodefense"), sClassNameTwo);
		local tDialogData = {
			title = title,
			msg = msg,
			options = tOptions,
			min = nNumberOfPowers,
			max = nNumberOfPowers,
			callback = CharHybridClassManager.callbackResolveHybridClassBonusToDefense,
			custom = { rAdd=rAdd, sClassName=sClassNameTwo }, 
		};
		DialogManager.requestSelectionDialog(tDialogData);		
	end	
end
function callbackResolveHybridClassBonusToDefense(tSelection, tData)
	if not tSelection and tSelection[1] then
		if not tData.sClassName then
			tData.sClassName = "Hybrid Class";
		end
		ChatManager.SystemMessageResource("char_error_addhybridclassdefense", tData.sClassName);
		return;
	end
	local rDefensesNode = DB.findNode(DB.getPath(tData.rAdd.nodeChar, "defenses"));
	local sDefenseName = string.match(tSelection[1], "%a+");
	local nDefenseBonusNumber = string.match(tSelection[1], "%d+");
	if not nDefenseBonusNumber then
		nDefenseBonusNumber = "1";
	end
	local rDefenseNodeChild = DB.getChild(rDefensesNode, string.lower(sDefenseName));
	if rDefenseNodeChild then
		local nCurrentDefenseClassBonus = DB.getValue(rDefenseNodeChild, "class", "0");
		local nCurrentDefense = DB.getValue(rDefenseNodeChild, "total", 0);
		DB.setValue(rDefenseNodeChild, "class", "number", nCurrentDefenseClassBonus + nDefenseBonusNumber);
		DB.setValue(rDefenseNodeChild, "total", "number", nCurrentDefense + nDefenseBonusNumber);
		ChatManager.SystemMessageResource("char_main_message_defensebonusadd", nDefenseBonusNumber, sDefenseName, tData.rAdd.sCharName);
	end
end