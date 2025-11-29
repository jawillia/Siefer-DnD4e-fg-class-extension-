-- 
-- Please see the license.html file included with this distribution for 
-- attribution and copyright information.
--

function addClass(nodeChar, sRecord, tData)
	local rAdd = CharClassBuildDropManager.helperBuildAddStructure(nodeChar, "powerdesc", sRecord, tData);
	local sClassName = DB.getText(DB.getPath(sRecord, "name"));

	-- Get Class Node Information
	---- First tries through the description of the database module
	local sRecordDescriptionNode = DB.findNode(DB.getPath(sRecord, "description"));
	local sDescriptionText = DB.getValue(sRecordDescriptionNode);

	--Add Class Proficiencies
	addClassArmorProficiencies(rAdd, sRecord, sDescriptionText);
	addClassWeaponProficiencies(rAdd, sRecord, sDescriptionText);

	--Add Class name, level, and link
	addClassNameAndLevel(rAdd, sRecord, sClassName);

	--Add Class Hit Points
	addClassHitPoints(rAdd, sRecord, sDescriptionText);

	--Add Class Healing Surges
	addClassHealingSurges(rAdd, sRecord, sDescriptionText);

	--Add Class Features
	addClassFeatures(rAdd, sRecord, sDescriptionText, sClassName);

	-- --Add Race Powers
	-- addRacePowers(rAdd, sRecord, sDescriptionText);

	-- --Add skill bonuses
	addClassSkill(rAdd, sRecord, sDescriptionText);

	--Add Defense bonuses
	CharClassManager.helperResolveDefenseIncreaseOnRaceDrop(rAdd, sRecord, sDescriptionText);

	-- Notification
	ChatManager.SystemMessageResource("char_abilities_message_classadd", sClassName, rAdd.sCharName);
	
end

function addClassNameAndLevel(rAdd, sRecord, sClassName)
	DB.setValue(rAdd.nodeChar, "class.base", "string", sClassName);	
	DB.setValue(rAdd.nodeChar, "level", "number", "1");
	DB.setValue(rAdd.nodeChar, "classlink", "windowreference", "powerdesc", DB.getPath(rAdd.nodeSource));
end

function addClassArmorProficiencies(rAdd, sRecord, sDescriptionText)
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
	for _,x in pairs(tArmorProficiencies) do
		x = x:gsub("^%s+", ""):gsub("%s+$", "");
		local isArmorProficiencyInList = false;
		for armorProficiencyName, armorProficiencyNode in pairs(tCurrentArmorProficiencies) do
			if DB.getText(DB.getPath(armorProficiencyNode, "value")) == x then
				isArmorProficiencyInList = true;
				break;
			end
		end
		if isArmorProficiencyInList == false then
			local rCreatedIDChildNode = DB.createChild(rAdd.nodeChar.getPath("proficiencyarmor"));
			DB.setValue(rCreatedIDChildNode, "shortcut", "windowreference");
			DB.setValue(rCreatedIDChildNode, "value", "string", x);
			ChatManager.SystemMessageResource("char_abilities_message_armorproficiencyadd", x, rAdd.sCharName);
		end
	end
end

function addClassWeaponProficiencies(rAdd, sRecord, sDescriptionText)
	local sWeaponProficienciesValue = '';
	local sImplementsProficienciesValue = '';
	local sImplementsDetailsValue = '';
	-- local rWeaponProficienciesNode = DB.findNode(DB.getPath(sRecord, "weaponproficiencies"));
	-- if rWeaponProficienciesNode then
	-- 		sWeaponProficienciesValue = DB.getText(rWeaponProficienciesNode);
	-- elseif DB.findNode(DB.getPath(sRecord, "traits")) then
	-- 	local rRecordTraitsNode = DB.findNode(DB.getPath(sRecord, "traits"));
	-- 	if rRecordTraitsNode then
	-- 		local rArmorProficienciesTraitsNode = DB.getChild(rRecordTraitsNode, "weaponproficiencies");
	-- 		if rArmorProficienciesTraitsNode then
	-- 			local rArmorProficiencyTextNode = DB.getChild(rArmorProficienciesTraitsNode, "text");
	-- 			sWeaponProficienciesValue = DB.getText(rArmorProficiencyTextNode);
	-- 		end
	-- 	end
	-- elseif sDescriptionText then
	if sDescriptionText then
		local sWeaponProficiencyDescriptionTextLine = string.match(sDescriptionText, "<p>%s*<b>%s*Weapon Proficiencies%s*:%s*</b>(.-)</p>");
		sWeaponProficienciesValue = string.match(sWeaponProficiencyDescriptionTextLine, "[%a,%s%-]+");
		local sImplementProficiencyDescriptionTextLine = string.match(sDescriptionText, "<p>%s*<b>%s*Implement%s*:%s*</b>(.-)</p>");
		if sImplementProficiencyDescriptionTextLine then
			sImplementsProficienciesValue = string.match(sImplementProficiencyDescriptionTextLine, "[%a,%s]+");
		end
		local sImplementsDetailsDescriptionTextLine = string.match(sDescriptionText, "<p>%s*<b>%s*IMPLEMENTS%s*</b></p>%s*<p>(.*)</p>");
		if sImplementsDetailsDescriptionTextLine then
			sImplementsDetailsValue = string.gsub(sImplementsDetailsDescriptionTextLine, "</p>", "\n");
			sImplementsDetailsValue = string.gsub(sImplementsDetailsValue, "<p>", "    ");
		end
	end
	local tWeaponProficiencies = StringManager.split(sWeaponProficienciesValue, ',', true);
	local tCurrentWeaponProficiencies = DB.getChildren(rAdd.nodeChar, "proficiencyweapon");
	for _,x in pairs(tWeaponProficiencies) do
		x = x:gsub("^%s+", ""):gsub("%s+$", "");
		local isWeaponProficiencyInList = false;
		for weaponProficiencyName, weaponProficiencyNode in pairs(tCurrentWeaponProficiencies) do
			if DB.getText(DB.getPath(weaponProficiencyNode, "value")) == x then
				isWeaponProficiencyInList = true;
				break;
			end
		end
		if isWeaponProficiencyInList == false then
			local rCreatedIDChildNode = DB.createChild(rAdd.nodeChar.getPath("proficiencyweapon"));
			DB.setValue(rCreatedIDChildNode, "shortcut", "windowreference");
			DB.setValue(rCreatedIDChildNode, "value", "string", x);
			ChatManager.SystemMessageResource("char_abilities_message_weaponproficiencyadd", x, rAdd.sCharName);
		end
	end
	local tImplementProficiencies = StringManager.split(sImplementsProficienciesValue, ',', true);
	local tCurrentWeaponProficiencies = DB.getChildren(rAdd.nodeChar, "proficiencyweapon");
	for _,y in pairs(tImplementProficiencies) do
		local isImplementProficiencyInList = false;
		for implementProficiencyName, implementProficiencyNode in pairs(tCurrentWeaponProficiencies) do
			if DB.getText(DB.getPath(implementProficiencyNode, "value")) == y then
				isImplementProficiencyInList = true;
				break;
			end
		end
		if isImplementProficiencyInList == false then
			local rCreatedIDChildNode = DB.createChild(rAdd.nodeChar.getPath("proficiencyweapon"));
			DB.setValue(rCreatedIDChildNode, "shortcut", "windowreference");
			DB.setValue(rCreatedIDChildNode, "value", "string", y);
			if sImplementsDetailsValue then
				DB.setValue(rCreatedIDChildNode, "description", "string", sImplementsDetailsValue);
			end
			ChatManager.SystemMessageResource("char_abilities_message_implementproficiencyadd", y, rAdd.sCharName);
		end
	end
end

function addClassHitPoints(rAdd, sRecord, sDescriptionText)
	local sHitPointsAtFirstLevelValue = '';
	if sDescriptionText then
		local sHitPointsAtFirstLevelDescriptionTextLine = string.match(sDescriptionText, "<p>%s*<b>%s*Hit Points at 1st Level%s*</b>:%s*(.-)</p>");
		sHitPointsAtFirstLevelValue = string.match(sHitPointsAtFirstLevelDescriptionTextLine, "[%d]+");
	end
	local rCharacterHPNode = DB.findNode(rAdd.nodeChar.getPath("hp"));
	local rCharacterConNode = DB.findNode(rAdd.nodeChar.getPath("abilities", "constitution"));
	local nCharacterConValue = DB.getValue(rCharacterConNode, "score", 0);
	local nHitPointsAtFirstLevelTotal = sHitPointsAtFirstLevelValue + nCharacterConValue;
	if rCharacterHPNode and nHitPointsAtFirstLevelTotal then
		DB.setValue(rCharacterHPNode, "total", "number", nHitPointsAtFirstLevelTotal);
		ChatManager.SystemMessageResource("char_combat_message_hitpointsatfirstleveladd", nHitPointsAtFirstLevelTotal, rAdd.sCharName);
	end
end

function addClassHealingSurges(rAdd, sRecord, sDescriptionText)
	local sHealingSurgesPerDayValue = '';
	if sDescriptionText then
		local sHealingSurgesPerDayDescriptionTextLine = string.match(sDescriptionText, "<p>%s*<b>%s*Healing Surges per Day%s*</b>:%s*(.-)</p>");
		sHealingSurgesPerDayValue = string.match(sHealingSurgesPerDayDescriptionTextLine, "[%d]+");
	end
	local rCharacterHPNode = DB.findNode(rAdd.nodeChar.getPath("hp"));
	local rCharacterConNode = DB.findNode(rAdd.nodeChar.getPath("abilities", "constitution"));
	local nCharacterConModValue = DB.getValue(rCharacterConNode, "bonus", 0);
	local nHealingSurgesPerDayTotal = sHealingSurgesPerDayValue + nCharacterConModValue;
	if rCharacterHPNode and nHealingSurgesPerDayTotal then
		DB.setValue(rCharacterHPNode, "surgesmax", "number", nHealingSurgesPerDayTotal);
		ChatManager.SystemMessageResource("char_combat_message_healingsurgesperdayadd", nHealingSurgesPerDayTotal, rAdd.sCharName);
	end
end

function addClassFeatures(rAdd, sRecord, sDescriptionText, sClassName)
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
	if sDescriptionText then
	-- then through the description text
		local sClassFeaturesDescriptionTextLine = string.match(sDescriptionText, "<p>%s*<b>%s*Class features%s*:%s*</b>(.-)</p>");
		--If it's an essentials class, keep the text down to just level 1 (for now)
		if sDescriptionText and string.find(sDescriptionText, "<p><b>Level 1:</b></p>") and string.find(sDescriptionText, "<p><b>Level 2:</b></p>") then
			sDescriptionText = string.match(sDescriptionText, "(.-)<p><b>Level 2:</b></p>");
		end
		if sClassFeaturesDescriptionTextLine then
			sClassFeaturesValue = string.match(sClassFeaturesDescriptionTextLine, "[%w,'%(%)%-%s]+");
		end
		local tClassFeatures = StringManager.split(sClassFeaturesValue, ',', true);
		--Pre-Feature Class Feature added here, features that must be chosen before other features, like warpriest domains
		local tClassesWithPreFeatures = {};
		tClassesWithPreFeatures = loadClassesWithPreFeatures(tClassesWithPreFeatures);
		if tClassesWithPreFeatures[sClassName:upper()] then
			CharClassFeatureManager.addClassSpecificPreFeatures(sClassName, rAdd, sDescriptionText, tClassFeatures);
		else
			for w,v in pairs(tClassFeatures) do
				local sClassFeatureDescriptionPattern = '';
				v = v:gsub("[%(%)%-]", "%%%0");
				v = v:gsub("(%a)([%w_']*)", titleCase);
				if w < #tClassFeatures then
					sClassFeatureDescriptionPattern = "<p>%s*<b>%s*" .. v .. "%s*</b></p>%s*(.-)<p><b>";
					sClassFeatureSpecificDescriptionText = string.match(sDescriptionText, sClassFeatureDescriptionPattern);
				elseif w == #tClassFeatures then
					sClassFeatureSpecificDescriptionText, sClassFeatureDescriptionPattern = cutoffLastClassFeatureDescription(sDescriptionText, sClassFeatureSpecificDescriptionText, v, sClassName);
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
				end
			end
		end
	end
end
function loadClassesWithPreFeatures(tClassesWithPreFeatures)
	tClassesWithPreFeatures["CLERIC (WARPRIEST)"] = true;
	tClassesWithPreFeatures["DRUID (SENTINEL)"] = true;
	tClassesWithPreFeatures["WARLOCK (HEXBLADE)"] = true;
	tClassesWithPreFeatures["WARLOCK (BINDER)"] = true;
	tClassesWithPreFeatures["DRUID (PROTECTOR)"] = true;

	return tClassesWithPreFeatures;
end
function cutoffLastClassFeatureDescription(sDescriptionText, sClassFeatureSpecificDescriptionText, sClassFeatureName, sClassName)
	-- On the last feature entry, first try reading to the class overview
	local sClassFeatureDescriptionPattern = "<p>%s*<b>%s*" .. sClassFeatureName .. "%s*</b></p>%s*(.-)<p>" .. sClassName:upper() .. " OVERVIEW</p>";
	sClassFeatureSpecificDescriptionText = string.match(sDescriptionText, sClassFeatureDescriptionPattern);
	-- Then try reading to alternative features
	if sClassFeatureSpecificDescriptionText == nil then
		sClassFeatureDescriptionPattern = "<p>%s*<b>%s*" .. sClassFeatureName .. "%s*</b></p>%s*(.-)<p><b>Alternative";
		sClassFeatureSpecificDescriptionText = string.match(sDescriptionText, sClassFeatureDescriptionPattern);
	end	
	-- Or read to the Implements
	if sClassFeatureSpecificDescriptionText == nil then
		sClassFeatureDescriptionPattern = "<p>%s*<b>%s*" .. sClassFeatureName .. "%s*</b></p>%s*(.-)<p><b>IMPLEMENTS</b></p>";
		sClassFeatureSpecificDescriptionText = string.match(sDescriptionText, sClassFeatureDescriptionPattern);
	end		
	-- Or read to the Ability Scores
	if sClassFeatureSpecificDescriptionText == nil then
		sClassFeatureDescriptionPattern = "<p>%s*<b>%s*" .. sClassFeatureName .. "%s*</b></p>%s*(.-)<p>Ability Scores</p>";
		sClassFeatureSpecificDescriptionText = string.match(sDescriptionText, sClassFeatureDescriptionPattern);
	end	
	-- Or read to the publish text
	if sClassFeatureSpecificDescriptionText == nil then
		sClassFeatureDescriptionPattern = "<p>%s*<b>%s*" .. sClassFeatureName .. "%s*</b></p>%s*(.-)<p>Published in";
		sClassFeatureSpecificDescriptionText = string.match(sDescriptionText, sClassFeatureDescriptionPattern);
	end	
	-- Then try reading to the end of the record if that didn't work
	if sClassFeatureSpecificDescriptionText == nil then
		sClassFeatureDescriptionPattern = "<p>%s*<b>%s*" .. sClassFeatureName .. "%s*</b></p>%s*(.+)</p>";
		sClassFeatureSpecificDescriptionText = string.match(sDescriptionText, sClassFeatureDescriptionPattern);
	end
	-- If that didn't work, try really reading to the end of the record
	if sClassFeatureSpecificDescriptionText == nil then
		sClassFeatureDescriptionPattern = "<p>%s*<b>%s*" .. sClassFeatureName .. "%s*</b></p>%s*(.+)";
		sClassFeatureSpecificDescriptionText = string.match(sDescriptionText, sClassFeatureDescriptionPattern);
	end

	return sClassFeatureSpecificDescriptionText, sClassFeatureDescriptionPattern;
end

function addRacePowers(rAdd, sRecord, sDescriptionText)
	local tCurrentPowers = DB.getChildren(rAdd.nodeChar, "powers");
	--first try through the newly added powers node
	local sRecordPowerNode = DB.findNode(DB.getPath(sRecord, "powers"));
	if sRecordPowerNode then
		local nodePowerChildren = DB.getChildren(sRecordPowerNode);
		for nodeName,nodeChild in pairs(nodePowerChildren) do
			local sRacialPowerName = DB.getText(DB.getPath(nodeChild, "name"));
			local isPowerInList = false;
			for _, powerNode in pairs(tCurrentPowers) do
				if DB.getText(powerNode, "name") == DB.getText(nodeChild, "name") then
					isPowerInList = true;
					break;
				end
			end
			if isPowerInList == false then
				local sRacialActionSpeed = DB.getText(DB.getPath(nodeChild, "action"));
				local sRacialSource = DB.getText(DB.getPath(nodeChild, "source"));
				local sRacialKeywords = DB.getText(DB.getPath(nodeChild, "keywords"));
				local sRacialRange = DB.getText(DB.getPath(nodeChild, "range"));
				local sRacialRecharge = DB.getText(DB.getPath(nodeChild, "recharge"));
				local sRacialFlavor = DB.getText(DB.getPath(nodeChild, "flavor"));
				if sRacialFlavor == nil then
					sRacialFlavor = "";
				end
				local sRacialFullDescription = sRacialFlavor .. "\n\n" .. DB.getText(DB.getPath(nodeChild, "shortdescription"));
				local rCreatedIDChildNode = DB.createChild(rAdd.nodeChar.getPath("powers"));
				DB.setValue(rCreatedIDChildNode, "action", "string", sRacialActionSpeed);
				DB.setValue(rCreatedIDChildNode, "name", "string", sRacialPowerName);
				DB.setValue(rCreatedIDChildNode, "source", "string", sRacialSource);
				DB.setValue(rCreatedIDChildNode, "keywords", "string", sRacialKeywords);
				DB.setValue(rCreatedIDChildNode, "range", "string", sRacialRange);
				DB.setValue(rCreatedIDChildNode, "recharge", "string", sRacialRecharge);
				DB.setValue(rCreatedIDChildNode, "shortdescription", "string", sRacialFullDescription);
				CharManager.parseDescription(rCreatedIDChildNode);
				ChatManager.SystemMessageResource("char_abilities_message_poweradd", sRacialPowerName, rAdd.sCharName);
			end
		end
	elseif sDescriptionText then --then try through the description text
		local referenceStaticNode = DB.findNode("reference.powers.");
		local powersNode = DB.getChild(referenceStaticNode, "powers");
		local sPowersPattern = '<link class="powerdesc" recordname="reference.powers.(%w+)@([%w%s]+)">';
		local sPowersLink = string.gmatch(sDescriptionText, sPowersPattern);
		for w,v in sPowersLink do
			local sPowersPattern = "reference.powers." .. w .. "@" .. v;
			local sRacialPowerName = DB.getText(DB.getPath(sPowersPattern, "name"));
			local isPowerInList = false;
			for _, powerNode in pairs(tCurrentPowers) do
				if DB.getText(powerNode, "name") == sRacialPowerName then
					isPowerInList = true;
					break;
				end
			end
			if isPowerInList == false then
				local sRacialActionSpeed = DB.getText(DB.getPath(sPowersPattern, "action"));
				local sRacialSource = DB.getText(DB.getPath(sPowersPattern, "source"));
				local sRacialKeywords = DB.getText(DB.getPath(sPowersPattern, "keywords"));
				local sRacialRange = DB.getText(DB.getPath(sPowersPattern, "range"));
				local sRacialRecharge = DB.getText(DB.getPath(sPowersPattern, "recharge"));
				local sRacialFullDescription = DB.getText(DB.getPath(sPowersPattern, "flavor")) .. "\n\n" .. DB.getText(DB.getPath(sPowersPattern, "description"))
				local rCreatedIDChildNode = DB.createChild(rAdd.nodeChar.getPath("powers"));
				DB.setValue(rCreatedIDChildNode, "action", "string", sRacialActionSpeed);
				DB.setValue(rCreatedIDChildNode, "name", "string", sRacialPowerName);
				DB.setValue(rCreatedIDChildNode, "source", "string", sRacialSource);
				DB.setValue(rCreatedIDChildNode, "keywords", "string", sRacialKeywords);
				DB.setValue(rCreatedIDChildNode, "range", "string", sRacialRange);
				DB.setValue(rCreatedIDChildNode, "recharge", "string", sRacialRecharge);
				DB.setValue(rCreatedIDChildNode, "shortdescription", "string", sRacialFullDescription);
				CharManager.parseDescription(rCreatedIDChildNode);
				ChatManager.SystemMessageResource("char_abilities_message_poweradd", sRacialPowerName, rAdd.sCharName);
			end
		end
	end
end

function addClassSkill(rAdd, sRecord, sDescriptionText)
	--Reset class trained skills before adding new ones
	for __,y in pairs(DB.getChildren(rAdd.nodeChar, "skilllist")) do
		DB.setValue(y, "trained", "number", "0");
	end

	local sFirstSkillSentence = '';
	local tFirstSkillValues = {};
	local sSkillValue = '';
	local sNumberOfTrainedSkills = '0';
	local rSkillsNode = DB.findNode(DB.getPath(sRecord, "skillbonuses"));
	if rSkillsNode then
		sSkillValue = DB.getText(rSkillsNode);
	elseif DB.findNode(DB.getPath(sRecord, "traits")) then
		local rRecordTraitsNode = DB.findNode(DB.getPath(sRecord, "traits"));
		local rSkillTraitsNode = DB.getChild(rRecordTraitsNode, "skillbonuses");
		if rSkillTraitsNode then
			local rSkillTextNode = DB.getChild(rSkillTraitsNode, "text");
			sSkillValue = DB.getText(rSkillTextNode);
		end
	elseif sDescriptionText then
		local sSkillBonusesDescriptionTextLine = string.match(sDescriptionText, "<p>%s*<b>%s*Trained Skills%s*</b>%s*:%s*(.-)</p>");
		sFirstSkillSentence = string.match(sSkillBonusesDescriptionTextLine, ".-%.");
		if string.find(sFirstSkillSentence:upper(), "FROM") then
			sFirstSkillSentence = nil;
		end
		if sFirstSkillSentence then
			sNumberOfTrainedSkills = string.match(sSkillBonusesDescriptionTextLine, "choose (%d+) more trained");
		else
			sNumberOfTrainedSkills = string.match(sSkillBonusesDescriptionTextLine, "choose (%d+) trained");
		end
		nNumberOfTrainedSkills = tonumber(sNumberOfTrainedSkills);
		local sClassSkillsDescriptionTextLine = string.match(sDescriptionText, "<p>%s*<i>%s*Class Skills%s*</i>%s*:%s*(.-)</p>");
		sSkillValue = string.match(sClassSkillsDescriptionTextLine, "[%w%(%),%s]+");
	end
	--Add any automatically added skills as trained first, 
	-- if the first sentence doesn't have a choice and isn't the main sentence
	if sFirstSkillSentence and not string.find(sFirstSkillSentence, " or ") then
		local nFirstSkillCount = 1;
		for sFirstSkillValue in string.gmatch(sFirstSkillSentence, "[%w]+") do
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
	elseif sFirstSkillSentence then 
		--Display dialogue with limited set of skills before they can choose greater set of skills
		local fnLimitedSkills = string.gmatch(sFirstSkillSentence, "[%w]+");
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
		local tDialogData = {
			title = Interface.getString("char_build_title_selectclassskill"),
			msg = Interface.getString("char_build_message_selectclassskill"):format(nNumberOfTrainedSkills),
			options = tOptions,
			min = nNumberOfTrainedSkills,
			max = nNumberOfTrainedSkills,
			callback = CharClassManager.callbackResolveSkillTrainOnClassDrop,
			custom = rAdd,
		};
		DialogManager.requestSelectionDialog(tDialogData);
	end
end
function callbackResolveSkillTrainOnClassDrop(tSelection, rAdd, tSelectionLinks)
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
		local rSkillNodeChildren = DB.getChildren(rAdd.nodeChar, "skilllist");
		local doesSkillExist = false;
		for _,x in pairs(rSkillNodeChildren) do
			if string.lower(DB.getText(x, "label")) == string.lower(sSkill) then
				doesSkillExist = true;
				DB.setValue(x, "trained", "number", "1");
				sSkill = string.gsub(sSkill, "^%l", string.upper);
				ChatManager.SystemMessageResource("char_skills_message_skilltrained", sSkill, rAdd.sCharName);
			end
		end
		--TODO:This commented out logic is attempting to make skills modify without having to visit skill sheet first
		if rSkillNodeChildren == {} then 
			-- Interface.openWindow("charsheet_skills", DB.findNode(DB.getPath(rAdd.nodeChar)));

			-- local rCreatedIDChildNode = DB.createChild(rAdd.nodeChar.getPath("skilllist"));
			-- DB.setValue(rCreatedIDChildNode, "classskill", "number", 1);
			-- DB.setValue(rCreatedIDChildNode, "label", "string", (string.upper(string.sub(sSkill, 1, 1)) .. string.sub(sSkill, 2)));
			-- DB.setValue(rCreatedIDChildNode, "misc", "number", 0);
			-- DB.setValue(rCreatedIDChildNode, "shortcut", "windowreference");
			-- DB.setValue(rCreatedIDChildNode, "showonminisheet", "number", 1);
			-- DB.setValue(rCreatedIDChildNode, "statname", "string", 1);
			-- 	<stat type="number">0</stat>
			-- 	<statname type="string">intelligence</statname>
			-- 	<total type="number">0</total>
			-- 	<trained type="number">0</trained>
		end
	end
end

function helperResolveDefenseIncreaseOnRaceDrop(rAdd, sRecord, sDescriptionText)
	if not rAdd then
		return;
	end

	--Reset class defense bonuses before adding new ones
	for __,y in pairs(DB.getChildren(rAdd.nodeChar, "defenses")) do
		local nCurrentDefense = DB.getValue(y, "total", 0);
		local nCurrentDefenseClassBonus = DB.getValue(y, "class", "0");
		if nCurrentDefenseClassBonus and nCurrentDefenseClassBonus ~= "0" then
			DB.setValue(y, "total", "number", nCurrentDefense - nCurrentDefenseClassBonus);
			DB.setValue(y, "class", "number", "0");
		end
	end

	local sDefenseValue = '';
	local rDefenseNode = DB.findNode(DB.getPath(sRecord, "defenses"));
	-- if rDefenseNode then
	-- 		sDefenseValue = DB.getText(rDefenseNode);
	-- elseif DB.findNode(DB.getPath(sRecord, "traits")) then
	-- 	local rRecordTraitsNode = DB.findNode(DB.getPath(sRecord, "traits"));
	-- 	if rRecordTraitsNode then
	-- 		local rAbilityScoreTraitsNode = DB.getChild(rRecordTraitsNode, "abilityscores");
	-- 		if rAbilityScoreTraitsNode then
	-- 			local rAbilityScoreTextNode = DB.getChild(rAbilityScoreTraitsNode, "text");
	-- 			sDefenseValue = DB.getText(rAbilityScoreTextNode);
	-- 		end
	-- 	end
	-- elseif sDescriptionText then
	if sDescriptionText then
		local sDefensesDescriptionTextLine = string.match(sDescriptionText, "<p>%s*<b>%s*Bonus to Defense%s*:%s*</b>%s*(.-)</p>");
		sDefenseValue = string.match(sDefensesDescriptionTextLine, "[%w,%s%+]+");
	end
	local tDefenseBonuses = StringManager.split(sDefenseValue, ',', true);
	for _,x in pairs(tDefenseBonuses) do
		-- Direct increase defenses that don't have a choice
		if not string.find(x, " or ") then
			local rDefensesNode = DB.findNode(DB.getPath(rAdd.nodeChar, "defenses"));
			local sDefenseName = string.match(x, "%a+");
			local nDefenseBonusNumber = string.match(x, "%d+");
			if not nDefenseBonusNumber then
				nDefenseBonusNumber = "2";
			end
			local rDefenseNodeChild = DB.getChild(rDefensesNode, string.lower(sDefenseName));
			if rDefenseNodeChild then
				local nCurrentDefense = DB.getValue(rDefenseNodeChild, "total", 0);
				DB.setValue(rDefenseNodeChild, "class", "number", nDefenseBonusNumber);
				DB.setValue(rDefenseNodeChild, "total", "number", nCurrentDefense + nDefenseBonusNumber);
				ChatManager.SystemMessageResource("char_main_message_defensebonusadd", nDefenseBonusNumber, sDefenseName, rAdd.sCharName);
			end
		end
		
		-- Can add in logic to display a selection dialogue if there is a choice for defense increase
		-- But so far, that doesn't seem to exist in any classes
	end
end

-----------------------------------------------------------

--Use like this: string.gsub(str, "(%a)([%w_']*)", titleCase)
function titleCase( first, rest )
   return first:upper()..rest:lower()
end

function convertHTMLTable(sHTMLTable)
	sHTMLTable = string.gsub(sHTMLTable, "<table>", "\n");
	sHTMLTable = string.gsub(sHTMLTable, "</table>", "\n\n");
	sHTMLTable = string.gsub(sHTMLTable, "</p>", "\n");
	sHTMLTable = string.gsub(sHTMLTable, "<p>", "    ");
	sHTMLTable = string.gsub(sHTMLTable, "<p />", "\n");
	sHTMLTable = string.gsub(sHTMLTable, "<tr>", "\n");
	sHTMLTable = string.gsub(sHTMLTable, "</tr>", "");

	sHTMLTable = string.gsub(sHTMLTable, "<td><b>(.-)</b></td>", function(rowText)
		return string.format("%-15s", rowText);
	end)
	sHTMLTable = string.gsub(sHTMLTable, "<td>(.-)</td>", function(rowText)
		return string.format("%-20s", rowText);
	end)

	return sHTMLTable;
end

function removeLinkLists(sText)
	sText = string.gsub(sText, "</p>", "\n");
	sText = string.gsub(sText, "<p>", "    ");
	sText = string.gsub(sText, "<p />", "\n");

	sText = string.gsub(sText, "<linklist>", "");
	sText = string.gsub(sText, "</linklist>", "");
	sText = string.gsub(sText, "<link.->", "\n - ");
	sText = string.gsub(sText, "</link>", "\n");	
	return sText;
end

-----------------------------------------------------------

function helperResolveAncestryOnRaceDrop(rAdd)
	if not rAdd then
		return;
	end
	local tOptions = CharSpeciesManager.getAncestryOptions(rAdd.nodeSource, rAdd.bSource2024);
	if #tOptions == 0 then
		CharSpeciesManager.helperAddSpecies(rAdd);
		return;
	end

	if #tOptions == 1 then
		-- Automatically select only ancestry
		rAdd.sAncestryPath = tOptions[1].linkrecord;
		CharSpeciesManager.helperAddSpecies(rAdd);
		return;
	end

	local tDialogData = {
		title = Interface.getString("char_build_title_selectancestry"),
		msg = Interface.getString("char_build_message_selectancestry"),
		options = tOptions,
		callback = CharSpeciesManager.callbackResolveAncestryOnSpeciesDrop,
		custom = rAdd,
	};
	DialogManager.requestSelectionDialog(tDialogData);
end
function callbackResolveAncestryOnSpeciesDrop(tSelection, rAdd, tSelectionLinks)
	if not tSelectionLinks or (#tSelectionLinks ~= 1) then
		CharManager.outputUserMessage("char_error_addancestry");
		return;
	end
	rAdd.sAncestryPath = tSelectionLinks[1].linkrecord;
	CharSpeciesManager.helperAddSpecies(rAdd);
end
function helperAddSpecies(rAdd)
	CharSpeciesManager.helperAddSpeciesMain(rAdd);
	CharSpeciesManager.helperAddAncestry(rAdd);
end
function helperAddSpeciesMain(rAdd)
	if not rAdd then
		return;
	end

	-- Notification
	ChatManager.SystemMessageResource("char_abilities_message_raceadd", rAdd.sSourceName, rAdd.sCharName);

	-- Set name and link
	DB.setValue(rAdd.nodeChar, "race", "string", rAdd.sSourceName);
	DB.setValue(rAdd.nodeChar, "racelink", "windowreference", "reference_race", DB.getPath(rAdd.nodeSource));
	DB.setValue(rAdd.nodeChar, "racename", "string", sSourceName);
	DB.setValue(rAdd.nodeChar, "raceversion", "string", DB.getValue(rAdd.nodeSource, "version", ""));
	DB.setValue(rAdd.nodeChar, "subracelink", "windowreference", "", "");

	CharSpeciesManager.helperAddSpeciesMainStats(rAdd);

	-- Add species traits
	for _,v in ipairs(DB.getChildList(rAdd.nodeSource, "traits")) do
		CharSpeciesManager.addSpeciesTrait(rAdd.nodeChar, DB.getPath(v), { bWizard = rAdd.bWizard });
	end
end
function helperAddSpeciesMainStats(rAdd)
	if not rAdd or rAdd.bWizard then
		return;
	end

	if rAdd.bSource2024 then
		CharBuildDropManager.handleSizeField2024(rAdd);
		CharBuildDropManager.handleSpeedField2024(rAdd);
		CharBuildDropManager.handleSpeciesLanguage2024(rAdd);
	end
end
