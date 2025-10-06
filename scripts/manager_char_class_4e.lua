-- 
-- Please see the license.html file included with this distribution for 
-- attribution and copyright information.
--

function addClass(nodeChar, sRecord, tData)
	local rAdd = CharBuildDropManager.helperBuildAddStructure(nodeChar, "powerdesc", sRecord, tData);
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
	-- addRaceFeatures(rAdd, sRecord, sDescriptionText);

	-- --Add Race Powers
	-- addRacePowers(rAdd, sRecord, sDescriptionText);

	-- --Add Traits
	-- addRaceTraits(rAdd, sRecord, sDescriptionText);

	-- --Add skill bonuses
	addClassSkill(rAdd, sRecord, sDescriptionText);

	--Add ability score bonuses
	--CharRaceManager.helperResolveStatIncreaseOnRaceDrop(rAdd, sRecord, sDescriptionText);

	-- Notification
	--ChatManager.SystemMessageResource("char_abilities_message_raceadd", sRaceName, rAdd.sCharName);
	
end

function addClassNameAndLevel(rAdd, sRecord, sClassName)
	DB.setValue(rAdd.nodeChar, "class.base", "string", sClassName);	
	DB.setValue(rAdd.nodeChar, "level", "number", "1");
	DB.setValue(rAdd.nodeChar, "classlink", "windowreference", "powerdesc", DB.getPath(rAdd.nodeSource));
end

function addClassArmorProficiencies(rAdd, sRecord, sDescriptionText)
	local sArmorProficienciesValue = '';
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
		sArmorProficienciesValue = string.match(sArmorProficiencyDescriptionTextLine, "[%a,%s]+");
	end
	local tArmorProficiencies = StringManager.split(sArmorProficienciesValue, ',', true);
	local tCurrentArmorProficiencies = DB.getChildren(rAdd.nodeChar, "proficiencyarmor");
	for _,x in pairs(tArmorProficiencies) do
		local isArmorProficiencyInList = false;
		for armorProficiencyName, armorProficiencyNode in pairs(tCurrentArmorProficiencies) do
			if DB.getText(DB.getPath(armorProficiencyNode, "value")) == x then
				isArmorProficiencyInList = true;
				break;
			end
		end
		if isArmorProficiencyInList == false then
			local rCreatedIDChildNode = DB.createChild(rAdd.nodeChar.getPath("proficiencyarmor"));
			DB.setValue(rCreatedIDChildNode, "shortcut", "windowreference", "powerdesc", sPattern);
			DB.setValue(rCreatedIDChildNode, "value", "string", x);
			ChatManager.SystemMessageResource("char_abilities_message_armorproficiencyadd", x, rAdd.sCharName);
		end
	end
end

function addClassWeaponProficiencies(rAdd, sRecord, sDescriptionText)
	local sWeaponProficienciesValue = '';
	local sImplementsProficienciesValue = '';
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
		sWeaponProficienciesValue = string.match(sWeaponProficiencyDescriptionTextLine, "[%a,%s]+");
		local sImplementProficiencyDescriptionTextLine = string.match(sDescriptionText, "<p>%s*<b>%s*Implement%s*:%s*</b>(.-)</p>");
		if sImplementProficiencyDescriptionTextLine then
			sImplementsProficienciesValue = string.match(sImplementProficiencyDescriptionTextLine, "[%a,%s]+");
		end
	end
	local tWeaponProficiencies = StringManager.split(sWeaponProficienciesValue, ',', true);
	local tCurrentWeaponProficiencies = DB.getChildren(rAdd.nodeChar, "proficiencyweapon");
	for _,x in pairs(tWeaponProficiencies) do
		local isWeaponProficiencyInList = false;
		for weaponProficiencyName, weaponProficiencyNode in pairs(tCurrentWeaponProficiencies) do
			if DB.getText(DB.getPath(weaponProficiencyNode, "value")) == x then
				isWeaponProficiencyInList = true;
				break;
			end
		end
		if isWeaponProficiencyInList == false then
			local rCreatedIDChildNode = DB.createChild(rAdd.nodeChar.getPath("proficiencyweapon"));
			DB.setValue(rCreatedIDChildNode, "shortcut", "windowreference", "powerdesc", sPattern);
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
			DB.setValue(rCreatedIDChildNode, "shortcut", "windowreference", "powerdesc", sPattern);
			DB.setValue(rCreatedIDChildNode, "value", "string", y);
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

function addRaceFeatures(rAdd, sRecord, sDescriptionText)
	local tCurrentFeatures = DB.getChildren(rAdd.nodeChar, "specialabilitylist");
	---- first through the newly added feature tag
	local sRecordFeatureNode = DB.findNode(DB.getPath(sRecord, "features"));
	if sRecordFeatureNode then
		local nodeFeatureChildren = DB.getChildren(sRecordFeatureNode);
		for nodeName,nodeChild in pairs(nodeFeatureChildren) do
			local isFeatureInList = false;
			for _, featureNode in pairs(tCurrentFeatures) do
				if DB.getText(featureNode, "value") == DB.getText(nodeChild, "name") then
					isFeatureInList = true;
					break;
				end
			end
			if isFeatureInList == false then
				local rCreatedIDChildNode = DB.createChild(rAdd.nodeChar.getPath("specialabilitylist"));
				DB.setValue(rCreatedIDChildNode, "description", "string", DB.getText(DB.getPath(nodeChild, "description")));
	      		DB.createChild(rCreatedIDChildNode, "shortcut", "windowreference");
	      		DB.setValue(rCreatedIDChildNode, "value", "string", DB.getText(DB.getPath(nodeChild, "name")));
	      		local sRacialFeatureName = DB.getText(rCreatedIDChildNode, "value");
	      		ChatManager.SystemMessageResource("char_abilities_message_featureadd", sRacialFeatureName, rAdd.sCharName);
	      	end
		end
	elseif sDescriptionText then
	-- then through the description text
		local sPattern = '<link class="powerdesc" recordname="reference.features.(%w+)@([%w%s]+)">';
		local sFeaturesLink = string.gmatch(sDescriptionText, sPattern);
		for w,v in sFeaturesLink do
			local sPattern = "reference.features." .. w .. "@" .. v;
			local sRacialFeatureName = DB.getText(DB.getPath(sPattern, "name"));
			local isFeatureInList = false;
			for _, featureNode in pairs(tCurrentFeatures) do
				if DB.getText(DB.getPath(featureNode, "value")) == sRacialFeatureName then
					isFeatureInList = true;
					break;
				end
			end
			if isFeatureInList == false then
				local rCreatedIDChildNode = DB.createChild(rAdd.nodeChar.getPath("specialabilitylist"));
				DB.setValue(rCreatedIDChildNode, "shortcut", "windowreference", "powerdesc", sPattern);
				DB.setValue(rCreatedIDChildNode, "value", "string", sRacialFeatureName);
				ChatManager.SystemMessageResource("char_abilities_message_featureadd", sRacialFeatureName, rAdd.sCharName);
			end
		end
	end
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

function addRaceTraits(rAdd, sRecord, sDescriptionText)
	-- Parsing Order for these: 
	--- 1) First checks race speed node, 
	--- 2) Then traits nodes, 
	--- 3) Then description text
	addRaceSpeed(rAdd, sRecord, sDescriptionText);
	addRaceSize(rAdd, sRecord, sDescriptionText);
	addRaceVision(rAdd, sRecord, sDescriptionText);
	addRaceLanguages(rAdd, sRecord, sDescriptionText);
end

function addRaceSpeed(rAdd, sRecord, sDescriptionText)
	local nSpeedValue = '';
	local sSpecialSpeed = '';
	local rSpeedNode = DB.findNode(DB.getPath(sRecord, "speed"));
	if rSpeedNode then
			sSpecialSpeed = string.match(DB.getText(rSpeedNode), "%.(.*)");
			nSpeedValue = string.match(DB.getText(rSpeedNode), "%d+");
	elseif DB.findNode(DB.getPath(sRecord, "traits")) then
		local rRecordTraitsNode = DB.findNode(DB.getPath(sRecord, "traits"));
		local rSpeedTraitsNode = DB.getChild(rRecordTraitsNode, "speed");
		if rSpeedTraitsNode then
			local sSpeedText = DB.getChild(rSpeedTraitsNode, "text");
			sSpecialSpeed = string.match(DB.getText(sSpeedText), "%.(.*)");
			nSpeedValue = string.match(DB.getText(sSpeedText), "%d+");
		end
	elseif sDescriptionText then
		local sSpeedDescriptionTextLine = string.match(sDescriptionText, "<p>%s*<b>%s*Speed%s*</b>%s*:%s*(.-)</p>");
		nSpeedValue = string.match(sSpeedDescriptionTextLine, "%d+");
		sSpecialSpeed = string.match(sSpeedDescriptionTextLine, "%.(.*)");
	end
	local rCharacterSpeedNode = DB.findNode(rAdd.nodeChar.getPath("speed"));
	if rCharacterSpeedNode and nSpeedValue then
		DB.setValue(rCharacterSpeedNode, "base", "number", nSpeedValue);
		ChatManager.SystemMessageResource("char_combat_message_speedadd", nSpeedValue, rAdd.sCharName);
	end
	if rCharacterSpeedNode and sSpecialSpeed then
		DB.setValue(rCharacterSpeedNode, "special", "string", sSpecialSpeed);
		ChatManager.SystemMessageResource("char_main_message_specialspeedadd", sSpecialSpeed, rAdd.sCharName);
	end
end

function addRaceSize(rAdd, sRecord, sDescriptionText)
	local sSizeValue = '';
	local rSizeNode = DB.findNode(DB.getPath(sRecord, "size"));
	if rSizeNode then
			sSizeValue = DB.getText(rSizeNode);
	elseif DB.findNode(DB.getPath(sRecord, "traits")) then
		local rRecordTraitsNode = DB.findNode(DB.getPath(sRecord, "traits"));
		if rRecordTraitsNode then
			local rSizeTraitsNode = DB.getChild(rRecordTraitsNode, "size");
			if rSizeTraitsNode then
				local rSizeTextNode = DB.getChild(rSizeTraitsNode, "text");
				sSizeValue = DB.getText(rSizeTextNode);
			end
		end
	elseif sDescriptionText then
		local sSizeDescriptionTextLine = string.match(sDescriptionText, "<p>%s*<b>%s*Size%s*</b>%s*:%s*(.-)</p>");
		sSizeValue = string.match(sSizeDescriptionTextLine, "%a+");
	end
	if sSizeValue then
		DB.setValue(rAdd.nodeChar, "size", "string", sSizeValue);
		ChatManager.SystemMessageResource("char_notes_message_sizeadd", sSizeValue, rAdd.sCharName);
	end
end

function addRaceVision(rAdd, sRecord, sDescriptionText)
	local sVisionValue = '';
	local rVisionNode = DB.findNode(DB.getPath(sRecord, "vision"));
	if rVisionNode then
			sVisionValue = DB.getText(rVisionNode);
	elseif DB.findNode(DB.getPath(sRecord, "traits")) then
		local rRecordTraitsNode = DB.findNode(DB.getPath(sRecord, "traits"));
		if rRecordTraitsNode then
			local rVisionTraitsNode = DB.getChild(rRecordTraitsNode, "vision");
			if rVisionTraitsNode then
				local rVisionTextNode = DB.getChild(rVisionTraitsNode, "text");
				sVisionValue = DB.getText(rVisionTextNode);
			end
		end
	elseif sDescriptionText then
		local sVisionDescriptionTextLine = string.match(sDescriptionText, "<p>%s*<b>%s*Vision%s*</b>%s*:%s*(.-)</p>");
		sVisionValue = string.match(sVisionDescriptionTextLine, "[%a-]+");
	end
	if sVisionValue then
		DB.setValue(rAdd.nodeChar, "senses", "string", sVisionValue);
		ChatManager.SystemMessageResource("char_main_message_visionadd", sVisionValue, rAdd.sCharName);
	end
end

function addRaceLanguages(rAdd, sRecord, sDescriptionText)
	local sLanguagesValue = '';
	local rLanguagesNode = DB.findNode(DB.getPath(sRecord, "languages"));
	if rLanguagesNode then
			sLanguagesValue = DB.getText(rLanguagesNode);
	elseif DB.findNode(DB.getPath(sRecord, "traits")) then
		local rRecordTraitsNode = DB.findNode(DB.getPath(sRecord, "traits"));
		if rRecordTraitsNode then
			local rLanguagesTraitsNode = DB.getChild(rRecordTraitsNode, "languages");
			if rLanguagesTraitsNode then
				local rLanguageTextNode = DB.getChild(rLanguagesTraitsNode, "text");
				sLanguagesValue = DB.getText(rLanguageTextNode);
			end
		end
	elseif sDescriptionText then
		local sLanguagesDescriptionTextLine = string.match(sDescriptionText, "<p>%s*<b>%s*Languages%s*</b>%s*:%s*(.-)</p>");
		sLanguagesValue = string.match(sLanguagesDescriptionTextLine, "[%a,%s]+");
	end
	local tLanguages = StringManager.split(sLanguagesValue, ',', true);
	local tCurrentLanguages = DB.getChildren(rAdd.nodeChar, "languagelist");
	for _,x in pairs(tLanguages) do
		local isLanguageInList = false;
		for languageName, languageNode in pairs(tCurrentLanguages) do
			if DB.getText(DB.getPath(languageNode, "name")) == x then
				isLanguageInList = true;
				break;
			end
		end
		if isLanguageInList == false then
			local rCreatedIDChildNode = DB.createChild(rAdd.nodeChar.getPath("languagelist"));
			DB.setValue(rCreatedIDChildNode, "name", "string", x);
			ChatManager.SystemMessageResource("char_notes_message_languageadd", x, rAdd.sCharName);
		end
	end
end

function addClassSkill(rAdd, sRecord, sDescriptionText)
	--Reset class trained skills before adding new ones
	for __,y in pairs(DB.getChildren(rAdd.nodeChar, "skilllist")) do
		DB.setValue(y, "trained", "number", "0");
	end

	local sFirstSkillValue = '';
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
		sFirstSkillValue = string.match(sSkillBonusesDescriptionTextLine, "[%w]+");
		sNumberOfTrainedSkills = string.match(sSkillBonusesDescriptionTextLine, "choose (%d+) more trained");
		nNumberOfTrainedSkills = tonumber(sNumberOfTrainedSkills);
		Debug.console("sSkillBonusesDescriptionTextLine", sSkillBonusesDescriptionTextLine);
		Debug.console("sFirstSkillValue", sFirstSkillValue);
		Debug.console("nNumberOfTrainedSkills", nNumberOfTrainedSkills);
		local sClassSkillsDescriptionTextLine = string.match(sDescriptionText, "<p>%s*<i>%s*Class Skills%s*</i>%s*:%s*(.-)</p>");
		sSkillValue = string.match(sClassSkillsDescriptionTextLine, "[%w%(%),%s]+");
		Debug.console("sSkillValue", sSkillValue);
	end
	--Add any automatically added skills as trained first
	if sFirstSkillValue then
		local rCreatedIDChildren = DB.getChildren(rAdd.nodeChar, "skilllist");
		for __,y in pairs(rCreatedIDChildren) do
			if DB.getText(y, "label") == sFirstSkillValue then
				DB.setValue(y, "trained", "number", "1");
				ChatManager.SystemMessageResource("char_skills_message_skilltrained", sFirstSkillValue, rAdd.sCharName);
			end
		end
	end

	if nNumberOfTrainedSkills then
		-- Display a selection dialogue for the choice of trained skills
		local tOptions = StringManager.splitByPattern(sSkillValue, ",", true);
		--Remove initial trained skill from the list so they don't train it twice
		if sFirstSkillValue then
			for key,x in pairs(tOptions) do
				local startIndex, endIndex = string.find(x, sFirstSkillValue);
				if startIndex then
					table.remove(tOptions, key);
				end
			end
		end
		local tDialogData = {
			title = Interface.getString("char_build_title_selectclassskill"),
			msg = Interface.getString("char_build_message_selectclassskill"),
			options = tOptions,
			max = nNumberOfTrainedSkills,
			callback = CharClassManager.callbackResolveSkillTrainOnClassDrop,
			custom = rAdd,
		};
		DialogManager.requestSelectionDialog(tDialogData);
	end
	-- if sSkillValue then
	-- 	local tSkillList = StringManager.split(sSkillValue, ',', true);
	-- 	for _,x in pairs(tSkillList) do
	-- 		local skillBonus = string.match(x, '%d');
	-- 		local skillName = string.match(x, '%a+');
	-- 		local rCreatedIDChildren = DB.getChildren(rAdd.nodeChar, "skilllist");
	-- 		for __,y in pairs(rCreatedIDChildren) do
	-- 			if DB.getText(y, "label") == skillName then
	-- 				DB.setValue(y, "race", "number", skillBonus);
	-- 			end
	-- 		end
	-- 		ChatManager.SystemMessageResource("char_skills_message_skillbonusadd", skillBonus, skillName, rAdd.sCharName);
	-- 	end
	-- end
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
		Debug.console("sSkill",sSkill);
		local rSkillNodeChildren = DB.getChildren(rAdd.nodeChar, "skilllist");
		for _,x in pairs(rSkillNodeChildren) do
			if string.lower(DB.getText(x, "label")) == string.lower(sSkill) then
				DB.setValue(x, "trained", "number", "1");
				ChatManager.SystemMessageResource("char_skills_message_skilltrained", sSkill, rAdd.sCharName);
			end
		end
	end
end

function helperResolveStatIncreaseOnRaceDrop(rAdd, sRecord, sDescriptionText)
	if not rAdd then
		return;
	end

	--Reset racial ability score bonuses before adding new ones
	for __,y in pairs(DB.getChildren(rAdd.nodeChar, "abilities")) do
		local nCurrentAbilityScore = DB.getValue(y, "score", 0);
		local nCurrentAbilityRaceBonus = DB.getValue(y, "race", "0");
		if nCurrentAbilityRaceBonus and nCurrentAbilityRaceBonus ~= "0" then
			DB.setValue(y, "score", "number", nCurrentAbilityScore - nCurrentAbilityRaceBonus);
			DB.setValue(y, "race", "number", "0");
		end
	end

	local sAbilityScoresValue = '';
	local rAbilityScoresNode = DB.findNode(DB.getPath(sRecord, "abilityscores"));
	if rAbilityScoresNode then
			sAbilityScoresValue = DB.getText(rAbilityScoresNode);
	elseif DB.findNode(DB.getPath(sRecord, "traits")) then
		local rRecordTraitsNode = DB.findNode(DB.getPath(sRecord, "traits"));
		if rRecordTraitsNode then
			local rAbilityScoreTraitsNode = DB.getChild(rRecordTraitsNode, "abilityscores");
			if rAbilityScoreTraitsNode then
				local rAbilityScoreTextNode = DB.getChild(rAbilityScoreTraitsNode, "text");
				sAbilityScoresValue = DB.getText(rAbilityScoreTextNode);
			end
		end
	elseif sDescriptionText then
		local sAbilityScoresDescriptionTextLine = string.match(sDescriptionText, "<p>%s*<b>%s*Ability scores%s*</b>%s*:%s*(.-)</p>");
		Debug.console("sAbilityScoresDescriptionTextLine:",sAbilityScoresDescriptionTextLine);
		sAbilityScoresValue = string.match(sAbilityScoresDescriptionTextLine, "[%w,%s%+]+");
	end
	local tAbilityScoreBonuses = StringManager.split(sAbilityScoresValue, ',', true);
	for _,x in pairs(tAbilityScoreBonuses) do
		-- Direct increase ability scores that don't have a choice
		if not string.find(x, "or") then
			local rAbilitiesNode = DB.findNode(DB.getPath(rAdd.nodeChar, "abilities"));
			local sAbilityScoreName = string.match(x, "%a+");
			local nAbiltyScoreBonusNumber = string.match(x, "%d+");
			if not nAbiltyScoreBonusNumber then
				nAbiltyScoreBonusNumber = "2";
			end
			local rAbilitiesNodeChild = DB.getChild(rAbilitiesNode, string.lower(sAbilityScoreName));
			if rAbilitiesNodeChild then
				local nCurrentAbilityScore = DB.getValue(rAbilitiesNodeChild, "score", 0);
				DB.setValue(rAbilitiesNodeChild, "race", "number", nAbiltyScoreBonusNumber);
				DB.setValue(rAbilitiesNodeChild, "score", "number", nCurrentAbilityScore + nAbiltyScoreBonusNumber);
				ChatManager.SystemMessageResource("char_main_message_statbonusadd", nAbiltyScoreBonusNumber, sAbilityScoreName, rAdd.sCharName);
			end
		end
		
		-- Display a selection dialogue if there is a choice for ability score increase
		if string.match(x, "or") then
			local tOptions = StringManager.splitByPattern(x, "or", true);
			local tDialogData = {
				title = Interface.getString("char_build_title_selectraceabilitybonus"),
				msg = Interface.getString("char_build_message_selectraceabilitybonus"),
				options = tOptions,
				callback = CharRaceManager.callbackResolveStatIncreaseOnRaceDrop,
				custom = rAdd,
			};
			DialogManager.requestSelectionDialog(tDialogData);
		end
	end
end
function callbackResolveStatIncreaseOnRaceDrop(tSelection, rAdd, tSelectionLinks)
	if not tSelectionLinks or (#tSelectionLinks ~= 1) then
		CharManager.outputUserMessage("char_error_addrace");
		return;
	end
	if not tSelection then
		CharManager.outputUserMessage("char_error_addrace");
		return;
	end
	local rAbilitiesNode = DB.findNode(DB.getPath(rAdd.nodeChar, "abilities"));
	local sAbilityScore = string.lower(string.match(tSelection[1], "%a+"));
	local nSelectionBonus = string.match(tSelection[1], "%d+");
	if not nSelectionBonus then
		nSelectionBonus = "2";
	end
	local rAbilitiesNodeChildren = DB.getChildren(rAbilitiesNode);
	for _,x in pairs(rAbilitiesNodeChildren) do
		if DB.getName(x) == sAbilityScore then
			local nCurrentAbilityScore = DB.getValue(x, "score", 0);
			DB.setValue(x, "race", "number", nSelectionBonus);
			DB.setValue(x, "score", "number", nCurrentAbilityScore + nSelectionBonus);
			ChatManager.SystemMessageResource("char_main_message_statbonusadd", nSelectionBonus, sAbilityScore, rAdd.sCharName);
		end
	end
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

