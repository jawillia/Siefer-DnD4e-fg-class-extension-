-- 
-- Please see the license.html file included with this distribution for 
-- attribution and copyright information.
--

function addClassSpecificFeatures(sClassName, rAdd, sClassFeatureName, sClassFeatureFilteredDescription, sClassFeatureOriginalDescription, nLevel, sFullDescriptionText)
	switch(sClassName:upper(), 
	{
		--PHB1
		["CLERIC (TEMPLAR)"] = function() return addClericTemplarFeatures(sClassName, rAdd, sClassFeatureName, sClassFeatureFilteredDescription, sClassFeatureOriginalDescription) end,
		["FIGHTER (WEAPONMASTER)"] = function() return addFighterWeaponmasterFeatures(sClassName, rAdd, sClassFeatureName, sClassFeatureFilteredDescription, sClassFeatureOriginalDescription) end,
		["PALADIN"] = function() return addPaladinFeatures(sClassName, rAdd, sClassFeatureName, sClassFeatureFilteredDescription, sClassFeatureOriginalDescription) end,
		["RANGER"] = function() return addRangerFeatures(sClassName, rAdd, sClassFeatureName, sClassFeatureFilteredDescription, sClassFeatureOriginalDescription) end,
		["ROGUE (SCOUNDREL)"] = function() return addRogueScoundrelFeatures(sClassName, rAdd, sClassFeatureName, sClassFeatureFilteredDescription, sClassFeatureOriginalDescription) end,
		["WARLOCK"] = function() return addWarlockFeatures(sClassName, rAdd, sClassFeatureName, sClassFeatureFilteredDescription, sClassFeatureOriginalDescription) end,
		["WARLORD (MARSHAL)"] = function() return addWarlordMarshalFeatures(sClassName, rAdd, sClassFeatureName, sClassFeatureFilteredDescription, sClassFeatureOriginalDescription) end,
		["WIZARD (ARCANIST)"] = function() return addWizardArcanistFeatures(sClassName, rAdd, sClassFeatureName, sClassFeatureFilteredDescription, sClassFeatureOriginalDescription) end,
		--PHB2
		["AVENGER"] = function() return addAvengerFeatures(sClassName, rAdd, sClassFeatureName, sClassFeatureFilteredDescription, sClassFeatureOriginalDescription) end,
		["BARBARIAN"] = function() return addBarbarianFeatures(sClassName, rAdd, sClassFeatureName, sClassFeatureFilteredDescription, sClassFeatureOriginalDescription) end,
		["BARD"] = function() return addBardFeatures(sClassName, rAdd, sClassFeatureName, sClassFeatureFilteredDescription, sClassFeatureOriginalDescription) end,
		["DRUID"] = function() return addDruidFeatures(sClassName, rAdd, sClassFeatureName, sClassFeatureFilteredDescription, sClassFeatureOriginalDescription) end,
		["INVOKER"] = function() return addInvokerFeatures(sClassName, rAdd, sClassFeatureName, sClassFeatureFilteredDescription, sClassFeatureOriginalDescription) end,
		["SHAMAN"] = function() return addShamanFeatures(sClassName, rAdd, sClassFeatureName, sClassFeatureFilteredDescription, sClassFeatureOriginalDescription) end,
		["SORCERER"] = function() return addSorcererFeatures(sClassName, rAdd, sClassFeatureName, sClassFeatureFilteredDescription, sClassFeatureOriginalDescription) end,
		["WARDEN"] = function() return addWardenFeatures(sClassName, rAdd, sClassFeatureName, sClassFeatureFilteredDescription, sClassFeatureOriginalDescription) end,
		--PHB3
		["ARDENT"] = function() return addArdentFeatures(sClassName, rAdd, sClassFeatureName, sClassFeatureFilteredDescription, sClassFeatureOriginalDescription) end,
		["BATTLEMIND"] = function() return addBattlemindFeatures(sClassName, rAdd, sClassFeatureName, sClassFeatureFilteredDescription, sClassFeatureOriginalDescription) end,
		["MONK"] = function() return addMonkFeatures(sClassName, rAdd, sClassFeatureName, sClassFeatureFilteredDescription, sClassFeatureOriginalDescription) end,	
		["PSION"] = function() return addPsionFeatures(sClassName, rAdd, sClassFeatureName, sClassFeatureFilteredDescription, sClassFeatureOriginalDescription) end,
		["RUNEPRIEST"] = function() return addRunepriestFeatures(sClassName, rAdd, sClassFeatureName, sClassFeatureFilteredDescription, sClassFeatureOriginalDescription) end,
		["SEEKER"] = function() return addSeekerFeatures(sClassName, rAdd, sClassFeatureName, sClassFeatureFilteredDescription, sClassFeatureOriginalDescription) end,		
		--Dragon Magazine
		["ASSASSIN"] = function() return addAssassinFeatures(sClassName, rAdd, sClassFeatureName, sClassFeatureFilteredDescription, sClassFeatureOriginalDescription) end,
		--EPG
		["ARTIFICER"] = function() return addArtificerFeatures(sClassName, rAdd, sClassFeatureName, sClassFeatureFilteredDescription, sClassFeatureOriginalDescription) end,		
		--FPG
		["SWORDMAGE"] = function() return addSwordmageFeatures(sClassName, rAdd, sClassFeatureName, sClassFeatureFilteredDescription, sClassFeatureOriginalDescription) end,
		--HoFL
		--NOTE:Tested up to level 30
		["CLERIC (WARPRIEST)"] = function() return addClericWarpriestFeatures(sClassName, rAdd, sClassFeatureName, sClassFeatureFilteredDescription, sClassFeatureOriginalDescription, nLevel, sFullDescriptionText) end,
		["FIGHTER (KNIGHT)"] = function() return addFighterKnightFeatures(sClassName, rAdd, sClassFeatureName, sClassFeatureFilteredDescription, sClassFeatureOriginalDescription) end,
		--TODO:STILL NEED TO TEST THIS ONE
		["WIZARD (MAGE)"] = function() return addWizardMageFeatures(sClassName, rAdd, sClassFeatureName, sClassFeatureFilteredDescription, sClassFeatureOriginalDescription) end,
		--HotFK
		--NOTE:Tested up to level 10
		["DRUID (SENTINEL)"] = function() return addDruidSentinelFeatures(sClassName, rAdd, sClassFeatureName, sClassFeatureFilteredDescription, sClassFeatureOriginalDescription) end,
		["PALADIN (CAVALIER)"] = function() return addPaladinCavalierFeatures(sClassName, rAdd, sClassFeatureName, sClassFeatureFilteredDescription, sClassFeatureOriginalDescription) end,
		["RANGER (HUNTER)"] = function() return addRangerHunterFeatures(sClassName, rAdd, sClassFeatureName, sClassFeatureFilteredDescription, sClassFeatureOriginalDescription) end,
		["RANGER (SCOUT)"] = function() return addRangerScoutFeatures(sClassName, rAdd, sClassFeatureName, sClassFeatureFilteredDescription, sClassFeatureOriginalDescription) end,
		["WARLOCK (HEXBLADE)"] = function() return addWarlockHexbladeFeatures(sClassName, rAdd, sClassFeatureName, sClassFeatureFilteredDescription, sClassFeatureOriginalDescription) end,		
		--HoS
		["ASSASSIN (EXECUTIONER)"] = function() return addAssassinExecutionerFeatures(sClassName, rAdd, sClassFeatureName, sClassFeatureFilteredDescription, sClassFeatureOriginalDescription) end,
		["PALADIN (BLACKGUARD)"] = function() return addPaladinBlackguardFeatures(sClassName, rAdd, sClassFeatureName, sClassFeatureFilteredDescription, sClassFeatureOriginalDescription, sFullDescriptionText) end,
		["WARLOCK (BINDER)"] = function() return addWarlockBinderFeatures(sClassName, rAdd, sClassFeatureName, sClassFeatureFilteredDescription, sClassFeatureOriginalDescription) end,
		--HoF
		["BARBARIAN (BERSERKER)"] = function() return addBarbarianBerserkerFeatures(sClassName, rAdd, sClassFeatureName, sClassFeatureFilteredDescription, sClassFeatureOriginalDescription) end,
		["DRUID (PROTECTOR)"] = function() return addDruidProtectorFeatures(sClassName, rAdd, sClassFeatureName, sClassFeatureFilteredDescription, sClassFeatureOriginalDescription) end,
		["WIZARD (WITCH)"] = function() return addWizardWitchFeatures(sClassName, rAdd, sClassFeatureName, sClassFeatureFilteredDescription, sClassFeatureOriginalDescription) end,
		--HoEC
		["SORCERER (ELEMENTALIST)"] = function() return addSorcererElementalistFeatures(sClassName, rAdd, sClassFeatureName, sClassFeatureFilteredDescription, sClassFeatureOriginalDescription) end,
		default = function() return addDefaultClassFeature(sClassName, rAdd, sClassFeatureName, sClassFeatureFilteredDescription, sClassFeatureOriginalDescription) end
	});
end

function isNotAddingFeaturePower(sClassFeatureName)
	return switch(sClassFeatureName:upper(),
	{
		--Fighter (Knight)
		["BATTLE GUARDIAN"] = function() return true end,
		--Paladin (Cavalier)
		["SUMMONED STEED"] = function() return true end,
		--Warlock (Hexblade)
		["PACT WEAPON"] = function() return true end,
		["PACT WEAPON RETRIBUTION"] = function() return true end,
		default = function() return false end
	});
end

--Basic Add Feature Method, no extra frills
function addBasicClassFeature(rAdd, sClassFeatureName, sClassFeatureDescription, sWindowLinkClass, sWindowLinkPath)
	local rCreatedIDChildNode = DB.createChild(rAdd.nodeChar.getPath("specialabilitylist"));
	if not sWindowLinkClass or not sWindowLinkPath then
		DB.setValue(rCreatedIDChildNode, "shortcut", "windowreference");
	else
		DB.setValue(rCreatedIDChildNode, "shortcut", "windowreference", sWindowLinkClass, sWindowLinkPath);
	end
	DB.setValue(rCreatedIDChildNode, "value", "string", sClassFeatureName);
	if sClassFeatureDescription then
		DB.setValue(rCreatedIDChildNode, "description", "string", sClassFeatureDescription);
	end
	ChatManager.SystemMessageResource("char_abilities_message_classfeatureadd", sClassFeatureName, rAdd.sCharName);
end

--Add feature with all the bells and whistles: associated powers, feats, pre-features, etc.
function addDefaultClassFeature(sClassName, rAdd, sClassFeatureName, sClassFeatureDescription, sClassFeatureOriginalDescription)
	addBasicClassFeature(rAdd, sClassFeatureName, sClassFeatureDescription);

	--For each feature, add all powers in it (if it doesn't have the words implying a choice, like "choose", "choice", or "following")
	if sClassFeatureOriginalDescription and isNotAddingFeaturePower(sClassFeatureName) == false then
		CharClassPowerManager.addPowersFromText(sClassFeatureOriginalDescription, rAdd, sClassFeatureName);
	end

	--For each feature, add the associated feat.
	if sClassFeatureOriginalDescription then
		CharClassFeatManager.addClassFeats(sClassFeatureOriginalDescription, rAdd, sClassFeatureName);
	end

	--Add sub-feature automatically, if it's something that was chosen by the class's pre-chosen feature (i.e. domain, pact, season, element, etc)
	if string.find(sClassFeatureOriginalDescription:lower(), "you gain a.- power associated with your") or 
		string.find(sClassFeatureOriginalDescription:lower(), "you gain a.- feature associated with your") then
			addPreChosenClassFeature(rAdd, sClassFeatureOriginalDescription, sClassFeatureName);
	end
end

---------------------------------------------
----Prefeature Methods
---------------------------------------------
function addClassSpecificPreFeatures(sClassName, rAdd, sDescriptionText, tClassFeatures, nLevel, sFullDescriptionText)
	switch(sClassName:upper(), 
	{
		["CLERIC (WARPRIEST)"] = function() return addClericWarpriestPreFeatures(sClassName, rAdd, sDescriptionText, tClassFeatures) end,
		["DRUID (SENTINEL)"] = function() return addDruidSentinelPreFeatures(sClassName, rAdd, sDescriptionText, tClassFeatures, nLevel, sFullDescriptionText) end,
		["WARLOCK (HEXBLADE)"] = function() return addWarlockHexbladePreFeatures(sClassName, rAdd, sDescriptionText, tClassFeatures) end,
		["WARLOCK (BINDER)"] = function() return addWarlockBinderPreFeatures(sClassName, rAdd, sDescriptionText, tClassFeatures) end,
		["DRUID (PROTECTOR)"] = function() return addDruidProtectorPreFeatures(sClassName, rAdd, sDescriptionText, tClassFeatures) end,
		["PALADIN (CAVALIER)"] = function() return addPaladinCavalierPreFeatures(sClassName, rAdd, sDescriptionText, tClassFeatures) end,
		["PALADIN (BLACKGUARD)"] = function() return addPaladinBlackguardPreFeatures(sClassName, rAdd, sDescriptionText, tClassFeatures, nLevel, sFullDescriptionText) end
	});
end

--Add sub-class feature that is given automatically based on the class's pre-feature chosen at level 1 (like domain, pact, etc)
function addPreChosenClassFeature(rAdd, sClassFeatureOriginalDescription, sClassFeatureName)
	if not rAdd then
		ChatManager.SystemMessageResource("char_error_addclassspower");
		return;
	end
	local sPattern = "you gain a.- associated with your([%w%s]+)";
	local sPrefeatureType = null;
	sPrefeatureType = string.match(sClassFeatureOriginalDescription:lower(), sPattern);
	if not sPrefeatureType then
		sPattern = "gains a.- associated with your([%w%s]+)";
		sPrefeatureType = string.match(sClassFeatureOriginalDescription:lower(), sPattern);
	end

	if sPrefeatureType then
		sPrefeatureType = StringManager.trim(sPrefeatureType);
		local tCurrentFeatures = DB.getChildren(rAdd.nodeChar, "specialabilitylist");
		local sChosenPrefeature = getChosenPrefeature(rAdd, sClassFeatureOriginalDescription, sPrefeatureType, sClassFeatureName);
		local sClassFeatureName, sClassFeatureLink = getPrefeatureBasedFeatureNameAndLinkFromOtherFeature(sChosenPrefeature, sClassFeatureOriginalDescription);
		if sClassFeatureName and sClassFeatureLink then
			local alreadyExists = false;
			for _, featureNode in pairs(tCurrentFeatures) do
				if DB.getText(DB.getPath(featureNode, "value")) == sClassFeatureName then
					alreadyExists = true;
				end
			end
			if not alreadyExists then
				local sClassFeatureDescription = DB.getText(DB.getPath(sClassFeatureLink, "description"));
				local rCreatedIDChildNode = DB.createChild(rAdd.nodeChar.getPath("specialabilitylist"));
				DB.setValue(rCreatedIDChildNode, "shortcut", "windowreference", "powerdesc", sClassFeatureLink);
				DB.setValue(rCreatedIDChildNode, "value", "string", sClassFeatureName);

				CharClassPowerManager.addAllPowersFromFeatureText(rAdd, sClassFeatureDescription, sClassFeatureOriginalDescription);
			end
		end
	end
end

--Gets the chosen class feature that is selected first and determines other selections for the class
--More than just a class sub-class, this is equivalent to Warpriest Domain, Essentials warlock pacts, etc.
--This method retrieves the specifically chosen pre-feature (examples: Earth Domain, Fey Pact, etc.)
function getChosenPrefeature(rAdd, sClassFeatureOriginalDescription, sPrefeatureType, sClassFeatureName)
	if not sClassFeatureName or not sClassFeatureOriginalDescription or not sPrefeatureType or not rAdd then
		return;
	end
	local tCurrentFeatures = DB.getChildren(rAdd.nodeChar, "specialabilitylist");
	local sChosenPrefeature = nil;
	--Look for the Spirit of Vice Feature for Blackguard Paladins
	for _, featureNode in pairs(tCurrentFeatures) do
		--Name equals "Spirit of Vice (X)"
		local sNamePattern = "Spirit of Vice%s%(([%a%s]+)%)";
		local foundString = string.match(DB.getText(DB.getPath(featureNode, "value")):lower(), sNamePattern:lower());
		if foundString then
			local sSelectedDomainEquivalentName = StringManager.trim(StringManager.titleCase(foundString));
			if sSelectedDomainEquivalentName then
				return StringManager.trim(sSelectedDomainEquivalentName);
			end
		end
	end
	--If the feature has a name like "Level X [Domain] ... Power" (like Like 3 Domain Encounter Attack Power) 
	--Add the sub-feature underneath it that matches the pre-feature chosen at level 1
	if string.find(sClassFeatureName:lower(), "level[%s%d]*"..sPrefeatureType:lower()..".* power") or 
		string.find(sClassFeatureName:lower(), "level[%s%d]*"..sPrefeatureType:lower()..".* feature") then
		local sNamePattern = "([%a%s]+)" .. sPrefeatureType;
		--Look for an existing feature you have mentioning the domain/pact/etc. (Ex:Fey Pact, Selune Domain, etc)
		for _, featureNode in pairs(tCurrentFeatures) do
			--Name equals "X Domain/Pact/etc."
			--Description is "You have selected the X domain/pact/etc."
			local foundString = string.match(DB.getText(DB.getPath(featureNode, "value")):lower(), sNamePattern:lower());
			if foundString then
				local sSelectedDomainEquivalentName = StringManager.trim(StringManager.titleCase(foundString));
				if sSelectedDomainEquivalentName then
					local sDescriptionPattern = "You have selected the " .. sSelectedDomainEquivalentName .. " " .. sPrefeatureType .. ".";
					if DB.getPath(featureNode, "description") and DB.getText(DB.getPath(featureNode, "description")) and string.find(DB.getText(DB.getPath(featureNode, "description")), sDescriptionPattern) then
						return StringManager.trim(sSelectedDomainEquivalentName);
					end
				end
			end
		end
	end

	if not sChosenPrefeature then
		sChosenPrefeature = StringManager.trim(sChosenPrefeature);
	end

	return sChosenPrefeature;
end

--Replace older level power
function replaceOlderPower(rAdd, sClassName, sAEDUType, nCharLevel)
	local nLevel = 1;
	local bReplaceOlderPower = true;
	if nCharLevel == 13 and sAEDUType == "Encounter" then
		nLevel = 1;
	elseif nCharLevel == 15 and sAEDUType == "Daily" then
		nLevel = 1;
	elseif nCharLevel == 17 and sAEDUType == "Encounter" then
		nLevel = 3;
	elseif nCharLevel == 19 and sAEDUType == "Daily" then
		nLevel = 5;
	elseif nCharLevel == 23 and sAEDUType == "Encounter" then
		nLevel = 7;
	elseif nCharLevel == 25 and sAEDUType == "Daily" then
		nLevel = 9;
	elseif nCharLevel == 27 and sAEDUType == "Encounter" then
		nLevel = 13;
	elseif nCharLevel == 29 and sAEDUType == "Daily" then
		nLevel = 15;
	else
		bReplaceOlderPower = false;
	end
	if bReplaceOlderPower then
		CharClassPowerManager.removePowerFromCharacter(rAdd, sClassName, sAEDUType, nLevel);
	end
end

function getPrefeatureBasedFeatureNameAndLinkFromOtherFeature(sChosenPrefeature, sClassFeatureOriginalDescription)
	if not sChosenPrefeature or not sClassFeatureOriginalDescription then
		return;
	end

	local sPattern = '<link class="powerdesc" recordname="reference.features.(%w+)@([%w%s]+)">';
	for sFeaturesLink,sFeaturesLinkModule in string.gmatch(sClassFeatureOriginalDescription, sPattern) do
		sPattern = "reference.features." .. sFeaturesLink .. "@" .. sFeaturesLinkModule;
		local sClassFeatureName = DB.getText(DB.getPath(sPattern, "name"));
		local sClassFeatureDescription = DB.getText(DB.getPath(sPattern, "description"));
		if matchWholeWord(sClassFeatureName:lower(), sChosenPrefeature:lower()) then
			return sClassFeatureName, sPattern;
		end
	end
end


---------------------------------------------
--- Generic Dialogue Selection Methods
---------------------------------------------

function displayAlternativeFeatureDialog(rAdd, tAlternativeClassFeatures, tStringCharBuildData)
	--tStringCharBuildData is divided as such
	local sDialogueTitle = "char_abilities_message_classfeaturedialoguetitle";
	local sDialogueMsg = "char_abilities_message_classfeaturedialoguemsg";
	if tStringCharBuildData then
		if tStringCharBuildData[1] then
			sDialogueTitle = tStringCharBuildData[1];
		end
		if tStringCharBuildData[2] then
			sDialogueMsg = tStringCharBuildData[2];
		end
	end
	local tOptions = {}
	local tTotalOptionNames = {};
	local nOptionsCount = 1;
	for sAltclassFeatureIndex,sAltclassFeatureName in pairs(tAlternativeClassFeatures) do
		local sOptionName = sAltclassFeatureName;
		--If the alternative class feature name is actually a link, take the name and link from there
		if string.match(sAltclassFeatureName, "reference.features.(%w+)@([%w%s]+)") then
			sFoundFeatureLink = string.match(sAltclassFeatureName, "reference.features.%w+@[%w%s]+");
			sOptionName = DB.getText(DB.getPath(sFoundFeatureLink, "name"));
		end
		tTotalOptionNames[nOptionsCount] = sOptionName;
		nOptionsCount = nOptionsCount + 1;
	end
	--Display links to the selections in the dialogue
	-- local sPattern = '<link class="powerdesc" recordname="reference.features.(%w+)@([%w%s]+)">';
	local tCurrentFeatures = DB.getChildren(rAdd.nodeChar, "specialabilitylist");
	for sAltclassFeatureIndex,sAltclassFeatureName in pairs(tAlternativeClassFeatures) do
		--If the alternative class feature name is actually a link, take the name and link from there
		if string.match(sAltclassFeatureName, "reference.features.(%w+)@([%w%s]+)") then
			local sUsedFeatureLink = string.match(sAltclassFeatureName, "reference.features.%w+@[%w%s]+");
			local sUsedFeatureName = DB.getText(DB.getPath(sUsedFeatureLink, "name"));
			local sUsedFeatureClass = string.match(sAltclassFeatureName, 'class=%"(.-)%"')
			table.insert(tOptions, { text = sUsedFeatureName, linkclass = sUsedFeatureClass, linkrecord = sUsedFeatureLink, });
		else --Otherwise take it from a current feature
			for x,y in pairs(tCurrentFeatures) do
				if DB.getText(DB.getPath(y, "value")) == sAltclassFeatureName then
					local sUsedFeatureName = DB.getText(DB.getPath(y, "value"));
					local sUsedFeatureLink = DB.getPath(y);
					table.insert(tOptions, { text = sUsedFeatureName, linkclass = "ref_ability", linkrecord = sUsedFeatureLink, });
				end
			end
		end
	end
	--Display a pop-up where we either choose Combat Superiority or Combat Agility
	local tDialogData = {
		title = Interface.getString(sDialogueTitle),
		msg = Interface.getString(sDialogueMsg),
		options = tOptions,
		min = 1,
		max = 1,
		callback = CharClassFeatureDescManager.callbackResolveAlternativeFeatureDialogSelection,
		custom = { rAdd=rAdd, tAlternativeClassFeatures=tAlternativeClassFeatures },
	};
	DialogManager.requestSelectionDialog(tDialogData);
end
function callbackResolveAlternativeFeatureDialogSelection(tSelection, tData)
	if not tSelection or not tSelection[1]  then
		ChatManager.SystemMessageResource("char_error_addclasssfeature");
		return;
	end
	local tCurrentFeatures = DB.getChildren(tData.rAdd.nodeChar, "specialabilitylist");
	if #tSelection == 1 then
		for sAltclassFeatureIndex, sAltclassFeatureName in pairs(tData.tAlternativeClassFeatures) do
			for _, featureNode in pairs(tCurrentFeatures) do
				if featureNode then
					if DB.getText(DB.getPath(featureNode, "value")) == sAltclassFeatureName and DB.getText(DB.getPath(featureNode, "value")) ~= tSelection[1] then
						DB.deleteNode(featureNode);
						tCurrentFeatures[_] = nil;
						ChatManager.SystemMessageResource("char_abilities_message_classfeatureadd", tSelection[1], tData.rAdd.sCharName);
					elseif DB.getText(DB.getPath(featureNode, "value")) == sAltclassFeatureName and DB.getText(DB.getPath(featureNode, "value")) == tSelection[1] then
						local sClassFeatureDescription = DB.getText(DB.getPath(featureNode, "description"));
						CharClassPowerManager.addPowersFromText(sClassFeatureDescription, tData.rAdd, tSelection[1]);
					end
				end
			end
			--After deleting any extraneous feature nodes, add this node if needed
			local sUsedFeatureLink = string.match(sAltclassFeatureName, "reference.features.%w+@[%w%s]+");
			if string.match(sAltclassFeatureName, "reference.features.(%w+)@([%w%s]+)") then
				if tSelection[1] == DB.getText(DB.getPath(sUsedFeatureLink, "name")) then
					local sPattern = '<link class="powerdesc" recordname="reference.features.(%w+)@([%w%s]+)">';
					local sFeaturesLink, sFeaturesLinkModule = string.match(sAltclassFeatureName, sPattern);
					local rCreatedIDChildNode = DB.createChild(tData.rAdd.nodeChar.getPath("specialabilitylist"));
					if sFeaturesLink and sFeaturesLinkModule then
						sPattern = "reference.features." .. sFeaturesLink .. "@" .. sFeaturesLinkModule;
						DB.setValue(rCreatedIDChildNode, "shortcut", "windowreference", "powerdesc", sPattern);
					end
					DB.setValue(rCreatedIDChildNode, "value", "string", DB.getText(DB.getPath(sPattern, "name")));

					local sClassFeatureDescription = DB.getValue(DB.getPath(sUsedFeatureLink, "description"));
					CharClassPowerManager.addPowersFromText(sClassFeatureDescription, tData.rAdd, tSelection[1]);
				end
			end
		end
	end
end

--nAddPowerMode: 
-- - 1=Add powers from parent feature description that match sub-feature description of powers (like warlock)
-- - 2=Add all powers in sub-feature text itself
-- - 3=Bring up selection dialogue with choice of powers from feature text
function displayClassFeatureSelectionsDialog(rAdd, sClassFeatureOriginalDescription, sClassFeatureName, nMaxSelections, nAddPowerMode, fnCallback)
	local tClassFeatureOptions = {};
	local tOptions = {};
	--Display information on the selections in chat
	local sPattern = '<link class="powerdesc" recordname="reference.features.(%w+)@([%w%s]+)">';
	local sFeaturesLink = string.gmatch(sClassFeatureOriginalDescription, sPattern);
	local nOptionsCount = 1;
	for w,v in sFeaturesLink do
		local sPattern = "reference.features." .. w .. "@" .. v;
		local sClassFeatureName = DB.getText(DB.getPath(sPattern, "name"));
		local sClassFeatureDescription = DB.getText(DB.getPath(sPattern, "description"));
		--Don't display the option if you already have that feature
		local tCurrentFeatures = DB.getChildren(rAdd.nodeChar, "specialabilitylist");
		local bAlreadyHave = false;
		for _,featureNode in pairs(tCurrentFeatures) do
			if DB.getText(DB.getPath(featureNode, "value")) == sClassFeatureName then
				bAlreadyHave = true;
				break;
			end
		end
		if bAlreadyHave == false then
			tClassFeatureOptions[sClassFeatureName] = DB.getPath(sPattern);
			table.insert(tOptions, { text = sClassFeatureName, linkclass = "powerdesc", linkrecord = DB.getPath(sPattern), });
			nOptionsCount = nOptionsCount + 1;
		end
	end
	--Display a pop-up where we choose from the class feature options
	if not nMaxSelections or nMaxSelections < 1 then
		nMaxSelections = 1;
	end
	local msg = string.format(Interface.getString("char_build_message_chooseclassfeatures"), nMaxSelections, sClassFeatureName);
	local tDialogData = {
		title = sClassFeatureName,
		msg = msg,
		options = tOptions,
		min = nMaxSelections,
		max = nMaxSelections,
		callback = CharClassFeatureDescManager.callbackResolveClassFeatureSelectionsDialogSelection,
		custom = { rAdd = rAdd, tClassFeatureOptions = tClassFeatureOptions, nAddPowerMode=1, sParentClassFeatureOriginalDescription=sClassFeatureOriginalDescription, fnCallback=fnCallback }, 
	};
	DialogManager.requestSelectionDialog(tDialogData);	
end
function callbackResolveClassFeatureSelectionsDialogSelection(tSelection, tData)
	if not tSelection or not tSelection[1] then
		ChatManager.SystemMessageResource("char_error_addclasssfeature");
		return;
	end
	local sSelectedClassFeatureSelectionsDBReference;
	local tCurrentFeatures = DB.getChildren(tData.rAdd.nodeChar, "specialabilitylist");
	for _,selectedSkill in ipairs(tSelection) do
		for _, featureNode in pairs(tCurrentFeatures) do
			if DB.getText(DB.getPath(featureNode, "value")) ~= selectedSkill then
				for x, y in pairs(tData.tClassFeatureOptions) do
					if DB.getText(DB.getPath(featureNode, "value")) == x then
						DB.deleteNode(featureNode);
						break;
					end
				end
			end
		end
		sSelectedClassFeatureSelectionsDBReference = tData.tClassFeatureOptions[selectedSkill];
		local rCreatedIDChildNode = DB.createChild(tData.rAdd.nodeChar.getPath("specialabilitylist"));
		DB.setValue(rCreatedIDChildNode, "shortcut", "windowreference", "powerdesc", sSelectedClassFeatureSelectionsDBReference);
		DB.setValue(rCreatedIDChildNode, "value", "string", selectedSkill);
		--DB.setValue(rCreatedIDChildNode, "description", "string", sClassFeatureOriginalDescription);
		ChatManager.SystemMessageResource("char_abilities_message_classfeatureadd", selectedSkill, tData.rAdd.sCharName);

		--Add feats from text
		local sClassFeatureDescription = DB.getText(DB.getPath(sSelectedClassFeatureSelectionsDBReference, "description"));
		if sClassFeatureDescription then
			CharClassFeatManager.addClassFeats(sClassFeatureDescription, tData.rAdd, selectedSkill);
		end

		if tData.nAddPowerMode and tData.nAddPowerMode > 0 then
			if tData.nAddPowerMode == 1 then
				local sClassFeatureName = DB.getText(DB.getPath(sSelectedClassFeatureSelectionsDBReference, "name"));
				local sClassSubFeatureDescription = DB.getText(DB.getPath(sSelectedClassFeatureSelectionsDBReference, "description"));
				local sParentClassFeatureOriginalDescription = tData.sParentClassFeatureOriginalDescription;
				if tData.rAdd and sClassSubFeatureDescription and sParentClassFeatureOriginalDescription then
					CharClassPowerManager.addAllPowersFromFeatureText(tData.rAdd, sClassSubFeatureDescription, sParentClassFeatureOriginalDescription)
				end
			end
		end

		if tData.fnCallback then
			tData.fnCallback();
		end
	end
end

-------------------------------------------
----- Cleric (Templar) Class Features ----
-------------------------------------------

function addClericTemplarFeatures(sClassName, rAdd, sClassFeatureName, sClassFeatureFilteredDescription, sClassFeatureOriginalDescription)
	local tCurrentFeatures = DB.getChildren(rAdd.nodeChar, "specialabilitylist");
	if sClassFeatureName == "Battle Cleric's Lore" then
		--Add the feature, but if you have also already added Healer's Lore, choose between them
		local sPattern = '<link class="powerdesc" recordname="reference.features.(%w+)@([%w%s]+)">';
		local sFeaturesLink, sFeaturesLinkModule = string.match(sClassFeatureOriginalDescription, sPattern);
		local rCreatedIDChildNode = DB.createChild(rAdd.nodeChar.getPath("specialabilitylist"));
		if sFeaturesLink and sFeaturesLinkModule then
			sPattern = "reference.features." .. sFeaturesLink .. "@" .. sFeaturesLinkModule;
			DB.setValue(rCreatedIDChildNode, "shortcut", "windowreference", "powerdesc", sPattern);
		else
			DB.setValue(rCreatedIDChildNode, "shortcut", "windowreference");
			DB.setValue(rCreatedIDChildNode, "description", "string", sClassFeatureFilteredDescription);
		end
		DB.setValue(rCreatedIDChildNode, "value", "string", sClassFeatureName);
		for _, featureNode in pairs(tCurrentFeatures) do
			if DB.getText(DB.getPath(featureNode, "value")) == "Healer's Lore" then
				displayClericTemplarHealerLoreDialog(rAdd, sPattern)
				break;
			end
		end
	elseif sClassFeatureName == "Healer's Lore" then
		--Add the feature, but if you have also already added Battle Cleric's Lore, choose between them
		local rCreatedIDChildNode = DB.createChild(rAdd.nodeChar.getPath("specialabilitylist"));
		DB.setValue(rCreatedIDChildNode, "shortcut", "windowreference");
		DB.setValue(rCreatedIDChildNode, "value", "string", sClassFeatureName);
		DB.setValue(rCreatedIDChildNode, "description", "string", sClassFeatureFilteredDescription);
		for _, featureNode in pairs(tCurrentFeatures) do
			if DB.getText(DB.getPath(featureNode, "value")) == "Battle Cleric's Lore" then
				displayClericTemplarHealerLoreDialog(rAdd)
				break;
			end
		end
	elseif sClassFeatureName == "Channel Divinity" then
		--Clear all existing channel divinity nodes, then add them
		for _, featureNode in pairs(tCurrentFeatures) do
			if (DB.getText(DB.getPath(featureNode, "value")) == "Channel Divinity:Divine Fortune")
				or (DB.getText(DB.getPath(featureNode, "value")) == "Channel Divinity:Favor of the Gods")
				or (DB.getText(DB.getPath(featureNode, "value")) == "Channel Divinity:Turn Undead")
				or (DB.getText(DB.getPath(featureNode, "value")) == "Channel Divinity:Healer's Mercy")
				or (DB.getText(DB.getPath(featureNode, "value")) == "Channel Divinity:Punish the Profane") then
				DB.deleteNode(featureNode);
			end
		end
		local rCreatedIDChildNode = DB.createChild(rAdd.nodeChar.getPath("specialabilitylist"));
		DB.setValue(rCreatedIDChildNode, "shortcut", "windowreference");
		DB.setValue(rCreatedIDChildNode, "value", "string", sClassFeatureName);
		DB.setValue(rCreatedIDChildNode, "description", "string", sClassFeatureFilteredDescription);
		displayClericTemplarChannelDivinityDialog(rAdd);
	else
		addDefaultClassFeature(sClassName, rAdd, sClassFeatureName, sClassFeatureFilteredDescription, sClassFeatureOriginalDescription);
	end
end
function displayClericTemplarHealerLoreDialog(rAdd, sbattleClericLoreReference)
	--Add links to the selection options themselves
	local tOptions = {};
	local tCurrentFeatures = DB.getChildren(rAdd.nodeChar, "specialabilitylist");
	for x,y in pairs(tCurrentFeatures) do
		local sFeatureName = DB.getText(DB.getPath(y, "value"));
		local sLinkClass = "ref_ability";
		local sNodePath = DB.getPath(y);
		if sFeatureName == "Battle Cleric's Lore" or sFeatureName == "Healer's Lore" then		
			if sbattleClericLoreReference and sFeatureName == "Battle Cleric's Lore" then
				sLinkClass = "powerdesc";
				sNodePath = sbattleClericLoreReference;
			end
			table.insert(tOptions, { text = sFeatureName, linkclass = sLinkClass, linkrecord = sNodePath, });
		end
	end
	if not tOptions or not tOptions[1] or not tOptions[2] then
		tOptions[1] = "Healer's Lore";
		tOptions[2] = "Battle Cleric's Lore";
	end

	local tDialogData = {
		title = Interface.getString("char_build_title_addhealerlore"),
		msg = Interface.getString("char_build_message_addhealerorbattlelore"),
		options = tOptions,
		min = 1,
		max = 1,
		callback = CharClassFeatureDescManager.callbackResolveClericHealerLoreDialogSelection,
		custom = rAdd,
	};
	DialogManager.requestSelectionDialog(tDialogData);
end
function callbackResolveClericHealerLoreDialogSelection(tSelection, rAdd, tSelectionLinks)
	if not tSelectionLinks then
		ChatManager.SystemMessageResource("char_error_addclasssfeature");
		return;
	end
	if not tSelection then
		ChatManager.SystemMessageResource("char_error_addclasssfeature");
		return;
	end
	local tCurrentFeatures = DB.getChildren(rAdd.nodeChar, "specialabilitylist");
	if #tSelection == 1 then
		if tSelection[1] == "Healer's Lore" then
			for _, featureNode in pairs(tCurrentFeatures) do
				if DB.getText(DB.getPath(featureNode, "value")) == "Battle Cleric's Lore" then
					DB.deleteNode(featureNode);
					ChatManager.SystemMessageResource("char_abilities_message_classfeatureadd", tSelection[1], rAdd.sCharName);
					break;
				end

			end
		elseif tSelection[1] == "Battle Cleric's Lore" then
				for _, featureNode in pairs(tCurrentFeatures) do
				if DB.getText(DB.getPath(featureNode, "value")) == "Healer's Lore" then
					DB.deleteNode(featureNode);
					ChatManager.SystemMessageResource("char_abilities_message_classfeatureadd", tSelection[1], rAdd.sCharName);
					break;
				end
			end
		end
	end
end
function displayClericTemplarChannelDivinityDialog(rAdd)
	--Add links to the selection options themselves for the first channel divinity choice first
	local tOptions = {};
	local tChannelDivinityOptions = {};
	tChannelDivinityOptions[1] = "Channel Divinity: Divine Fortune";
	tChannelDivinityOptions[2] = "Channel Divinity: Favor of the Gods";
	for x,y in pairs(tChannelDivinityOptions) do
		local tChannelDivinityAbilityNameParts =  StringManager.split(y, ':', true);
		if #tChannelDivinityAbilityNameParts > 1 then
			local sFeatureName = tChannelDivinityAbilityNameParts[2];
			local sDBReferenceFeatureName = sFeatureName:lower():gsub(" ", "");
			local sLinkClass = "powerdesc";
			local sNodePath = DB.getPath("reference.powers@4E PC Options", sDBReferenceFeatureName);
			if sFeatureName == "Divine Fortune" or sFeatureName == "Favor of the Gods" then
				-- local tMessageShortcuts = { { class=sLinkClass, recordname=sNodePath } };
				-- local tMessageData = {font = "systemfont", text = sFeatureName, shortcuts=tMessageShortcuts};
				table.insert(tOptions, { text = sFeatureName, linkclass = sLinkClass, linkrecord = sNodePath, });
			end
		end
	end

	--Display a pop-up where we either choose Divine Fortune or Favor of the Gods for Cleric Channel Divinity
	local tDialogData = {
		title = Interface.getString("char_build_title_addchanneldivinity"),
		msg = Interface.getString("char_build_message_addchanneldivinity"),
		options = tOptions,
		min = 1,
		max = 1,
		callback = CharClassFeatureDescManager.callbackResolveClericChannelDivinity,
		custom = rAdd,
	};
	DialogManager.requestSelectionDialog(tDialogData);

	--Display a pop-up where we either choose Turn Undead, Healer's Mercy, or Punish the Profane for Cleric Channel Divinity
	local tOptions = {};
	local tChannelDivinityOptions = {};
	tChannelDivinityOptions[1] = "Channel Divinity: Turn Undead";
	tChannelDivinityOptions[2] = "Channel Divinity: Healer's Mercy";
	tChannelDivinityOptions[3] = "Channel Divinity: Punish the Profane";
	for x,y in pairs(tChannelDivinityOptions) do
		local tChannelDivinityAbilityNameParts =  StringManager.split(y, ':', true);
		if #tChannelDivinityAbilityNameParts > 1 then
			local sFeatureName = tChannelDivinityAbilityNameParts[2];
			local sDBReferenceFeatureName = sFeatureName:lower():gsub(" ", "");
			local sLinkClass = "powerdesc";
			local sNodePath = DB.getPath("reference.powers@4E PC Options", sDBReferenceFeatureName);
			if sFeatureName == "Turn Undead" or sFeatureName == "Healer's Mercy" or sFeatureName == "Punish the Profane" then
				-- local tMessageShortcuts = { { class=sLinkClass, recordname=sNodePath } };
				-- local tMessageData = {font = "systemfont", text = sFeatureName, shortcuts=tMessageShortcuts};
				table.insert(tOptions, { text = sFeatureName, linkclass = sLinkClass, linkrecord = sNodePath, });
			end
		end
	end

	local tDialogData = {
		title = Interface.getString("char_build_title_addchanneldivinity"),
		msg = Interface.getString("char_build_message_addchanneldivinity"),
		options = tOptions,
		min = 1,
		max = 1,
		callback = CharClassFeatureDescManager.callbackResolveClericChannelDivinity,
		custom = rAdd,
	};
	DialogManager.requestSelectionDialog(tDialogData);
end
function callbackResolveClericChannelDivinity(tSelection, rAdd, tSelectionLinks)
	if not tSelectionLinks then
		ChatManager.SystemMessageResource("char_error_addclasssfeature");
		return;
	end
	if not tSelection then
		ChatManager.SystemMessageResource("char_error_addclasssfeature");
		return;
	end
	local tCurrentFeatures = DB.getChildren(rAdd.nodeChar, "specialabilitylist");
	if #tSelection == 1 then
		local sChannelDivinityTitleName = tSelection[1];
		local tChannelDivinityAbilityNameSplit =  StringManager.split(tSelection[1], ';', true);
		local sChannelDivinityAbilityName = '';
		if #tChannelDivinityAbilityNameSplit > 1 then
			sChannelDivinityAbilityName = tChannelDivinityAbilityNameSplit[2];
		end
		local rCreatedIDChildNode = DB.createChild(rAdd.nodeChar.getPath("specialabilitylist"));
		DB.setValue(rCreatedIDChildNode, "shortcut", "windowreference");
		DB.setValue(rCreatedIDChildNode, "value", "string", sChannelDivinityTitleName);
		DB.setValue(rCreatedIDChildNode, "description", "string", "You gain the " .. sChannelDivinityAbilityName .. " channel divinity power. You can only use one of them per encounter.");

		CharClassPowerManager.addFeatureNamePower(rAdd, sChannelDivinityTitleName);
	end
end

------------------------------------------------
----- Fighter (Weaponmaster) Class Features ----
------------------------------------------------
function addFighterWeaponmasterFeatures(sClassName, rAdd, sClassFeatureName, sClassFeatureFilteredDescription, sClassFeatureOriginalDescription)
	local tCurrentFeatures = DB.getChildren(rAdd.nodeChar, "specialabilitylist");
	local tAlternativeClassFeaturesOptions = {};
	tAlternativeClassFeaturesOptions[1] = "Combat Superiority";
	tAlternativeClassFeaturesOptions[2] = "Combat Agility";
	--String data for the dialogue windows. 1 is title, 2 is message.
	local tStringCharBuildData = {};
	tStringCharBuildData[1] = "char_build_title_addcombatsuperiority";
	tStringCharBuildData[2] = "char_build_message_addcombatsuperiorityoragility";
	if sClassFeatureName == "Combat Agility" then
		--Add the feature, but if you have also already added Combat Superiority, choose between them
		addBasicClassFeature(rAdd, sClassFeatureName, sClassFeatureFilteredDescription);
		for _, featureNode in pairs(tCurrentFeatures) do
			if DB.getText(DB.getPath(featureNode, "value")) == "Combat Superiority" then
				displayAlternativeFeatureDialog(rAdd, tAlternativeClassFeaturesOptions, tStringCharBuildData);
				break;
			end
		end
	elseif sClassFeatureName == "Combat Superiority" then
		--Add the feature, but if you have also already added Combat Agility, choose between them
		addBasicClassFeature(rAdd, sClassFeatureName, sClassFeatureFilteredDescription);
		for _, featureNode in pairs(tCurrentFeatures) do
			if DB.getText(DB.getPath(featureNode, "value")) == "Combat Agility" then
				displayAlternativeFeatureDialog(rAdd, tAlternativeClassFeaturesOptions, tStringCharBuildData);
				break;
			end
		end
	elseif sClassFeatureName == "Fighter Talents" then
		-- Add the feature and choose between all of the fighter talents
		addBasicClassFeature(rAdd, sClassFeatureName, sClassFeatureFilteredDescription);
		displayClassFeatureSelectionsDialog(rAdd, sClassFeatureOriginalDescription, sClassFeatureName);
	else
		addDefaultClassFeature(sClassName, rAdd, sClassFeatureName, sClassFeatureFilteredDescription, sClassFeatureOriginalDescription);
	end
end

------------------------------------------------
----- Paladin Class Features ----
------------------------------------------------
function addPaladinFeatures(sClassName, rAdd, sClassFeatureName, sClassFeatureFilteredDescription, sClassFeatureOriginalDescription)
	local tCurrentFeatures = DB.getChildren(rAdd.nodeChar, "specialabilitylist");
	local tAlternativeClassFeaturesOptions = {};
	tAlternativeClassFeaturesOptions[1] = "Lay On Hands";
	tAlternativeClassFeaturesOptions[2] = "Alternative Paladin Features";
	--String data for the dialogue windows. 1 is title, 2 is message.
	local tStringCharBuildData = {};
	tStringCharBuildData[1] = "char_build_title_addalternativepaladinfeatures";
	tStringCharBuildData[2] = "char_build_message_addalternativepaladinfeatures";
	if sClassFeatureName == "Channel Divinity" then
		--Add the feature and it's powers
		addBasicClassFeature(rAdd, sClassFeatureName, sClassFeatureFilteredDescription);
		for channelDivinityPowerName in string.gmatch(sClassFeatureOriginalDescription, "<i>(.-)</i>") do
			CharClassPowerManager.addPowersFromGlobalModuleFromPowerName(rAdd, StringManager.trim(channelDivinityPowerName));
		end
	elseif sClassFeatureName == "Lay On Hands" then
		--Add the feature, but if you have also already added Alternative Paladin Features, choose between them
		addBasicClassFeature(rAdd, sClassFeatureName, sClassFeatureFilteredDescription);
		for _, featureNode in pairs(tCurrentFeatures) do
			if DB.getText(DB.getPath(featureNode, "value")) == "Alternative Paladin Features" then
				local sPattern = '<link class="powerdesc" recordname="reference.features.%w+@[%w%s]+">';
				local sFeaturesLink = string.match(sClassFeatureOriginalDescription, sPattern);
				if sFeaturesLink then
					tAlternativeClassFeaturesOptions[2] = sFeaturesLink;
				end
				--The Alt Pal Features feature comes with it's own Benefits feature node that will be added if selected, so delete this Alt Pal Features node 
				deleteFromSpecialAbilities(rAdd, nil, "Alternative Paladin Features");
				displayAlternativeFeatureDialog(rAdd, tAlternativeClassFeaturesOptions, tStringCharBuildData);
				break;
			end
		end		
	elseif sClassFeatureName == "Alternative Paladin Features" then
		--Add the feature, but if you have also already added Lay on Hands, choose between them
		addBasicClassFeature(rAdd, sClassFeatureName, sClassFeatureFilteredDescription);
		for _, featureNode in pairs(tCurrentFeatures) do
			if DB.getText(DB.getPath(featureNode, "value")) == "Lay On Hands" then
				local sPattern = '<link class="powerdesc" recordname="reference.features.%w+@[%w%s]+">';
				local sFeaturesLink = string.match(sClassFeatureOriginalDescription, sPattern);
				if sFeaturesLink then
					tAlternativeClassFeaturesOptions[2] = sFeaturesLink;
				end
				--The Alt Pal Features feature comes with it's own Benefits feature node that will be added if selected, so delete this Alt Pal Features node 
				deleteFromSpecialAbilities(rAdd, nil, "Alternative Paladin Features");
				displayAlternativeFeatureDialog(rAdd, tAlternativeClassFeaturesOptions, tStringCharBuildData);
				break;
			end
		end
	else
		addDefaultClassFeature(sClassName, rAdd, sClassFeatureName, sClassFeatureFilteredDescription, sClassFeatureOriginalDescription);
	end
end

-------------------------------------------
----- Ranger Class Features ----
-------------------------------------------
function addRangerFeatures(sClassName, rAdd, sClassFeatureName, sClassFeatureFilteredDescription, sClassFeatureOriginalDescription)
	local tCurrentFeatures = DB.getChildren(rAdd.nodeChar, "specialabilitylist");
	if sClassFeatureName == "Prime Shot" then
		--Add the feature, but if you have also already added Running Attack, choose between them
		addBasicClassFeature(rAdd, sClassFeatureName, sClassFeatureFilteredDescription);
		for _, featureNode in pairs(tCurrentFeatures) do
			if DB.getText(DB.getPath(featureNode, "value")) == "Running Attack" then
				displayRangerPrimeShotDialog(rAdd);
				break;
			end
		end
	elseif sClassFeatureName == "Running Attack" then
		--Add the feature, but if you have also already added Prime Shot, choose between them
		addBasicClassFeature(rAdd, sClassFeatureName, sClassFeatureFilteredDescription);
		for _, featureNode in pairs(tCurrentFeatures) do
			if DB.getText(DB.getPath(featureNode, "value")) == "Prime Shot" then
				displayRangerPrimeShotDialog(rAdd);
				break;
			end
		end
	elseif sClassFeatureName == "Fighting Style" then
		-- Add the feature and choose between all of the ranger fighting styles
		-- Not using the generic class feature selection dialogue 
		-- so that it displays the special chat message for ranger beast master style
		addBasicClassFeature(rAdd, sClassFeatureName, sClassFeatureFilteredDescription);
		displayRangerFightingStyleDialog(rAdd, sClassFeatureOriginalDescription);
	else
		addDefaultClassFeature(sClassName, rAdd, sClassFeatureName, sClassFeatureFilteredDescription, sClassFeatureOriginalDescription);
	end
end
function displayRangerPrimeShotDialog(rAdd, sClassFeatureOriginalDescription)
	--Display information on the selections in chat
	local sPattern = '<link class="powerdesc" recordname="reference.features.(%w+)@([%w%s]+)">';
	local tCurrentFeatures = DB.getChildren(rAdd.nodeChar, "specialabilitylist");
	local isBeastMasterySelected = false;
	local tOptions = {}
	for x,y in pairs(tCurrentFeatures) do
		local sFeatureName = DB.getText(DB.getPath(y, "value"));
		local sLinkClass = "ref_ability";
		local sNodePath = DB.getPath(y);
		if sFeatureName == "Beast Mastery" then
			isBeastMasterySelected = true;
		end
		if sFeatureName == "Prime Shot" or sFeatureName == "Running Attack" or sFeatureName == "Beast Mastery" then
			table.insert(tOptions, { text = sFeatureName, linkclass = sLinkClass, linkrecord = sNodePath, });
		end
	end
	--Display a pop-up where we either choose Prime Shot or Running Attack, 
	-- unless they've already selected the Beast Mastery Fighting Style

	table.insert(tOptions, "Beast Mastery");
	if isBeastMasterySelected then
		for i,v in ipairs(tOptions) do
			if v ~= "Beast Mastery" then
				table[i] = nil;
			end
		end
	-- 	tOptions[1] = "Beast Mastery";
	-- else
	-- 	tOptions[1] = "Prime Shot";
	-- 	tOptions[2] = "Running Attack";
	-- 	tOptions[3] = "Beast Mastery";
	end
	local tDialogData = {
		title = Interface.getString("char_build_title_addprimeshot"),
		msg = Interface.getString("char_build_message_addprimeshotorrunningattack"),
		options = tOptions,
		min = 1,
		max = 1,
		callback = CharClassFeatureDescManager.callbackResolveRangerPrimeShotDialogSelection,
		custom = rAdd,
	};
	DialogManager.requestSelectionDialog(tDialogData);
end
function callbackResolveRangerPrimeShotDialogSelection(tSelection, rAdd)
	if not tSelection or not tSelection[1] then
		ChatManager.SystemMessageResource("char_error_addclasssfeature");
		return;
	end
	local tCurrentFeatures = DB.getChildren(rAdd.nodeChar, "specialabilitylist");
	if #tSelection == 1 then
		if tSelection[1] == "Prime Shot" then
			for _, featureNode in pairs(tCurrentFeatures) do
				if DB.getText(DB.getPath(featureNode, "value")) == "Running Attack" then
					DB.deleteNode(featureNode);
					ChatManager.SystemMessageResource("char_abilities_message_classfeatureadd", tSelection[1], rAdd.sCharName);
					break;
				end
			end
		elseif tSelection[1] == "Running Attack" then
				for _, featureNode in pairs(tCurrentFeatures) do
				if DB.getText(DB.getPath(featureNode, "value")) == "Prime Shot" then
					DB.deleteNode(featureNode);
					ChatManager.SystemMessageResource("char_abilities_message_classfeatureadd", tSelection[1], rAdd.sCharName);
					break;
				end
			end
		elseif tSelection[1] == "Beast Mastery" then
			--If you have the Beast Master Fighting style, you cannot choose Prime Shot or Running Attack
			local alreadyPosted = false;
			for _, featureNode in pairs(tCurrentFeatures) do
				if DB.getText(DB.getPath(featureNode, "value")) == "Prime Shot" or DB.getText(DB.getPath(featureNode, "value")) == "Running Attack" then
					DB.deleteNode(featureNode);
					if alreadyPosted == false then
						ChatManager.SystemMessageResource("char_abilities_message_beastmasteryclassfeatureadd", tSelection[1], rAdd.sCharName);
					end
					alreadyPosted = true;
				end
			end
		end
	end
end

function displayRangerFightingStyleDialog(rAdd, sClassFeatureOriginalDescription)
	local tFightingStyleOptions = {};
	local tOptions = {};
	--Display information on the selections in chat
	local sPattern = '<link class="powerdesc" recordname="reference.features.(%w+)@([%w%s]+)">';
	local sFeaturesLink = string.gmatch(sClassFeatureOriginalDescription, sPattern);
	local nOptionsCount = 1;
	for w,v in sFeaturesLink do
		local sPattern = "reference.features." .. w .. "@" .. v;
		local sClassFeatureName = DB.getText(DB.getPath(sPattern, "name"));
		local sClassFeatureDescription = DB.getText(DB.getPath(sPattern, "description"));
		tFightingStyleOptions[sClassFeatureName] = DB.getPath(sPattern);
		table.insert(tOptions, { text = sClassFeatureName, linkclass = "powerdesc", linkrecord = DB.getPath(sPattern), });
		nOptionsCount = nOptionsCount + 1;
	end
	--Display a pop-up where we choose from the fighting styles
	local tDialogData = {
		title = Interface.getString("char_build_title_addfightingstyle"),
		msg = Interface.getString("char_build_message_addfightingstyle"),
		options = tOptions,
		min = 1,
		max = 1,
		callback = CharClassFeatureDescManager.callbackResolveFightingStyleDialogSelection,
		custom = { rAdd = rAdd, tFightingStyleOptions = tFightingStyleOptions }, 
	};
	DialogManager.requestSelectionDialog(tDialogData);	
end
function callbackResolveFightingStyleDialogSelection(tSelection, tData)
	if not tSelection or not tSelection[1] then
		ChatManager.SystemMessageResource("char_error_addclasssfeature");
		return;
	end
	local sSelectedFightingStyleDBReference;
	local tCurrentFeatures = DB.getChildren(tData.rAdd.nodeChar, "specialabilitylist");
	if #tSelection == 1 then
		for _, featureNode in pairs(tCurrentFeatures) do
			if DB.getText(DB.getPath(featureNode, "value")) ~= tSelection[1] then
				for x, y in pairs(tData.tFightingStyleOptions) do
					if DB.getText(DB.getPath(featureNode, "value")) == x then
						DB.deleteNode(featureNode);
						break;
					end
				end
			end
		end
		sSelectedFightingStyleDBReference = tData.tFightingStyleOptions[tSelection[1]];
		local rCreatedIDChildNode = DB.createChild(tData.rAdd.nodeChar.getPath("specialabilitylist"));
		DB.setValue(rCreatedIDChildNode, "shortcut", "windowreference", "powerdesc", sSelectedFightingStyleDBReference);
		DB.setValue(rCreatedIDChildNode, "value", "string", tSelection[1]);
		--DB.setValue(rCreatedIDChildNode, "description", "string", sClassFeatureOriginalDescription);
		if tSelection[1] == "Beast Mastery" then
			ChatManager.SystemMessageResource("char_abilities_message_beastmasteryclassfeatureadd", tSelection[1], tData.rAdd.sCharName);
		else
			ChatManager.SystemMessageResource("char_abilities_message_classfeatureadd", tSelection[1], tData.rAdd.sCharName);
		end
	end
end


-------------------------------------------
----- Rogue (Scoundrel) Class Features ----
-------------------------------------------
function addRogueScoundrelFeatures(sClassName, rAdd, sClassFeatureName, sClassFeatureFilteredDescription, sClassFeatureOriginalDescription)
	local tCurrentFeatures = DB.getChildren(rAdd.nodeChar, "specialabilitylist");
	local tAlternativeClassFeaturesOptions = {};
	tAlternativeClassFeaturesOptions[1] = "Scoundrel Weapon Talent";
	tAlternativeClassFeaturesOptions[2] = "Sharpshooter Talent";
	--String data for the dialogue windows. 1 is title, 2 is message.
	local tStringCharBuildData = {};
	tStringCharBuildData[1] = "char_build_title_addscoundrelweapontalent";
	tStringCharBuildData[2] = "char_build_message_addscoundrelweapontalent";
	if sClassFeatureName == "Scoundrel Weapon Talent" then
		--Add the feature, but if you have also already added Sharpshooter Talent, choose between them
		local rCreatedIDChildNode = DB.createChild(rAdd.nodeChar.getPath("specialabilitylist"));
		DB.setValue(rCreatedIDChildNode, "shortcut", "windowreference");
		DB.setValue(rCreatedIDChildNode, "value", "string", sClassFeatureName);
		DB.setValue(rCreatedIDChildNode, "description", "string", sClassFeatureFilteredDescription);
		for _, featureNode in pairs(tCurrentFeatures) do
			if DB.getText(DB.getPath(featureNode, "value")) == "Sharpshooter Talent" then
				displayAlternativeFeatureDialog(rAdd, tAlternativeClassFeaturesOptions, tStringCharBuildData);
				break;
			end
		end
	elseif sClassFeatureName == "Sharpshooter Talent" then
		--Add the feature, but if you have also already added Scoundrel Weapon Talent, choose between them
		local rCreatedIDChildNode = DB.createChild(rAdd.nodeChar.getPath("specialabilitylist"));
		DB.setValue(rCreatedIDChildNode, "shortcut", "windowreference");
		DB.setValue(rCreatedIDChildNode, "value", "string", sClassFeatureName);
		DB.setValue(rCreatedIDChildNode, "description", "string", sClassFeatureFilteredDescription);
		for _, featureNode in pairs(tCurrentFeatures) do
			if DB.getText(DB.getPath(featureNode, "value")) == "Scoundrel Weapon Talent" then
				displayAlternativeFeatureDialog(rAdd, tAlternativeClassFeaturesOptions, tStringCharBuildData);
				break;
			end
		end
	elseif sClassFeatureName == "Rogue Tactics" then
		-- Add the feature and choose between all of the rogue tactics
		local rCreatedIDChildNode = DB.createChild(rAdd.nodeChar.getPath("specialabilitylist"));
		DB.setValue(rCreatedIDChildNode, "shortcut", "windowreference");
		DB.setValue(rCreatedIDChildNode, "value", "string", sClassFeatureName);
		DB.setValue(rCreatedIDChildNode, "description", "string", sClassFeatureFilteredDescription);
		displayClassFeatureSelectionsDialog(rAdd, sClassFeatureOriginalDescription, sClassFeatureName);
	else
		local rCreatedIDChildNode = DB.createChild(rAdd.nodeChar.getPath("specialabilitylist"));
		DB.setValue(rCreatedIDChildNode, "shortcut", "windowreference");
		DB.setValue(rCreatedIDChildNode, "value", "string", sClassFeatureName);
		DB.setValue(rCreatedIDChildNode, "description", "string", sClassFeatureFilteredDescription);
		ChatManager.SystemMessageResource("char_abilities_message_classfeatureadd", sClassFeatureName, rAdd.sCharName);
	end
end



-------------------------------------------
----- WARLOCK Class Features ----
-------------------------------------------
function addWarlockFeatures(sClassName, rAdd, sClassFeatureName, sClassFeatureFilteredDescription, sClassFeatureOriginalDescription)
	local tCurrentFeatures = DB.getChildren(rAdd.nodeChar, "specialabilitylist");
	if sClassFeatureName == "Eldritch Pact" then
		-- Add the feature and choose between all of the warlock pacts
		local rCreatedIDChildNode = DB.createChild(rAdd.nodeChar.getPath("specialabilitylist"));
		DB.setValue(rCreatedIDChildNode, "shortcut", "windowreference");
		DB.setValue(rCreatedIDChildNode, "value", "string", sClassFeatureName);
		DB.setValue(rCreatedIDChildNode, "description", "string", sClassFeatureFilteredDescription);
		displayClassFeatureSelectionsDialog(rAdd, sClassFeatureOriginalDescription, sClassFeatureName, 1, 1);
	else
		local rCreatedIDChildNode = DB.createChild(rAdd.nodeChar.getPath("specialabilitylist"));
		DB.setValue(rCreatedIDChildNode, "shortcut", "windowreference");
		DB.setValue(rCreatedIDChildNode, "value", "string", sClassFeatureName);
		DB.setValue(rCreatedIDChildNode, "description", "string", sClassFeatureFilteredDescription);
		ChatManager.SystemMessageResource("char_abilities_message_classfeatureadd", sClassFeatureName, rAdd.sCharName);
	end
end


-------------------------------------------
----- WARLORD (MARSHAL) Class Features ----
-------------------------------------------
function addWarlordMarshalFeatures(sClassName, rAdd, sClassFeatureName, sClassFeatureFilteredDescription, sClassFeatureOriginalDescription)
	local tCurrentFeatures = DB.getChildren(rAdd.nodeChar, "specialabilitylist");
	local tAlternativeClassFeaturesOptions = {};
	tAlternativeClassFeaturesOptions[1] = "Battlefront Leader";
	tAlternativeClassFeaturesOptions[2] = "Canny Leader";
	tAlternativeClassFeaturesOptions[3] = "Combat Leader";
	if sClassFeatureName == "Battlefront Leader" then
		--Add the feature, but if you have also already added Canny Leader and Combat Leader, choose between them
		local rCreatedIDChildNode = DB.createChild(rAdd.nodeChar.getPath("specialabilitylist"));
		DB.setValue(rCreatedIDChildNode, "shortcut", "windowreference");
		DB.setValue(rCreatedIDChildNode, "value", "string", sClassFeatureName);
		DB.setValue(rCreatedIDChildNode, "description", "string", sClassFeatureFilteredDescription);
		local containsLeaderOne = false;
		local containsLeaderTwo = false;
		for _, featureNode in pairs(tCurrentFeatures) do
			if DB.getText(DB.getPath(featureNode, "value")) == "Canny Leader" then
				containsLeaderOne = true;
			elseif DB.getText(DB.getPath(featureNode, "value")) == "Combat Leader" then
				containsLeaderTwo = true;
			end
		end
		if containsLeaderOne == true and containsLeaderTwo == true then
			displayAlternativeFeatureDialog(rAdd, tAlternativeClassFeaturesOptions);
		end
	elseif sClassFeatureName == "Canny Leader" then
		--Add the feature, but if you have also already added Battlefront Leader or Combat Leader, choose between them
		local rCreatedIDChildNode = DB.createChild(rAdd.nodeChar.getPath("specialabilitylist"));
		DB.setValue(rCreatedIDChildNode, "shortcut", "windowreference");
		DB.setValue(rCreatedIDChildNode, "value", "string", sClassFeatureName);
		DB.setValue(rCreatedIDChildNode, "description", "string", sClassFeatureFilteredDescription);
		local containsLeaderOne = false;
		local containsLeaderTwo = false;
		for _, featureNode in pairs(tCurrentFeatures) do
			if DB.getText(DB.getPath(featureNode, "value")) == "Battlefront Leader" then
				containsLeaderOne = true;
			elseif DB.getText(DB.getPath(featureNode, "value")) == "Combat Leader" then
				containsLeaderTwo = true;
			end
		end
		if containsLeaderOne == true and containsLeaderTwo == true then
			displayAlternativeFeatureDialog(rAdd, tAlternativeClassFeaturesOptions);
		end
	elseif sClassFeatureName == "Combat Leader" then
		--Add the feature, but if you have also already added Battlefront Leader or Canny Leader, choose between them
		local rCreatedIDChildNode = DB.createChild(rAdd.nodeChar.getPath("specialabilitylist"));
		DB.setValue(rCreatedIDChildNode, "shortcut", "windowreference");
		DB.setValue(rCreatedIDChildNode, "value", "string", sClassFeatureName);
		DB.setValue(rCreatedIDChildNode, "description", "string", sClassFeatureFilteredDescription);
		local containsLeaderOne = false;
		local containsLeaderTwo = false;
		for _, featureNode in pairs(tCurrentFeatures) do
			if DB.getText(DB.getPath(featureNode, "value")) == "Battlefront Leader" then
				containsLeaderOne = true;
			elseif DB.getText(DB.getPath(featureNode, "value")) == "Canny Leader" then
				containsLeaderTwo = true;
			end
		end
		if containsLeaderOne == true and containsLeaderTwo == true then
			displayAlternativeFeatureDialog(rAdd, tAlternativeClassFeaturesOptions);
		end	
	elseif sClassFeatureName == "Archer Warlord" then
		-- Add the feature 
		local rCreatedIDChildNode = DB.createChild(rAdd.nodeChar.getPath("specialabilitylist"));
		DB.setValue(rCreatedIDChildNode, "shortcut", "windowreference");
		DB.setValue(rCreatedIDChildNode, "value", "string", sClassFeatureName);
		DB.setValue(rCreatedIDChildNode, "description", "string", sClassFeatureFilteredDescription);
		-- and a custom feature to represent the default it replaces, clearing the current node if it exists
		sClassFeatureName = "Standard Warlord Armor Features";
		sClassFeatureOriginalDescription = "Keep your proficiency with chainmail and light shields."
		local tCurrentFeatures = DB.getChildren(rAdd.nodeChar, "specialabilitylist");
		for _, featureNode in pairs(tCurrentFeatures) do
			if DB.getText(DB.getPath(featureNode, "value")) == "Standard Warlord Armor Features" then
				DB.deleteNode(featureNode);
			end
		end
		rCreatedIDChildNode = DB.createChild(rAdd.nodeChar.getPath("specialabilitylist"));
		DB.setValue(rCreatedIDChildNode, "shortcut", "windowreference");
		DB.setValue(rCreatedIDChildNode, "value", "string", sClassFeatureName);
		DB.setValue(rCreatedIDChildNode, "description", "string", sClassFeatureOriginalDescription);
		displayWarlordMarshalArcherWarlordDialog(rAdd);		
	elseif sClassFeatureName == "Commanding Presence" then
		-- Add the feature and choose between all of the fighter talents
		local rCreatedIDChildNode = DB.createChild(rAdd.nodeChar.getPath("specialabilitylist"));
		DB.setValue(rCreatedIDChildNode, "shortcut", "windowreference");
		DB.setValue(rCreatedIDChildNode, "value", "string", sClassFeatureName);
		DB.setValue(rCreatedIDChildNode, "description", "string", sClassFeatureFilteredDescription);
		displayClassFeatureSelectionsDialog(rAdd, sClassFeatureOriginalDescription, sClassFeatureName);
	else
		local rCreatedIDChildNode = DB.createChild(rAdd.nodeChar.getPath("specialabilitylist"));
		DB.setValue(rCreatedIDChildNode, "shortcut", "windowreference");
		DB.setValue(rCreatedIDChildNode, "value", "string", sClassFeatureName);
		DB.setValue(rCreatedIDChildNode, "description", "string", sClassFeatureFilteredDescription);
		ChatManager.SystemMessageResource("char_abilities_message_classfeatureadd", sClassFeatureName, rAdd.sCharName);
	end
end

function displayWarlordMarshalArcherWarlordDialog(rAdd)
	--Display links to the selections
	local sPattern = '<link class="powerdesc" recordname="reference.features.(%w+)@([%w%s]+)">';
	local tCurrentFeatures = DB.getChildren(rAdd.nodeChar, "specialabilitylist");
	local tOptions = {};
	for x,y in pairs(tCurrentFeatures) do
		local sClassFeatureName = DB.getText(DB.getPath(y, "value"))
		if sClassFeatureName == "Standard Warlord Armor Features" or sClassFeatureName == "Archer Warlord" then
			table.insert(tOptions, { text = sClassFeatureName, linkclass = "ref_ability", linkrecord = DB.getPath(y), });
		end
	end
	--Display a pop-up where we either choose Standard Warlord Armor Features or Archer Warlord
	local tDialogData = {
		title = Interface.getString("char_build_title_addarcherwarlord"),
		msg = Interface.getString("char_build_message_addarcherwarlord"),
		options = tOptions,
		min = 1,
		max = 1,
		callback = CharClassFeatureDescManager.callbackResolveWarlordMarshalArcherWarlordDialogSelection,
		custom = rAdd,
	};
	DialogManager.requestSelectionDialog(tDialogData);
end
function callbackResolveWarlordMarshalArcherWarlordDialogSelection(tSelection, rAdd)
	if not tSelection or not tSelection[1] then
		ChatManager.SystemMessageResource("char_error_addclasssfeature");
		return;
	end
	local tCurrentFeatures = DB.getChildren(rAdd.nodeChar, "specialabilitylist");
	if #tSelection == 1 then
		if tSelection[1] == "Standard Warlord Armor Features" then
			for _, featureNode in pairs(tCurrentFeatures) do
				if DB.getText(DB.getPath(featureNode, "value")) == "Archer Warlord" then
					DB.deleteNode(featureNode);
					break;
				end
			end
		elseif tSelection[1] == "Archer Warlord" then
				for _, featureNode in pairs(tCurrentFeatures) do
				if DB.getText(DB.getPath(featureNode, "value")) == "Standard Warlord Armor Features" then
					DB.deleteNode(featureNode);
				end
				local tCurrentArmorProficiencies = DB.getChildren(rAdd.nodeChar, "proficiencyarmor");
				for armorProficiencyName, armorProficiencyNode in pairs(tCurrentArmorProficiencies) do
					if DB.getText(DB.getPath(armorProficiencyNode, "value")):lower() == "chainmail" or DB.getText(DB.getPath(armorProficiencyNode, "value")):lower() == "light shields" then
						DB.deleteNode(armorProficiencyNode);
						ChatManager.SystemMessageResource("char_abilities_message_weaponproficiencyremove", x, rAdd.sCharName);
					end
				end
				local tCurrentWeaponProficiencies = DB.getChildren(rAdd.nodeChar, "proficiencyweapon");
				local x = "Military Ranged";
				local isWeaponProficiencyInList = false;
				for weaponProficiencyName, weaponProficiencyNode in pairs(tCurrentWeaponProficiencies) do
					if DB.getText(DB.getPath(weaponProficiencyNode, "value")) == x then
						isWeaponProficiencyInList = true;
					end
				end
				if isWeaponProficiencyInList == false then
					local rCreatedIDChildNode = DB.createChild(rAdd.nodeChar.getPath("proficiencyweapon"));
					DB.setValue(rCreatedIDChildNode, "shortcut", "windowreference");
					DB.setValue(rCreatedIDChildNode, "value", "string", x);
					ChatManager.SystemMessageResource("char_abilities_message_weaponproficiencyadd", x, rAdd.sCharName);
				end
			end
		end
	end
end


-------------------------------------------
----- WIZARD (ARCANIST) Class Features ----
-------------------------------------------
function addWizardArcanistFeatures(sClassName, rAdd, sClassFeatureName, sClassFeatureFilteredDescription, sClassFeatureOriginalDescription)
	local tCurrentFeatures = DB.getChildren(rAdd.nodeChar, "specialabilitylist");
	if sClassFeatureName == "Arcane Implement Mastery" then
		-- Add the feature and choose between all of the wizard (arcanist) implement masteries
		local rCreatedIDChildNode = DB.createChild(rAdd.nodeChar.getPath("specialabilitylist"));
		DB.setValue(rCreatedIDChildNode, "shortcut", "windowreference");
		DB.setValue(rCreatedIDChildNode, "value", "string", sClassFeatureName);
		DB.setValue(rCreatedIDChildNode, "description", "string", sClassFeatureFilteredDescription);
		displayClassFeatureSelectionsDialog(rAdd, sClassFeatureOriginalDescription, sClassFeatureName, 1, 1);
	else
		local rCreatedIDChildNode = DB.createChild(rAdd.nodeChar.getPath("specialabilitylist"));
		DB.setValue(rCreatedIDChildNode, "shortcut", "windowreference");
		DB.setValue(rCreatedIDChildNode, "value", "string", sClassFeatureName);
		DB.setValue(rCreatedIDChildNode, "description", "string", sClassFeatureFilteredDescription);
		ChatManager.SystemMessageResource("char_abilities_message_classfeatureadd", sClassFeatureName, rAdd.sCharName);

		--Add powers
		if string.find(sClassFeatureName:lower(), "cantrips") then
			CharClassPowerManager.dispayItalicPowersDialog(rAdd, sClassFeatureOriginalDescription, sClassFeatureName);
		end
		if string.find(sClassFeatureName:lower(), "spellbook") then
			local nNumberOfPowersChoice = 2;
			CharClassPowerManager.addWizardArcanistSpellbookPowers(rAdd, sClassName, nNumberOfPowersChoice);
		end
	end
end




-------------------------------------------
----- AVENGER Class Features ----
-------------------------------------------
function addAvengerFeatures(sClassName, rAdd, sClassFeatureName, sClassFeatureFilteredDescription, sClassFeatureOriginalDescription)
	local tCurrentFeatures = DB.getChildren(rAdd.nodeChar, "specialabilitylist");
	if sClassFeatureName == "Avenger's Censure" then
		-- Add the feature and choose between all of the Avenger censures
		local rCreatedIDChildNode = DB.createChild(rAdd.nodeChar.getPath("specialabilitylist"));
		DB.setValue(rCreatedIDChildNode, "shortcut", "windowreference");
		DB.setValue(rCreatedIDChildNode, "value", "string", sClassFeatureName);
		DB.setValue(rCreatedIDChildNode, "description", "string", sClassFeatureFilteredDescription);
		displayClassFeatureSelectionsDialog(rAdd, sClassFeatureOriginalDescription, sClassFeatureName);
	else
		local rCreatedIDChildNode = DB.createChild(rAdd.nodeChar.getPath("specialabilitylist"));
		DB.setValue(rCreatedIDChildNode, "shortcut", "windowreference");
		DB.setValue(rCreatedIDChildNode, "value", "string", sClassFeatureName);
		DB.setValue(rCreatedIDChildNode, "description", "string", sClassFeatureFilteredDescription);
		ChatManager.SystemMessageResource("char_abilities_message_classfeatureadd", sClassFeatureName, rAdd.sCharName);
	end
end


-------------------------------------------
----- BARBARIAN Class Features ----
-------------------------------------------
function addBarbarianFeatures(sClassName, rAdd, sClassFeatureName, sClassFeatureFilteredDescription, sClassFeatureOriginalDescription)
	local tCurrentFeatures = DB.getChildren(rAdd.nodeChar, "specialabilitylist");
	if sClassFeatureName == "Feral Might" then
		-- Add the feature and choose between all of the Barbarian Feral Mights
		local rCreatedIDChildNode = DB.createChild(rAdd.nodeChar.getPath("specialabilitylist"));
		DB.setValue(rCreatedIDChildNode, "shortcut", "windowreference");
		DB.setValue(rCreatedIDChildNode, "value", "string", sClassFeatureName);
		DB.setValue(rCreatedIDChildNode, "description", "string", sClassFeatureFilteredDescription);
		displayClassFeatureSelectionsDialog(rAdd, sClassFeatureOriginalDescription, sClassFeatureName);
	else
		local rCreatedIDChildNode = DB.createChild(rAdd.nodeChar.getPath("specialabilitylist"));
		DB.setValue(rCreatedIDChildNode, "shortcut", "windowreference");
		DB.setValue(rCreatedIDChildNode, "value", "string", sClassFeatureName);
		DB.setValue(rCreatedIDChildNode, "description", "string", sClassFeatureFilteredDescription);
		ChatManager.SystemMessageResource("char_abilities_message_classfeatureadd", sClassFeatureName, rAdd.sCharName);
	end
end


-------------------------------------------
----- BARD Class Features ----
-------------------------------------------
function addBardFeatures(sClassName, rAdd, sClassFeatureName, sClassFeatureFilteredDescription, sClassFeatureOriginalDescription)
	local tCurrentFeatures = DB.getChildren(rAdd.nodeChar, "specialabilitylist");
	if sClassFeatureName == "Bardic Virtue" then
		-- Add the feature and choose between all of the Bard Bardic Virtues
		local rCreatedIDChildNode = DB.createChild(rAdd.nodeChar.getPath("specialabilitylist"));
		DB.setValue(rCreatedIDChildNode, "shortcut", "windowreference");
		DB.setValue(rCreatedIDChildNode, "value", "string", sClassFeatureName);
		DB.setValue(rCreatedIDChildNode, "description", "string", sClassFeatureFilteredDescription);
		displayClassFeatureSelectionsDialog(rAdd, sClassFeatureOriginalDescription, sClassFeatureName);
	else
		local rCreatedIDChildNode = DB.createChild(rAdd.nodeChar.getPath("specialabilitylist"));
		DB.setValue(rCreatedIDChildNode, "shortcut", "windowreference");
		DB.setValue(rCreatedIDChildNode, "value", "string", sClassFeatureName);
		DB.setValue(rCreatedIDChildNode, "description", "string", sClassFeatureFilteredDescription);
		ChatManager.SystemMessageResource("char_abilities_message_classfeatureadd", sClassFeatureName, rAdd.sCharName);
	end
end

-------------------------------------------
----- DRUID Class Features ----
-------------------------------------------
function addDruidFeatures(sClassName, rAdd, sClassFeatureName, sClassFeatureFilteredDescription, sClassFeatureOriginalDescription)
	local tCurrentFeatures = DB.getChildren(rAdd.nodeChar, "specialabilitylist");
	if sClassFeatureName == "Primal Aspect" then
		-- Add the feature and choose between all of the Druid Primal Aspects
		local rCreatedIDChildNode = DB.createChild(rAdd.nodeChar.getPath("specialabilitylist"));
		DB.setValue(rCreatedIDChildNode, "shortcut", "windowreference");
		DB.setValue(rCreatedIDChildNode, "value", "string", sClassFeatureName);
		DB.setValue(rCreatedIDChildNode, "description", "string", sClassFeatureFilteredDescription);
		displayClassFeatureSelectionsDialog(rAdd, sClassFeatureOriginalDescription, sClassFeatureName);
	elseif sClassFeatureName == "Wild Shape" then
		local sWildShapeText, sDruidsRitualsText = string.match(sClassFeatureOriginalDescription, "(.+)<p>DRUIDS AND RITUALS</p>(.+)")
		local rCreatedIDChildNode = DB.createChild(rAdd.nodeChar.getPath("specialabilitylist"));
		DB.setValue(rCreatedIDChildNode, "shortcut", "windowreference");
		DB.setValue(rCreatedIDChildNode, "value", "string", sClassFeatureName);
		DB.setValue(rCreatedIDChildNode, "description", "string", convertHTMLTable(sWildShapeText));
		local rCreatedIDChildNode = DB.createChild(rAdd.nodeChar.getPath("specialabilitylist"));
		DB.setValue(rCreatedIDChildNode, "shortcut", "windowreference");
		DB.setValue(rCreatedIDChildNode, "value", "string", "Druids and Rituals");
		DB.setValue(rCreatedIDChildNode, "description", "string", removeLinkLists(convertHTMLTable(sDruidsRitualsText)));

		CharClassPowerManager.addAllFeaturePowers(rAdd, sClassFeatureOriginalDescription, sClassName);
	else
		local rCreatedIDChildNode = DB.createChild(rAdd.nodeChar.getPath("specialabilitylist"));
		DB.setValue(rCreatedIDChildNode, "shortcut", "windowreference");
		DB.setValue(rCreatedIDChildNode, "value", "string", sClassFeatureName);
		DB.setValue(rCreatedIDChildNode, "description", "string", sClassFeatureFilteredDescription);
		ChatManager.SystemMessageResource("char_abilities_message_classfeatureadd", sClassFeatureName, rAdd.sCharName);
	end
end


-------------------------------------------
----- INVOKER Class Features ----
-------------------------------------------
function addInvokerFeatures(sClassName, rAdd, sClassFeatureName, sClassFeatureFilteredDescription, sClassFeatureOriginalDescription)
	local tCurrentFeatures = DB.getChildren(rAdd.nodeChar, "specialabilitylist");
	if sClassFeatureName == "Divine Covenant" then
		-- Add the feature and choose between all of the Invoker Divine Covenants
		local rCreatedIDChildNode = DB.createChild(rAdd.nodeChar.getPath("specialabilitylist"));
		DB.setValue(rCreatedIDChildNode, "shortcut", "windowreference");
		DB.setValue(rCreatedIDChildNode, "value", "string", sClassFeatureName);
		DB.setValue(rCreatedIDChildNode, "description", "string", sClassFeatureFilteredDescription);
		displayClassFeatureSelectionsDialog(rAdd, sClassFeatureOriginalDescription, sClassFeatureName, 1, 1);
	else
		local rCreatedIDChildNode = DB.createChild(rAdd.nodeChar.getPath("specialabilitylist"));
		DB.setValue(rCreatedIDChildNode, "shortcut", "windowreference");
		DB.setValue(rCreatedIDChildNode, "value", "string", sClassFeatureName);
		DB.setValue(rCreatedIDChildNode, "description", "string", sClassFeatureFilteredDescription);
		ChatManager.SystemMessageResource("char_abilities_message_classfeatureadd", sClassFeatureName, rAdd.sCharName);
	end
end

-------------------------------------------
----- SHAMAN Class Features ----
-------------------------------------------
function addShamanFeatures(sClassName, rAdd, sClassFeatureName, sClassFeatureFilteredDescription, sClassFeatureOriginalDescription)
	local tCurrentFeatures = DB.getChildren(rAdd.nodeChar, "specialabilitylist");
	if sClassFeatureName == "Companion Spirit" then
		-- Add the feature and choose between all of the Shaman Companion Spirit
		local rCreatedIDChildNode = DB.createChild(rAdd.nodeChar.getPath("specialabilitylist"));
		DB.setValue(rCreatedIDChildNode, "shortcut", "windowreference");
		DB.setValue(rCreatedIDChildNode, "value", "string", sClassFeatureName);
		DB.setValue(rCreatedIDChildNode, "description", "string", sClassFeatureFilteredDescription);
		displayClassFeatureSelectionsDialog(rAdd, sClassFeatureOriginalDescription, sClassFeatureName, 1, 1);
	elseif sClassFeatureName == "Speak with Spirits" then
		local speakWithSpiritsText = string.match(sClassFeatureOriginalDescription, "(.+)<p>Shaman Overview</p>")
		local rCreatedIDChildNode = DB.createChild(rAdd.nodeChar.getPath("specialabilitylist"));
		DB.setValue(rCreatedIDChildNode, "shortcut", "windowreference");
		DB.setValue(rCreatedIDChildNode, "value", "string", sClassFeatureName);
		DB.setValue(rCreatedIDChildNode, "description", "string", removeLinkLists(convertHTMLTable(speakWithSpiritsText)));
	else
		local rCreatedIDChildNode = DB.createChild(rAdd.nodeChar.getPath("specialabilitylist"));
		DB.setValue(rCreatedIDChildNode, "shortcut", "windowreference");
		DB.setValue(rCreatedIDChildNode, "value", "string", sClassFeatureName);
		DB.setValue(rCreatedIDChildNode, "description", "string", sClassFeatureFilteredDescription);
		ChatManager.SystemMessageResource("char_abilities_message_classfeatureadd", sClassFeatureName, rAdd.sCharName);
	end
end


-------------------------------------------
----- SORCERER Class Features ----
-------------------------------------------
function addSorcererFeatures(sClassName, rAdd, sClassFeatureName, sClassFeatureFilteredDescription, sClassFeatureOriginalDescription)
	local tCurrentFeatures = DB.getChildren(rAdd.nodeChar, "specialabilitylist");
	if sClassFeatureName == "Spell Source" then
		-- Add the feature and choose between all of the Sorcerer spell sources
		local rCreatedIDChildNode = DB.createChild(rAdd.nodeChar.getPath("specialabilitylist"));
		DB.setValue(rCreatedIDChildNode, "shortcut", "windowreference");
		DB.setValue(rCreatedIDChildNode, "value", "string", sClassFeatureName);
		DB.setValue(rCreatedIDChildNode, "description", "string", sClassFeatureFilteredDescription);
		displaySorcererSpellSourceDialog(rAdd, sClassFeatureOriginalDescription, sClassFeatureName);
	else
		local rCreatedIDChildNode = DB.createChild(rAdd.nodeChar.getPath("specialabilitylist"));
		DB.setValue(rCreatedIDChildNode, "shortcut", "windowreference");
		DB.setValue(rCreatedIDChildNode, "value", "string", sClassFeatureName);
		DB.setValue(rCreatedIDChildNode, "description", "string", sClassFeatureFilteredDescription);
		ChatManager.SystemMessageResource("char_abilities_message_classfeatureadd", sClassFeatureName, rAdd.sCharName);
	end
end
function displaySorcererSpellSourceDialog(rAdd, sClassFeatureOriginalDescription, sParentClassFeatureName)
	local tSpellSourceOptions = {};
	local tOptions = {};
	local tAllOptions = {};
	local tAllDBReferenceOptions = {};
	--Start with the Sorcerer class features we already know about
	local tExistingSpellSources = { "Cosmic Magic", "Dragon Magic", "Storm Magic", "Wild Magic" };
	--Display links to the selections
	local sPattern = '<link class="powerdesc" recordname="reference.features.(%w+)@([%w%s]+)">';
	local sFeaturesLink = string.gmatch(sClassFeatureOriginalDescription, sPattern);
	local nOptionsCount = 1;
	local nAllOptionsCount = 1;
	for w,v in sFeaturesLink do
		local sPattern = "reference.features." .. w .. "@" .. v;
		local sClassFeatureName = DB.getText(DB.getPath(sPattern, "name"));
		local sClassFeatureDescription = DB.getText(DB.getPath(sPattern, "description"));
		local spellSourceSet = createSet(tExistingSpellSources);
		if spellSourceSet[sClassFeatureName] then
			tSpellSourceOptions[sClassFeatureName] = DB.getPath(sPattern);
			table.insert(tOptions, { text = sClassFeatureName, linkclass = "powerdesc", linkrecord = DB.getPath(sPattern), });
			nOptionsCount = nOptionsCount + 1;
		else
			tAllOptions[nAllOptionsCount] = sClassFeatureName;
			nAllOptionsCount = nAllOptionsCount + 1;
			tAllDBReferenceOptions[sClassFeatureName] = DB.getPath(sPattern);
		end
	end
	--Display a pop-up where we choose from the sorcerer spell sources
	local msg = string.format(Interface.getString("char_build_message_chooseclassfeatures"), "1", sParentClassFeatureName);
	local tDialogData = {
		title = Interface.getString("char_build_title_addsorcererspellsource"),
		msg = msg,
		options = tOptions,
		min = 1,
		max = 1,
		callback = CharClassFeatureDescManager.callbackResolveSorcererSpellSourceSelectionsDialogSelection,
		custom = { rAdd = rAdd, tClassFeatureOptions = tSpellSourceOptions, tAllOptions=tAllOptions, tAllDBReferenceOptions=tAllDBReferenceOptions }, 
	};
	DialogManager.requestSelectionDialog(tDialogData);	
end
function callbackResolveSorcererSpellSourceSelectionsDialogSelection(tSelection, tData)
	if not tSelection or not tSelection[1] then
		ChatManager.SystemMessageResource("char_error_addclasssfeature");
		return;
	end
	local sSelectedClassFeatureSelectionsDBReference;
	local tCurrentFeatures = DB.getChildren(tData.rAdd.nodeChar, "specialabilitylist");
	if #tSelection == 1 then
		local keyWord = {};
		if tSelection[1] == "Cosmic Magic" then
			keyWord[1] = "Cosmic";
		elseif tSelection[1] == "Dragon Magic" then
			keyWord[1] = "Dragon";
		elseif tSelection[1] == "Storm Magic" then
			keyWord[1] = "Storm";
		elseif tSelection[1] == "Wild Magic" then
			keyWord[1] = "Chaos";
			keyWord[2] = "Unfettered";
			keyWord[3] = "Wild";
		end		
		for _, featureNode in pairs(tCurrentFeatures) do
			if DB.getText(DB.getPath(featureNode, "value")) ~= tSelection[1] then
				for x, y in pairs(tData.tClassFeatureOptions) do
					if DB.getText(DB.getPath(featureNode, "value")) == x then
						DB.deleteNode(featureNode);
						break;
					end
				end
			end
		end
		for _,subSpellSource in pairs(tData.tAllOptions) do
			local isInList = false;
			local isCorrectSubSpellSource = false;
			for _, featureNode in pairs(tCurrentFeatures) do
				if DB.getText(DB.getPath(featureNode, "value")) == subSpellSource then
					isInList = true;
				end
			end
			for x, y in pairs(keyWord) do
				if string.find(subSpellSource, y) then
					isCorrectSubSpellSource = true;
				end
			end
			if isCorrectSubSpellSource and not isInList then
				sSelectedClassFeatureSelectionsDBReference = tData.tAllDBReferenceOptions[subSpellSource];
				local rCreatedIDChildNode = DB.createChild(tData.rAdd.nodeChar.getPath("specialabilitylist"));
				DB.setValue(rCreatedIDChildNode, "shortcut", "windowreference", "powerdesc", sSelectedClassFeatureSelectionsDBReference);
				DB.setValue(rCreatedIDChildNode, "value", "string", subSpellSource);
				ChatManager.SystemMessageResource("char_abilities_message_classfeatureadd", tSelection[1], tData.rAdd.sCharName);
			end
		end
		-- sSelectedClassFeatureSelectionsDBReference = tData.tClassFeatureOptions[tSelection[1]];
		-- local rCreatedIDChildNode = DB.createChild(tData.rAdd.nodeChar.getPath("specialabilitylist"));
		-- DB.setValue(rCreatedIDChildNode, "shortcut", "windowreference", "powerdesc", sSelectedClassFeatureSelectionsDBReference);
		-- DB.setValue(rCreatedIDChildNode, "value", "string", tSelection[1]);
		--DB.setValue(rCreatedIDChildNode, "description", "string", sClassFeatureOriginalDescription);
		-- ChatManager.SystemMessageResource("char_abilities_message_classfeatureadd", tSelection[1], tData.rAdd.sCharName);
	end
end


-------------------------------------------
----- WARDEN Class Features ----
-------------------------------------------
function addWardenFeatures(sClassName, rAdd, sClassFeatureName, sClassFeatureFilteredDescription, sClassFeatureOriginalDescription)
	local tCurrentFeatures = DB.getChildren(rAdd.nodeChar, "specialabilitylist");
	if sClassFeatureName == "Guardian Might" then
		-- Add the feature and choose between all of the warden guardian mights
		local rCreatedIDChildNode = DB.createChild(rAdd.nodeChar.getPath("specialabilitylist"));
		DB.setValue(rCreatedIDChildNode, "shortcut", "windowreference");
		DB.setValue(rCreatedIDChildNode, "value", "string", sClassFeatureName);
		DB.setValue(rCreatedIDChildNode, "description", "string", sClassFeatureFilteredDescription);
		displayClassFeatureSelectionsDialog(rAdd, sClassFeatureOriginalDescription, sClassFeatureName);
	else
		local rCreatedIDChildNode = DB.createChild(rAdd.nodeChar.getPath("specialabilitylist"));
		DB.setValue(rCreatedIDChildNode, "shortcut", "windowreference");
		DB.setValue(rCreatedIDChildNode, "value", "string", sClassFeatureName);
		DB.setValue(rCreatedIDChildNode, "description", "string", sClassFeatureFilteredDescription);
		ChatManager.SystemMessageResource("char_abilities_message_classfeatureadd", sClassFeatureName, rAdd.sCharName);
	end
end


-------------------------------------------
----- ARDENT Class Features ----
-------------------------------------------
function addArdentFeatures(sClassName, rAdd, sClassFeatureName, sClassFeatureFilteredDescription, sClassFeatureOriginalDescription)
	local tCurrentFeatures = DB.getChildren(rAdd.nodeChar, "specialabilitylist");
	if sClassFeatureName == "Ardent Mantle" then
		-- Add the feature and choose between all of the ardent mantles
		local rCreatedIDChildNode = DB.createChild(rAdd.nodeChar.getPath("specialabilitylist"));
		DB.setValue(rCreatedIDChildNode, "shortcut", "windowreference");
		DB.setValue(rCreatedIDChildNode, "value", "string", sClassFeatureName);
		DB.setValue(rCreatedIDChildNode, "description", "string", sClassFeatureFilteredDescription);
		displayClassFeatureSelectionsDialog(rAdd, sClassFeatureOriginalDescription, sClassFeatureName);
	else
		local rCreatedIDChildNode = DB.createChild(rAdd.nodeChar.getPath("specialabilitylist"));
		DB.setValue(rCreatedIDChildNode, "shortcut", "windowreference");
		DB.setValue(rCreatedIDChildNode, "value", "string", sClassFeatureName);
		DB.setValue(rCreatedIDChildNode, "description", "string", sClassFeatureFilteredDescription);
		ChatManager.SystemMessageResource("char_abilities_message_classfeatureadd", sClassFeatureName, rAdd.sCharName);
	end
end


-------------------------------------------
----- BATTLEMIND Class Features ----
-------------------------------------------
function addBattlemindFeatures(sClassName, rAdd, sClassFeatureName, sClassFeatureFilteredDescription, sClassFeatureOriginalDescription)
	local tCurrentFeatures = DB.getChildren(rAdd.nodeChar, "specialabilitylist");
	if sClassFeatureName == "Psionic Study" then
		-- Add the feature and choose between all of the battlemind psionic studies
		local rCreatedIDChildNode = DB.createChild(rAdd.nodeChar.getPath("specialabilitylist"));
		DB.setValue(rCreatedIDChildNode, "shortcut", "windowreference");
		DB.setValue(rCreatedIDChildNode, "value", "string", sClassFeatureName);
		DB.setValue(rCreatedIDChildNode, "description", "string", sClassFeatureFilteredDescription);
		displayClassFeatureSelectionsDialog(rAdd, sClassFeatureOriginalDescription, sClassFeatureName);
	else
		local rCreatedIDChildNode = DB.createChild(rAdd.nodeChar.getPath("specialabilitylist"));
		DB.setValue(rCreatedIDChildNode, "shortcut", "windowreference");
		DB.setValue(rCreatedIDChildNode, "value", "string", sClassFeatureName);
		DB.setValue(rCreatedIDChildNode, "description", "string", sClassFeatureFilteredDescription);
		ChatManager.SystemMessageResource("char_abilities_message_classfeatureadd", sClassFeatureName, rAdd.sCharName);
	end
end


-------------------------------------------
----- MONK Class Features ----
-------------------------------------------
function addMonkFeatures(sClassName, rAdd, sClassFeatureName, sClassFeatureFilteredDescription, sClassFeatureOriginalDescription)
	local tCurrentFeatures = DB.getChildren(rAdd.nodeChar, "specialabilitylist");
	if sClassFeatureName == "Monastic Tradition" then
		-- Add the feature and choose between all of the monk monastic traditions
		local rCreatedIDChildNode = DB.createChild(rAdd.nodeChar.getPath("specialabilitylist"));
		DB.setValue(rCreatedIDChildNode, "shortcut", "windowreference");
		DB.setValue(rCreatedIDChildNode, "value", "string", sClassFeatureName);
		DB.setValue(rCreatedIDChildNode, "description", "string", sClassFeatureFilteredDescription);
		displayClassFeatureSelectionsDialog(rAdd, sClassFeatureOriginalDescription, sClassFeatureName);
	else
		local rCreatedIDChildNode = DB.createChild(rAdd.nodeChar.getPath("specialabilitylist"));
		DB.setValue(rCreatedIDChildNode, "shortcut", "windowreference");
		DB.setValue(rCreatedIDChildNode, "value", "string", sClassFeatureName);
		DB.setValue(rCreatedIDChildNode, "description", "string", sClassFeatureFilteredDescription);
		ChatManager.SystemMessageResource("char_abilities_message_classfeatureadd", sClassFeatureName, rAdd.sCharName);
	end
end


-------------------------------------------
----- PSION Class Features ----
-------------------------------------------
function addPsionFeatures(sClassName, rAdd, sClassFeatureName, sClassFeatureFilteredDescription, sClassFeatureOriginalDescription)
	local tCurrentFeatures = DB.getChildren(rAdd.nodeChar, "specialabilitylist");
	if sClassFeatureName == "Discipline Focus" then
		-- Add the feature and choose between all of the discipline foci
		local rCreatedIDChildNode = DB.createChild(rAdd.nodeChar.getPath("specialabilitylist"));
		DB.setValue(rCreatedIDChildNode, "shortcut", "windowreference");
		DB.setValue(rCreatedIDChildNode, "value", "string", sClassFeatureName);
		DB.setValue(rCreatedIDChildNode, "description", "string", sClassFeatureFilteredDescription);
		displayClassFeatureSelectionsDialog(rAdd, sClassFeatureOriginalDescription, sClassFeatureName);
	else
		local rCreatedIDChildNode = DB.createChild(rAdd.nodeChar.getPath("specialabilitylist"));
		DB.setValue(rCreatedIDChildNode, "shortcut", "windowreference");
		DB.setValue(rCreatedIDChildNode, "value", "string", sClassFeatureName);
		DB.setValue(rCreatedIDChildNode, "description", "string", sClassFeatureFilteredDescription);
		ChatManager.SystemMessageResource("char_abilities_message_classfeatureadd", sClassFeatureName, rAdd.sCharName);
	end
end


-------------------------------------------
----- RUNEPRIEST Class Features ----
-------------------------------------------
function addRunepriestFeatures(sClassName, rAdd, sClassFeatureName, sClassFeatureFilteredDescription, sClassFeatureOriginalDescription)
	local tCurrentFeatures = DB.getChildren(rAdd.nodeChar, "specialabilitylist");
	if sClassFeatureName == "Runic Artistry" then
		local rCreatedIDChildNode = DB.createChild(rAdd.nodeChar.getPath("specialabilitylist"));
		DB.setValue(rCreatedIDChildNode, "shortcut", "windowreference");
		DB.setValue(rCreatedIDChildNode, "value", "string", sClassFeatureName);
		DB.setValue(rCreatedIDChildNode, "description", "string", sClassFeatureFilteredDescription);
		displayClassFeatureSelectionsDialog(rAdd, sClassFeatureOriginalDescription, sClassFeatureName);
	elseif sClassFeatureName == "Rune Master" then
		-- Add the rune master feature, and its associated runes as separate features
		local rCreatedIDChildNode = DB.createChild(rAdd.nodeChar.getPath("specialabilitylist"));
		DB.setValue(rCreatedIDChildNode, "shortcut", "windowreference");
		DB.setValue(rCreatedIDChildNode, "value", "string", sClassFeatureName);
		DB.setValue(rCreatedIDChildNode, "description", "string", sClassFeatureFilteredDescription);		
		addRunePriestRunes(rAdd, sClassFeatureOriginalDescription);
	else
		local rCreatedIDChildNode = DB.createChild(rAdd.nodeChar.getPath("specialabilitylist"));
		DB.setValue(rCreatedIDChildNode, "shortcut", "windowreference");
		DB.setValue(rCreatedIDChildNode, "value", "string", sClassFeatureName);
		DB.setValue(rCreatedIDChildNode, "description", "string", sClassFeatureFilteredDescription);
		ChatManager.SystemMessageResource("char_abilities_message_classfeatureadd", sClassFeatureName, rAdd.sCharName);
	end
end
function addRunePriestRunes(rAdd, sClassFeatureOriginalDescription)
	--Adds the Rune of Destruction and Rune of Protection
	local sPattern = '<link class="powerdesc" recordname="reference.features.(%w+)@([%w%s]+)">';
	local sFeaturesLink = string.gmatch(sClassFeatureOriginalDescription, sPattern);
	for w, v in sFeaturesLink do
		local rCreatedIDChildNode = DB.createChild(rAdd.nodeChar.getPath("specialabilitylist"));
		sPattern = "reference.features." .. w .. "@" .. v;
		DB.setValue(rCreatedIDChildNode, "shortcut", "windowreference", "powerdesc", sPattern);
		local sFeatureName = DB.getText(DB.getPath(sPattern, "name"));
		DB.setValue(rCreatedIDChildNode, "value", "string", sFeatureName);
	end
end


-------------------------------------------
----- SEEKER Class Features ----
-------------------------------------------
function addSeekerFeatures(sClassName, rAdd, sClassFeatureName, sClassFeatureFilteredDescription, sClassFeatureOriginalDescription)
	local tCurrentFeatures = DB.getChildren(rAdd.nodeChar, "specialabilitylist");
	if sClassFeatureName == "Seeker's Bond" then
		-- Add the feature and choose between all of the seeker's bonds
		local seekersBondText = string.match(sClassFeatureOriginalDescription, "(.+)<p>Seeker Overview</p>")
		local rCreatedIDChildNode = DB.createChild(rAdd.nodeChar.getPath("specialabilitylist"));
		DB.setValue(rCreatedIDChildNode, "shortcut", "windowreference");
		DB.setValue(rCreatedIDChildNode, "value", "string", sClassFeatureName);
		DB.setValue(rCreatedIDChildNode, "description", "string", removeLinkLists(convertHTMLTable(seekersBondText)));
		displayClassFeatureSelectionsDialog(rAdd, sClassFeatureOriginalDescription, sClassFeatureName);		
	else
		local rCreatedIDChildNode = DB.createChild(rAdd.nodeChar.getPath("specialabilitylist"));
		DB.setValue(rCreatedIDChildNode, "shortcut", "windowreference");
		DB.setValue(rCreatedIDChildNode, "value", "string", sClassFeatureName);
		DB.setValue(rCreatedIDChildNode, "description", "string", sClassFeatureFilteredDescription);
		ChatManager.SystemMessageResource("char_abilities_message_classfeatureadd", sClassFeatureName, rAdd.sCharName);
	end
end



-------------------------------------------
----- ASSASSIN Class Features ----
-------------------------------------------
function addAssassinFeatures(sClassName, rAdd, sClassFeatureName, sClassFeatureFilteredDescription, sClassFeatureOriginalDescription)
	local tCurrentFeatures = DB.getChildren(rAdd.nodeChar, "specialabilitylist");
	if sClassFeatureName == "Guild Training" then
		local rCreatedIDChildNode = DB.createChild(rAdd.nodeChar.getPath("specialabilitylist"));
		DB.setValue(rCreatedIDChildNode, "shortcut", "windowreference");
		DB.setValue(rCreatedIDChildNode, "value", "string", sClassFeatureName);
		DB.setValue(rCreatedIDChildNode, "description", "string", sClassFeatureFilteredDescription);
		displayClassFeatureSelectionsDialog(rAdd, sClassFeatureOriginalDescription, sClassFeatureName);	
	else
		local rCreatedIDChildNode = DB.createChild(rAdd.nodeChar.getPath("specialabilitylist"));
		DB.setValue(rCreatedIDChildNode, "shortcut", "windowreference");
		DB.setValue(rCreatedIDChildNode, "value", "string", sClassFeatureName);
		DB.setValue(rCreatedIDChildNode, "description", "string", sClassFeatureFilteredDescription);
		ChatManager.SystemMessageResource("char_abilities_message_classfeatureadd", sClassFeatureName, rAdd.sCharName);
	end
end



-------------------------------------------
----- ARTIFICER Class Features ----
-------------------------------------------
function addArtificerFeatures(sClassName, rAdd, sClassFeatureName, sClassFeatureFilteredDescription, sClassFeatureOriginalDescription)
	local tCurrentFeatures = DB.getChildren(rAdd.nodeChar, "specialabilitylist");
	if sClassFeatureName == "Arcane Empowerment" then
		local rCreatedIDChildNode = DB.createChild(rAdd.nodeChar.getPath("specialabilitylist"));
		DB.setValue(rCreatedIDChildNode, "shortcut", "windowreference");
		DB.setValue(rCreatedIDChildNode, "value", "string", sClassFeatureName);
		DB.setValue(rCreatedIDChildNode, "description", "string", removeLinkLists(sClassFeatureOriginalDescription));
	elseif sClassFeatureName == "Healing Infusion" then
		local rCreatedIDChildNode = DB.createChild(rAdd.nodeChar.getPath("specialabilitylist"));
		DB.setValue(rCreatedIDChildNode, "shortcut", "windowreference");
		DB.setValue(rCreatedIDChildNode, "value", "string", sClassFeatureName);
		DB.setValue(rCreatedIDChildNode, "description", "string", removeLinkLists(sClassFeatureOriginalDescription));		
		displayArtificerHealingInfusionDialog(rAdd);
	else
		local rCreatedIDChildNode = DB.createChild(rAdd.nodeChar.getPath("specialabilitylist"));
		DB.setValue(rCreatedIDChildNode, "shortcut", "windowreference");
		DB.setValue(rCreatedIDChildNode, "value", "string", sClassFeatureName);
		DB.setValue(rCreatedIDChildNode, "description", "string", sClassFeatureFilteredDescription);
		ChatManager.SystemMessageResource("char_abilities_message_classfeatureadd", sClassFeatureName, rAdd.sCharName);
	end
end
function displayArtificerHealingInfusionDialog(rAdd)
	local tOptions = {}
	local tHealingInfusionNames = {};
	tHealingInfusionNames[1] = "Healing Infusion: Resistive Formula";
	tHealingInfusionNames[2] = "Healing Infusion: Shielding Elixir";
	--Display links to the selections
	for x,y in pairs(tHealingInfusionNames) do
		local sClassFeatureName = y;
		local sDBReferenceFeatureName = sClassFeatureName:lower():gsub(" ", "");
		local sLinkClass = "powerdesc";
		local sNodePath = DB.getPath("reference.powers@4E PC Options", sDBReferenceFeatureName);
		table.insert(tOptions, { text = sClassFeatureName, linkclass = sLinkClass, linkrecord = sNodePath, });
	end

	--Display a pop-up where we either choose Resistive Formula or Shielding Elixer healing infusion
	local tDialogData = {
		title = Interface.getString("char_build_title_addartificerhealinginfusion"),
		msg = Interface.getString("char_build_message_addartificerhealinginfusion"),
		options = tOptions,
		min = 1,
		max = 1,
		callback = CharClassFeatureDescManager.callbackResolveArtificerHealingInfusion,
		custom = rAdd,
	};
	DialogManager.requestSelectionDialog(tDialogData);
end
function callbackResolveArtificerHealingInfusion(tSelection, rAdd, tSelectionLinks)
	if not tSelectionLinks then
		ChatManager.SystemMessageResource("char_error_addclasssfeature");
		return;
	end
	if not tSelection then
		ChatManager.SystemMessageResource("char_error_addclasssfeature");
		return;
	end
	local tCurrentFeatures = DB.getChildren(rAdd.nodeChar, "specialabilitylist");
	local isHasDefaultHealingInfusion = false;
	local isHasSelectedHealingInfusion = false;
	if #tSelection == 1 then
		local sHealingInfusionTitleName = tSelection[1];
		for x,y in pairs(tCurrentFeatures) do
			if DB.getText(DB.getPath(y, "value")) == sHealingInfusionTitleName then
				isHasSelectedHealingInfusion = true;
			end
		end
		if not isHasSelectedHealingInfusion then
			local tHealingInfusionNameSplit =  StringManager.split(tSelection[1], ';', true);
			local sHealingInfusionName = '';
			if #tHealingInfusionNameSplit > 1 then
				sHealingInfusionName = tHealingInfusionNameSplit[2];
			end
			local rCreatedIDChildNode = DB.createChild(rAdd.nodeChar.getPath("specialabilitylist"));
			DB.setValue(rCreatedIDChildNode, "shortcut", "windowreference");
			DB.setValue(rCreatedIDChildNode, "value", "string", sHealingInfusionTitleName);
			DB.setValue(rCreatedIDChildNode, "description", "string", "You gain the " .. sHealingInfusionTitleName .. " healing infusion power. You can create up to two healing infusions that last until your next extended rest each extended rest.");
		end
	end
	local sDefaultHealingInfusionTitleName = "Healing Infusion: Curative Admixture";
	for x,y in pairs(tCurrentFeatures) do
		if DB.getText(DB.getPath(y, "value")) == sDefaultHealingInfusionTitleName then
			isHasDefaultHealingInfusion = true;
		end
	end
	if not isHasDefaultHealingInfusion then
		local rCreatedIDChildNode = DB.createChild(rAdd.nodeChar.getPath("specialabilitylist"));
		DB.setValue(rCreatedIDChildNode, "shortcut", "windowreference");
		DB.setValue(rCreatedIDChildNode, "value", "string", sDefaultHealingInfusionTitleName);
		DB.setValue(rCreatedIDChildNode, "description", "string", "You gain the " .. sDefaultHealingInfusionTitleName .. " healing infusion power. You can create up to two healing infusions that last until your next extended rest each extended rest.");
	end
end


-------------------------------------------
----- SWORDMAGE Class Features ----
-------------------------------------------
function addSwordmageFeatures(sClassName, rAdd, sClassFeatureName, sClassFeatureFilteredDescription, sClassFeatureOriginalDescription)
	local tCurrentFeatures = DB.getChildren(rAdd.nodeChar, "specialabilitylist");
	if sClassFeatureName == "Swordmage Aegis" then
		local rCreatedIDChildNode = DB.createChild(rAdd.nodeChar.getPath("specialabilitylist"));
		DB.setValue(rCreatedIDChildNode, "shortcut", "windowreference");
		DB.setValue(rCreatedIDChildNode, "value", "string", sClassFeatureName);
		DB.setValue(rCreatedIDChildNode, "description", "string", removeLinkLists(sClassFeatureOriginalDescription));
		displayClassFeatureSelectionsDialog(rAdd, sClassFeatureOriginalDescription, sClassFeatureName);
	else
		local rCreatedIDChildNode = DB.createChild(rAdd.nodeChar.getPath("specialabilitylist"));
		DB.setValue(rCreatedIDChildNode, "shortcut", "windowreference");
		DB.setValue(rCreatedIDChildNode, "value", "string", sClassFeatureName);
		DB.setValue(rCreatedIDChildNode, "description", "string", sClassFeatureFilteredDescription);
		ChatManager.SystemMessageResource("char_abilities_message_classfeatureadd", sClassFeatureName, rAdd.sCharName);
	end
end


-------------------------------------------
----- CLERIC (WARPRIEST) Class Features ----
-------------------------------------------
function addClericWarpriestPreFeatures(sClassName, rAdd, sDescriptionText, tClassFeatures)
	--First, see if you have a domain already selected. If you don't, select one, then go through the rest of the features.
	local tCurrentFeatures = DB.getChildren(rAdd.nodeChar, "specialabilitylist");
	local sAlreadyTakenDomain = nil;
	local tDomainNames = { "Corellon", "Death", "Domination", "Earth", "Oghma", "Selune", "Storm", "Sun", "Torm" };
	for _, featureNode in pairs(tCurrentFeatures) do
		for x,domainName in ipairs(tDomainNames) do
			local sFeatureName = DB.getText(DB.getPath(featureNode, "value"));
			if sFeatureName then
				if string.find(sFeatureName, domainName) then
					sAlreadyTakenDomain = domainName;
					break;
				end
			end
		end
	end
	if not sAlreadyTakenDomain or sAlreadyTakenDomain == "" then
		--Display a pop-up where we choose from the Warpriest domains
		local tOptions = {}
		tOptions[1] = "Corellon";
		tOptions[2] = "Death";
		tOptions[3] = "Domination";
		tOptions[4] = "Earth";
		tOptions[5] = "Oghma";
		tOptions[6] = "Selune";
		tOptions[7] = "Storm";
		tOptions[8] = "Sun";
		tOptions[9] = "Torm";
		local tDialogData = {
			title = Interface.getString("char_build_title_addclericdomain"),
			msg = Interface.getString("char_build_message_addclericdomains"),
			options = tOptions,
			min = 1,
			max = 1,
			callback = CharClassFeatureDescManager.callbackResolveClericWarpriestPreFeatureSelection,
			custom = { sClassName=sClassName, rAdd=rAdd, sDescriptionText=sDescriptionText, tClassFeatures=tClassFeatures },
		};
		DialogManager.requestSelectionDialog(tDialogData);
	end
end
function callbackResolveClericWarpriestPreFeatureSelection(tSelection, tData)
	if not tSelection and #tSelection == 1 then
		ChatManager.SystemMessageResource("char_error_addclasssfeature");
		return;
	end

	local sDomainDescription = "You have selected the " .. tSelection[1] .. " domain.";
	local rCreatedIDChildNode = DB.createChild(tData.rAdd.nodeChar.getPath("specialabilitylist"));
	DB.setValue(rCreatedIDChildNode, "shortcut", "windowreference");
	DB.setValue(rCreatedIDChildNode, "value", "string", tSelection[1] .. " Domain");
	DB.setValue(rCreatedIDChildNode, "description", "string", sDomainDescription);

	local tCurrentFeatures = DB.getChildren(tData.rAdd.nodeChar, "specialabilitylist");
	for w,v in pairs(tData.tClassFeatures) do
		local sClassFeatureDescriptionPattern = '';
		if w < #tData.tClassFeatures then
			sClassFeatureDescriptionPattern = "<p>%s*<b>%s*" .. v:gsub("(%a)([%w_']*)", titleCase) .. "%s*</b></p>%s*(.-)<p><b>";
		elseif w == #tData.tClassFeatures then
			-- On the last feature entry, first try reading to the end of the description we're given
			sClassFeatureDescriptionPattern = "<p>%s*<b>%s*" .. v:gsub("(%a)([%w_']*)", titleCase) .. "%s*</b></p>%s*(.+)";
		end
		sClassFeatureSpecificDescriptionText = string.match(tData.sDescriptionText, sClassFeatureDescriptionPattern);
		if sClassFeatureSpecificDescriptionText then
			sClassFeatureFilteredDescriptionText = removeLinkLists(sClassFeatureSpecificDescriptionText);
		end
		local isFeatureInList = false;
		for _, featureNode in pairs(tCurrentFeatures) do
			if DB.getText(DB.getPath(featureNode, "value")) == v then
				isFeatureInList = true;
				break;
			end
		end
		if isFeatureInList == false then
			CharClassFeatureDescManager.addClassSpecificFeatures(tData.sClassName, tData.rAdd, v, sClassFeatureFilteredDescriptionText, sClassFeatureSpecificDescriptionText);
		end
	end
end

function addClericWarpriestFeatures(sClassName, rAdd, sClassFeatureName, sClassFeatureFilteredDescription, sClassFeatureOriginalDescription, nLevel, sFullDescriptionText)
	local tCurrentFeatures = DB.getChildren(rAdd.nodeChar, "specialabilitylist");

	if sClassFeatureName == "Channel Divinity Powers" then
		--Add the feature, but if you have also already added a domain, narrow domain and channel divinity features
		addBasicClassFeature(rAdd, sClassFeatureName, sClassFeatureFilteredDescription);
		displayClericWarpriestDomainDialog(sClassName, rAdd, sClassFeatureOriginalDescription, sClassFeatureName);
	elseif sClassFeatureName == "Domain Features" then
		--Add the feature, but if you have also already added a domain, narrow domain and channel divinity features
		addBasicClassFeature(rAdd, sClassFeatureName, sClassFeatureFilteredDescription);
		displayClericWarpriestDomainDialog(sClassName, rAdd, sClassFeatureOriginalDescription, sClassFeatureName);
	elseif string.find(sClassFeatureName:lower(), "domain") then
		addBasicClassFeature(rAdd, sClassFeatureName, sClassFeatureFilteredDescription);
		addPreChosenClassFeature(rAdd, sClassFeatureOriginalDescription, sClassFeatureName);
	else
		addDefaultClassFeature(sClassName, rAdd, sClassFeatureName, sClassFeatureFilteredDescription, sClassFeatureOriginalDescription);
	end

	--Replace older power at certain levels
	if string.find(sClassFeatureName:lower(), "level %d+ warpriest daily power") or
		string.find(sClassFeatureName:lower(), "level %d+ domain encounter power") or
		string.find(sClassFeatureName:lower(), "level %d+ warpriest utility power") then
			local sAEDUType = "";
			if string.match(sClassFeatureName, "Daily") then
				sAEDUType = "Daily";
			elseif string.match(sClassFeatureName, "Encounter") then
				sAEDUType = "Encounter";
			end
			CharClassFeatureDescManager.replaceOlderPower(rAdd, sClassName, sAEDUType, nLevel);
	end
end
function displayClericWarpriestDomainDialog(sClassName, rAdd, sClassFeatureOriginalDescription, sClassFeatureName)
	--Find out if you have a domain feature already, and if so, add the domain feature already
	local tCurrentFeatures = DB.getChildren(rAdd.nodeChar, "specialabilitylist");
	local sAlreadyTakenDomain = "";
	local tDomainNames = { "Corellon", "Death", "Domination", "Earth", "Oghma", "Selune", "Storm", "Sun", "Torm" };
	for _, featureNode in pairs(tCurrentFeatures) do
		for x,domainName in ipairs(tDomainNames) do
			local sFeatureName = DB.getText(DB.getPath(featureNode, "value"));
			if sFeatureName then
				if string.find(sFeatureName, domainName) then
					sAlreadyTakenDomain = domainName;
					break;
				end
			end
		end
	end

	if sAlreadyTakenDomain and sAlreadyTakenDomain ~= "" then
		if sClassFeatureName == "Domain Features" and sClassFeatureOriginalDescription then
			addClericWarpriestDomain(rAdd, sClassFeatureOriginalDescription, sAlreadyTakenDomain);
		elseif sClassFeatureName == "Channel Divinity Powers" and sClassFeatureOriginalDescription then
			addClericWarpriestChannelDivinity(rAdd, sClassFeatureOriginalDescription, sAlreadyTakenDomain);
		end
	else
		--Display a pop-up where we choose from the Warpriest domains
		local tOptions = {}
		tOptions[1] = "Corellon";
		tOptions[2] = "Death";
		tOptions[3] = "Domination";
		tOptions[4] = "Earth";
		tOptions[5] = "Oghma";
		tOptions[6] = "Selune";
		tOptions[7] = "Storm";
		tOptions[8] = "Sun";
		tOptions[9] = "Torm";
		local tDialogData = {
			title = Interface.getString("char_build_title_addclericdomain"),
			msg = Interface.getString("char_build_message_addclericdomains"),
			options = tOptions,
			min = 1,
			max = 1,
			callback = CharClassFeatureDescManager.callbackResolveClericWarpriestDomainSelection,
			custom = { rAdd=rAdd, sClassFeatureOriginalDescription=sClassFeatureOriginalDescription, sClassFeatureName=sClassFeatureName },
		};
		DialogManager.requestSelectionDialog(tDialogData);
	end
end
function callbackResolveClericWarpriestDomainSelection(tSelection, tData)
	if not tSelection and #tSelection == 1 then
		ChatManager.SystemMessageResource("char_error_addclasssfeature");
		return;
	end
	if #tSelection == 1 then
		if tData.sClassFeatureName == "Domain Features" and tData.sClassFeatureOriginalDescription then
			addClericWarpriestDomain(tData.rAdd, tData.sClassFeatureOriginalDescription, tSelection[1]);
		elseif tData.sClassFeatureName == "Channel Divinity Powers" and tData.sClassFeatureOriginalDescription then
			addClericWarpriestChannelDivinity(tData.rAdd, tData.sClassFeatureOriginalDescription, tSelection[1]);
		else
			local sDomainDescription = "You have selected the " .. tSelection[1] .. " domain.";
			local rCreatedIDChildNode = DB.createChild(tData.rAdd.nodeChar.getPath("specialabilitylist"));
			DB.setValue(rCreatedIDChildNode, "shortcut", "windowreference");
			DB.setValue(rCreatedIDChildNode, "value", "string", tSelection[1] .. " Domain");
			DB.setValue(rCreatedIDChildNode, "description", "string", sDomainDescription);
		end
	end
end
function addClericWarpriestDomain(rAdd, sClassFeatureOriginalDescription, sSelectedDomain)
	local tCurrentFeatures = DB.getChildren(rAdd.nodeChar, "specialabilitylist");
	local isNotInList = false;
	for _, featureNode in pairs(tCurrentFeatures) do
		if DB.getText(DB.getPath(featureNode, "value")) == sSelectedDomain .. " Domain Features and Powers" then
			isNotInList = true;
			break;
		end
	end
	if not isNotInList then
		local sPattern = '<link class="powerdesc" recordname="reference.features.(%w+)@([%w%s]+)">';
		local sFeaturesLink = string.gmatch(sClassFeatureOriginalDescription, sPattern);
		for w,v in sFeaturesLink do
			local sPattern = "reference.features." .. w .. "@" .. v;
			local sClassFeatureName = DB.getText(DB.getPath(sPattern, "name"));
			local sClassFeatureDescription = DB.getText(DB.getPath(sPattern, "description"));
			if sClassFeatureName == sSelectedDomain .. " Domain Features and Powers" or 
			(sSelectedDomain == "Sun" and sClassFeatureName == sSelectedDomain .. " Domain Features") then
				local rCreatedIDChildNode = DB.createChild(rAdd.nodeChar.getPath("specialabilitylist"));
				DB.setValue(rCreatedIDChildNode, "shortcut", "windowreference", "powerdesc", sPattern);
				DB.setValue(rCreatedIDChildNode, "value", "string", sClassFeatureName);
				--DB.setValue(rCreatedIDChildNode, "description", "string", sClassFeatureOriginalDescription);

				CharClassPowerManager.addAllPowersFromFeatureText(rAdd, sClassFeatureDescription, sClassFeatureOriginalDescription);
				ChatManager.SystemMessageResource("char_abilities_message_classfeatureadd", sClassFeatureName, rAdd.sCharName);
				break;
			end
		end
	end
end
function addClericWarpriestChannelDivinity(rAdd, sClassFeatureOriginalDescription, sSelectedDomain)
	local tCurrentFeatures = DB.getChildren(rAdd.nodeChar, "specialabilitylist");
	local isNotInList = false;
	for _, featureNode in pairs(tCurrentFeatures) do
		if DB.getText(DB.getPath(featureNode, "value")) == "Channel Divinity (" .. sSelectedDomain .. ")" then
			isNotInList = true;
			break;
		end
	end
	if not isNotInList then
		local sPattern = '<link class="powerdesc" recordname="reference.features.(%w+)@([%w%s]+)">';
		local sFeaturesLink = string.gmatch(sClassFeatureOriginalDescription, sPattern);
		for w,v in sFeaturesLink do
			local sPattern = "reference.features." .. w .. "@" .. v;
			local sClassFeatureName = DB.getText(DB.getPath(sPattern, "name"));
			local sClassFeatureDescription = DB.getText(DB.getPath(sPattern, "description"));
			if sClassFeatureName == "Channel Divinity (" .. sSelectedDomain .. ")" then
				local rCreatedIDChildNode = DB.createChild(rAdd.nodeChar.getPath("specialabilitylist"));
				DB.setValue(rCreatedIDChildNode, "shortcut", "windowreference", "powerdesc", sPattern);
				DB.setValue(rCreatedIDChildNode, "value", "string", sClassFeatureName);
				--DB.setValue(rCreatedIDChildNode, "description", "string", sClassFeatureOriginalDescription);

				CharClassPowerManager.addAllPowersFromFeatureText(rAdd, sClassFeatureDescription, sClassFeatureOriginalDescription);
				ChatManager.SystemMessageResource("char_abilities_message_classfeatureadd", sClassFeatureName, rAdd.sCharName);
				break;
			end
		end
	end
end


-------------------------------------------
----- FIGHTER (KNIGHT) Class Features ----
-------------------------------------------
function addFighterKnightFeatures(sClassName, rAdd, sClassFeatureName, sClassFeatureFilteredDescription, sClassFeatureOriginalDescription)
	local tCurrentFeatures = DB.getChildren(rAdd.nodeChar, "specialabilitylist");
	if sClassFeatureName == "Battle Guardian" then
		local sCharRace = DB.getValue(rAdd.nodeChar, "race", "");
		if sCharRace and sCharRace:upper() == "ELADRIN" then
			displayFighterKnightFeywildGuardianDialog(rAdd, sClassFeatureOriginalDescription);
		else
			local rCreatedIDChildNode = DB.createChild(rAdd.nodeChar.getPath("specialabilitylist"));
			DB.setValue(rCreatedIDChildNode, "shortcut", "windowreference");
			DB.setValue(rCreatedIDChildNode, "value", "string", sClassFeatureName);
			DB.setValue(rCreatedIDChildNode, "description", "string", sClassFeatureFilteredDescription);
			ChatManager.SystemMessageResource("char_abilities_message_classfeatureadd", sClassFeatureName, rAdd.sCharName);
		end
	else
		if string.find(sClassFeatureOriginalDescription, "You gain one of the benefits of your choice") then
			displayClassFeatureSelectionsDialog(rAdd, sClassFeatureOriginalDescription, sClassFeatureName);
		else
			addDefaultClassFeature(sClassName,rAdd, sClassFeatureName, sClassFeatureFilteredDescription, sClassFeatureOriginalDescription);
		end
	end
end
function displayFighterKnightFeywildGuardianDialog(rAdd, sClassFeatureOriginalDescription)
	--Display a pop-up where we either choose from the Battle Guardian or Feywild Guardian
	local tOptions = {}
	tOptions[1] = "Battle Guardian";
	tOptions[2] = "Feywild Guardian";
	local tDialogData = {
		title = Interface.getString("char_build_title_addfighterknightbattleguardian"),
		msg = Interface.getString("char_build_message_addfighterknightbattleguardian"),
		options = tOptions,
		min = 1,
		max = 1,
		callback = CharClassFeatureDescManager.callbackResolveFighterKnightBattleGuardianSelection,
		custom = { rAdd=rAdd, sClassFeatureOriginalDescription=sClassFeatureOriginalDescription },
	};
	DialogManager.requestSelectionDialog(tDialogData);
end
function callbackResolveFighterKnightBattleGuardianSelection(tSelection, tData)
	if not tSelection and #tSelection == 1 then
		ChatManager.SystemMessageResource("char_error_addclasssfeature");
		return;
	end
	if #tSelection == 1 then
		local tCurrentFeatures = DB.getChildren(tData.rAdd.nodeChar, "specialabilitylist");
		--Clear all existing Battle Guardian nodes, then add them
		for _, featureNode in pairs(tCurrentFeatures) do
			if (DB.getText(DB.getPath(featureNode, "value")) == "Battle Guardian")
				or (DB.getText(DB.getPath(featureNode, "value")) == "Feywild Guardian") then
				DB.deleteNode(featureNode);
			end
		end
		local sClassFeatureName = tSelection[1];
		local sClassFeatureOriginalDescription =  tData.sClassFeatureOriginalDescription;
		if sClassFeatureName == "Battle Guardian" then
			sClassFeatureOriginalDescription = string.match(sClassFeatureOriginalDescription, "(.-)<p><b>Feywild Guardian</b></p>");
		elseif sClassFeatureName == "Feywild Guardian" then
			sClassFeatureOriginalDescription = string.match(sClassFeatureOriginalDescription, "<p><b>Feywild Guardian</b></p>(.+)");
			--sClassFeatureOriginalDescription = sClassFeatureOriginalDescription .. "Eladrin can choose to gain the Feywild Guardian power in place of Battle Guardian.\n\n - Feywild Guardian";
		end
		local sClassFeatureDescription = removeLinkLists(tData.sClassFeatureOriginalDescription);
		local rCreatedIDChildNode = DB.createChild(tData.rAdd.nodeChar.getPath("specialabilitylist"));
		DB.setValue(rCreatedIDChildNode, "shortcut", "windowreference");
		DB.setValue(rCreatedIDChildNode, "value", "string", sClassFeatureName);
		DB.setValue(rCreatedIDChildNode, "description", "string", sClassFeatureDescription);
		ChatManager.SystemMessageResource("char_abilities_message_classfeatureadd", sClassFeatureName, tData.rAdd.sCharName);

		CharClassPowerManager.addAllFeaturePowers(tData.rAdd, sClassFeatureOriginalDescription);
	end
end


-------------------------------------------
----- WIZARD (MAGE) Class Features ----
-------------------------------------------
function addWizardMageFeatures(sClassName, rAdd, sClassFeatureName, sClassFeatureFilteredDescription, sClassFeatureOriginalDescription)
	local tCurrentFeatures = DB.getChildren(rAdd.nodeChar, "specialabilitylist");
	if sClassFeatureName == "Level 1 Apprentice Mage" then
		local rCreatedIDChildNode = DB.createChild(rAdd.nodeChar.getPath("specialabilitylist"));
		DB.setValue(rCreatedIDChildNode, "shortcut", "windowreference");
		DB.setValue(rCreatedIDChildNode, "value", "string", sClassFeatureName);
		DB.setValue(rCreatedIDChildNode, "description", "string", sClassFeatureOriginalDescription);
		displayClassFeatureSelectionsDialog(rAdd, sClassFeatureOriginalDescription, sClassFeatureName);
	elseif sClassFeatureName == "Level 4 Apprentice Mage" then
		--Brings up same choice as Level 1 Apprentice Mage except for the alreadychosen spell school
		--Adds (secondary) to the end of the name, though
		local rCreatedIDChildNode = DB.createChild(rAdd.nodeChar.getPath("specialabilitylist"));
		DB.setValue(rCreatedIDChildNode, "shortcut", "windowreference");
		DB.setValue(rCreatedIDChildNode, "value", "string", sClassFeatureName);
		DB.setValue(rCreatedIDChildNode, "description", "string", removeLinkLists(sClassFeatureOriginalDescription));
		local rLevelOneApprenticeMageFeatureNode = nil;
		for i,node in pairs(tCurrentFeatures) do
			if DB.getText(node, "value") == "Level 1 Apprentice Mage" then
				rLevelOneApprenticeMageFeatureNode = node;
				break;
			end
		end
		local sLevelOneApprenticeMageFeatureText = DB.getText(rLevelOneApprenticeMageFeatureNode, "description");
		local sChosenApprenticeSchoolText = getChosenApprenticeSchool(rAdd);
		displayLevelFourSelectionsDialog(rAdd, sClassFeatureOriginalDescription, sClassFeatureName, sLevelOneApprenticeMageFeatureText, sChosenApprenticeSchoolText);
	elseif string.find(sClassFeatureName, "Expert Mage") then
		local rCreatedIDChildNode = DB.createChild(rAdd.nodeChar.getPath("specialabilitylist"));
		DB.setValue(rCreatedIDChildNode, "shortcut", "windowreference");
		DB.setValue(rCreatedIDChildNode, "value", "string", sClassFeatureName);
		DB.setValue(rCreatedIDChildNode, "description", "string", sClassFeatureOriginalDescription);
		local rLeveFiveExpertMageFeatureNode = nil;
		local sOriginalExpertMageDescription = nil;
		for i,node in pairs(tCurrentFeatures) do
			if DB.getText(node, "value") == "Expert Mage" then
				rLeveFiveExpertMageFeatureNode = node;
				break;
			end
		end
		if rLeveFiveExpertMageFeatureNode then
			sOriginalExpertMageDescription = DB.getText(rLeveFiveExpertMageFeatureNode, "description");
		end
		displayExpertMageDialog(rAdd, sClassFeatureOriginalDescription, sOriginalExpertMageDescription);
	else
		local rCreatedIDChildNode = DB.createChild(rAdd.nodeChar.getPath("specialabilitylist"));
		DB.setValue(rCreatedIDChildNode, "shortcut", "windowreference");
		DB.setValue(rCreatedIDChildNode, "value", "string", sClassFeatureName);
		DB.setValue(rCreatedIDChildNode, "description", "string", sClassFeatureFilteredDescription);
		ChatManager.SystemMessageResource("char_abilities_message_classfeatureadd", sClassFeatureName, rAdd.sCharName);
	end
end
function getChosenApprenticeSchool(rAdd)
	local tCurrentFeatures = DB.getChildren(rAdd.nodeChar, "specialabilitylist");
	for _, featureNode in pairs(tCurrentFeatures) do
		local sFeatureName = DB.getText(DB.getPath(featureNode, "value"));
		if string.match(sFeatureName, "(%w+) Apprentice") then
			return string.match(sFeatureName, "(%w+) Apprentice");
		end
	end
end
function displayLevelFourSelectionsDialog(rAdd, sClassFeatureOriginalDescription, sClassFeatureName, LevelOneApprenticeMageFeatureText, ChosenApprenticeSchool)
	local tClassFeatureOptions = {};
	local tOptions = {};
	local nMaxSelections = 1;
	--Display information on the selections in chat
	local sPattern = '<link class="powerdesc" recordname="reference.features.(%w+)@([%w%s]+)">';
	local sFeaturesLink = string.gmatch(LevelOneApprenticeMageFeatureText, sPattern);
	local nOptionsCount = 1;
	for w,v in sFeaturesLink do
		local sPattern = "reference.features." .. w .. "@" .. v;
		local sClassFeatureName = DB.getText(DB.getPath(sPattern, "name"));
		if sClassFeatureName ~= ChosenApprenticeSchool .. " Apprentice" then
			local sClassFeatureDescription = DB.getText(DB.getPath(sPattern, "description"));
			tClassFeatureOptions[sClassFeatureName] = DB.getPath(sPattern);
			table.insert(tOptions, { text = sClassFeatureName .. " (Secondary)", linkclass = "powerdesc", linkrecord = DB.getPath(sPattern), });
			nOptionsCount = nOptionsCount + 1;
		end
	end
	local tDialogData = {
		title = sClassFeatureName,
		msg = removeLinkLists(sClassFeatureOriginalDescription),
		options = tOptions,
		min = nMaxSelections,
		max = nMaxSelections,
		callback = CharClassFeatureDescManager.callbackResolveLevelFourApprenticeMageDialogSelection,
		custom = { rAdd = rAdd, tClassFeatureOptions = tClassFeatureOptions, nAddPowerMode=1, sParentClassFeatureOriginalDescription=LevelOneApprenticeMageFeatureText }, 
	};
	DialogManager.requestSelectionDialog(tDialogData);	
end
function callbackResolveLevelFourApprenticeMageDialogSelection(tSelection, tData, tSelectionLinks)
	if not tSelection or not tSelection[1] then
		ChatManager.SystemMessageResource("char_error_addclasssfeature");
		return;
	end
	if not tSelectionLinks then
		ChatManager.SystemMessageResource("char_error_addclasssfeature");
		return;
	end
	local tCurrentFeatures = DB.getChildren(tData.rAdd.nodeChar, "specialabilitylist");

	for i, selectedFeature in ipairs(tSelectionLinks) do
		local sFeatureLink = selectedFeature.linkrecord;
		local sFeatureName = tSelection[i];
		local rCreatedIDChildNode = DB.createChild(tData.rAdd.nodeChar.getPath("specialabilitylist"));
		DB.setValue(rCreatedIDChildNode, "shortcut", "windowreference", "powerdesc", sFeatureLink);
		DB.setValue(rCreatedIDChildNode, "value", "string", sFeatureName);
		--DB.setValue(rCreatedIDChildNode, "description", "string", sClassFeatureOriginalDescription);
		ChatManager.SystemMessageResource("char_abilities_message_classfeatureadd", sFeatureName, tData.rAdd.sCharName);

		-- if tData.nAddPowerMode and tData.nAddPowerMode > 0 then
		-- 	if tData.nAddPowerMode == 1 then
		-- 		local sClassFeatureName = DB.getText(DB.getPath(sSelectedClassFeatureSelectionsDBReference, "name"));
		-- 		local sClassSubFeatureDescription = DB.getText(DB.getPath(sSelectedClassFeatureSelectionsDBReference, "description"));
		-- 		local sParentClassFeatureOriginalDescription = tData.sParentClassFeatureOriginalDescription;
		-- 		if tData.rAdd and sClassSubFeatureDescription and sParentClassFeatureOriginalDescription then
		-- 			CharClassPowerManager.addAllPowersFromFeatureText(tData.rAdd, sClassSubFeatureDescription, sParentClassFeatureOriginalDescription)
		-- 		end
		-- 	end
		-- end
	end
	-- local sClassFeatureName = tSelection[1];
	-- local sClassFeatureLink = tSelectionLinks[];

	-- local sSelectedClassFeatureSelectionsDBReference;
	-- for _,selectedSkill in ipairs(tSelection) do
	-- 	for _, featureNode in pairs(tCurrentFeatures) do
	-- 		if DB.getText(DB.getPath(featureNode, "value")) ~= selectedSkill then
	-- 			for x, y in pairs(tData.tClassFeatureOptions) do
	-- 				if DB.getText(DB.getPath(featureNode, "value")) == x then
	-- 					DB.deleteNode(featureNode);
	-- 					break;
	-- 				end
	-- 			end
	-- 		end
	-- 	end
	-- 	sSelectedClassFeatureSelectionsDBReference = tData.tClassFeatureOptions[selectedSkill];

	-- end
end
function displayExpertMageDialog(rAdd, sClassFeatureOriginalDescription, sOriginalExpertMageDescription)
	local tCurrentFeatures = DB.getChildren(rAdd.nodeChar, "specialabilitylist");
	if not sOriginalExpertMageDescription then
		sOriginalExpertMageDescription = sClassFeatureOriginalDescription;
	end

	-- Find the character's chosen apprentice schools from existing features
	local sPrimarySchool = nil;
	local sSecondarySchool = nil;
	-- If you already have the Expert Mage feature, then remove it from the dialogue choices
	local sExistingExpertMage = nil;
	for _, featureNode in pairs(tCurrentFeatures) do
		local sFeatureName = DB.getText(DB.getPath(featureNode, "value"));
		local school = string.match(sFeatureName, "^(%w+) Apprentice$");
		local expertMage = string.match(sFeatureName, "%w+ Expert");
		if school then
			sPrimarySchool = school;
		end
		school = string.match(sFeatureName, "^(%w+) Apprentice %(Secondary%)$");
		if school then
			sSecondarySchool = school;
		end
		if expertMage then
			sExistingExpertMage = expertMage;
		end
	end

	-- Parse the Expert Mage description to find all Expert sub-feature links
	local tExpertFeatureBySchool = {};
	local sPattern = '<link class="powerdesc" recordname="reference.features.(%w+)@([%w%s]+)">';
	for recordId, module in string.gmatch(sOriginalExpertMageDescription, sPattern) do
		local sDbPath = "reference.features." .. recordId .. "@" .. module;
		local sExpertFeatureName = DB.getText(DB.getPath(sDbPath, "name"));
		local expertSchool = string.match(sExpertFeatureName, "^(%w+) Expert");
		if expertSchool then
			tExpertFeatureBySchool[expertSchool] = { name = sExpertFeatureName, path = sDbPath };
		end
	end

	-- Build dialog options from the character's chosen schools, showing Expert feature names
	local tOptions = {};
	local tExpertFeatureOptions = {};
	if sPrimarySchool and tExpertFeatureBySchool[sPrimarySchool] and sExistingExpertMage ~= tExpertFeatureBySchool[sPrimarySchool].name then
		local tExpertInfo = tExpertFeatureBySchool[sPrimarySchool];
		table.insert(tOptions, { text = tExpertInfo.name, linkclass = "powerdesc", linkrecord = tExpertInfo.path });
		tExpertFeatureOptions[tExpertInfo.name] = tExpertInfo;
	end
	if sSecondarySchool and tExpertFeatureBySchool[sSecondarySchool] and sExistingExpertMage ~= tExpertFeatureBySchool[sSecondarySchool].name then
		local tExpertInfo = tExpertFeatureBySchool[sSecondarySchool];
		table.insert(tOptions, { text = tExpertInfo.name, linkclass = "powerdesc", linkrecord = tExpertInfo.path });
		tExpertFeatureOptions[tExpertInfo.name] = tExpertInfo;
	end

	local tDialogData = {
		title = Interface.getString("char_build_title_addexpertmage"),
		msg = Interface.getString("char_build_message_addexpertmage"),
		options = tOptions,
		min = 1,
		max = 1,
		callback = CharClassFeatureDescManager.callbackResolveExpertMageDialogSelection,
		custom = { rAdd = rAdd, tExpertFeatureOptions = tExpertFeatureOptions, sParentDescription = sClassFeatureOriginalDescription },
	};
	DialogManager.requestSelectionDialog(tDialogData);
end
function callbackResolveExpertMageDialogSelection(tSelection, tData, tSelectionLinks)
	if not tSelection or not tSelection[1] then
		ChatManager.SystemMessageResource("char_error_addclasssfeature");
		return;
	end
	if not tSelectionLinks then
		ChatManager.SystemMessageResource("char_error_addclasssfeature");
		return;
	end

	for i, selectedFeature in ipairs(tSelectionLinks) do
		local sExpertFeaturePath = selectedFeature.linkrecord;
		local sSelectedExpertName = tSelection[i];
		local tExpertInfo = tData.tExpertFeatureOptions[sSelectedExpertName];

		if tExpertInfo then
			local rCreatedIDChildNode = DB.createChild(tData.rAdd.nodeChar.getPath("specialabilitylist"));
			DB.setValue(rCreatedIDChildNode, "shortcut", "windowreference", "powerdesc", sExpertFeaturePath);
			DB.setValue(rCreatedIDChildNode, "value", "string", sSelectedExpertName);
			ChatManager.SystemMessageResource("char_abilities_message_classfeatureadd", sSelectedExpertName, tData.rAdd.sCharName);
		end
	end
end


-------------------------------------------
----- DRUID (SENTINEL) Class Features ----
-------------------------------------------
function addDruidSentinelPreFeatures(sClassName, rAdd, sDescriptionText, tClassFeatures, nLevel, sFullDescriptionText)
	--First, see if you have a season already selected. If you don't, select one, then go through the rest of the features.
	local tCurrentFeatures = DB.getChildren(rAdd.nodeChar, "specialabilitylist");
	local sAlreadyTakenSeason = nil;
	local tSeasonNames = { "Spring", "Summer", "Wastes" };
	for _, featureNode in pairs(tCurrentFeatures) do
		for x,seasonName in ipairs(tSeasonNames) do
			local sFeatureName = DB.getText(DB.getPath(featureNode, "value"));
			if sFeatureName then
				if string.find(sFeatureName, seasonName) then
					sAlreadyTakenSeason = seasonName;
					break;
				end
			end
		end
	end
	if not sAlreadyTakenSeason or sAlreadyTakenSeason == "" then
		--Display a pop-up where we choose from the Druid seasons
		local tOptions = {}
		tOptions[1] = "Spring";
		tOptions[2] = "Summer";
		tOptions[3] = "Wastes";
		local tDialogData = {
			title = Interface.getString("char_build_title_adddruidseason"),
			msg = Interface.getString("char_build_message_adddruidseason"),
			options = tOptions,
			min = 1,
			max = 1,
			callback = CharClassFeatureDescManager.callbackResolveDruidSentinelPreFeatureSelection,
			custom = { sClassName=sClassName, rAdd=rAdd, sDescriptionText=sDescriptionText, tClassFeatures=tClassFeatures, nLevel=nLevel, sFullDescriptionText=sFullDescriptionText },
		};
		DialogManager.requestSelectionDialog(tDialogData);
	end
end
function callbackResolveDruidSentinelPreFeatureSelection(tSelection, tData)
	if not tSelection and #tSelection == 1 then
		ChatManager.SystemMessageResource("char_error_addclasssfeature");
		return;
	end

	local sSeasonDescription = "You have selected the season of " .. tSelection[1] .. ".";
	addBasicClassFeature(tData.rAdd, "Season of " .. tSelection[1], sSeasonDescription);

	CharClassManager.addEssentialsClassFeatures(tData.rAdd, nil, tData.sFullDescriptionText, tData.sClassName, tData.nLevel, tData.sFullDescriptionText, true);
end

function addDruidSentinelFeatures(sClassName, rAdd, sClassFeatureName, sClassFeatureFilteredDescription, sClassFeatureOriginalDescription)
	Debug.console("Adding DRuid Sentinel normal features...");
	local tCurrentFeatures = DB.getChildren(rAdd.nodeChar, "specialabilitylist");

	if sClassFeatureName == "Acolyte of the Natural Cycle" then
		--Add the feature, but if you have also already added a season, narrow acolyte of the natural cycle and animal companion features
		addBasicClassFeature(rAdd, sClassFeatureName, sClassFeatureFilteredDescription);
		displayDruidSentinelSeasonDialog(sClassName, rAdd, sClassFeatureOriginalDescription, sClassFeatureName);
	elseif sClassFeatureName == "Animal Companion" then
		--Add the feature, but if you have also already added a season, narrow acolyte of the natural cycle and animal companion eatures
		addBasicClassFeature(rAdd, sClassFeatureName, sClassFeatureFilteredDescription);
		displayDruidSentinelSeasonDialog(sClassName, rAdd, sClassFeatureOriginalDescription, sClassFeatureName);
	elseif sClassFeatureName == "Druid Wilderness Knacks" then
		addBasicClassFeature(rAdd, sClassFeatureName, sClassFeatureFilteredDescription);
		displayClassFeatureSelectionsDialog(rAdd, sClassFeatureOriginalDescription, sClassFeatureName, 2);		
	else
		Debug.console("sClassFeatureName", sClassFeatureName);
		Debug.console("sClassFeatureOriginalDescription", sClassFeatureOriginalDescription);
		addDefaultClassFeature(sClassName,rAdd, sClassFeatureName, sClassFeatureFilteredDescription, sClassFeatureOriginalDescription);
	end
end
function displayDruidSentinelSeasonDialog(sClassName, rAdd, sClassFeatureOriginalDescription, sClassFeatureName)
	--Find out if you have a season feature already, and if so, add the season feature already
	local tCurrentFeatures = DB.getChildren(rAdd.nodeChar, "specialabilitylist");
	local sAlreadyTakenSeason = "";
	local tSeasonNames = { "Spring", "Summer", "Wastes" };
	for _, featureNode in pairs(tCurrentFeatures) do
		for i,seasonName in ipairs(tSeasonNames) do
			local sFeatureName = DB.getText(DB.getPath(featureNode, "value"));
			if sFeatureName then
				if string.find(sFeatureName, seasonName) then
					sAlreadyTakenSeason = seasonName;
					break;
				end
			end
		end
	end

	if sAlreadyTakenSeason and sAlreadyTakenSeason ~= "" then
		if sClassFeatureName == "Acolyte of the Natural Cycle" and sClassFeatureOriginalDescription then
			addDruidSentinelAcolyte(rAdd, sClassFeatureOriginalDescription, sAlreadyTakenSeason);
		elseif sClassFeatureName == "Animal Companion" and sClassFeatureOriginalDescription then
			addDruidSentinelAnimalCompanion(rAdd, sClassFeatureOriginalDescription, sAlreadyTakenSeason);
		end
	else
		--Display a pop-up where we choose from the Druid seasons
		local tOptions = {}
		tOptions[1] = "Spring";
		tOptions[2] = "Summer";
		tOptions[3] = "Wastes";
		local tDialogData = {
			title = Interface.getString("char_build_title_adddruidseason"),
			msg = Interface.getString("char_build_message_adddruidseason"),
			options = tOptions,
			min = 1,
			max = 1,
			callback = CharClassFeatureDescManager.callbackResolveClericWarpriestDomainSelection,
			custom = { rAdd=rAdd, sClassFeatureOriginalDescription=sClassFeatureOriginalDescription, sClassFeatureName=sClassFeatureName },
		};
		DialogManager.requestSelectionDialog(tDialogData);
	end
end
function callbackResolveDruidSentinelSeasonSelection(tSelection, tData)
	if not tSelection and #tSelection == 1 then
		ChatManager.SystemMessageResource("char_error_addclasssfeature");
		return;
	end
	if #tSelection == 1 then
		if tData.sClassFeatureName == "Acolyte of the Natural Cycle" and tData.sClassFeatureOriginalDescription then
			addDruidSentinelAcolyte(tData.rAdd, tData.sClassFeatureOriginalDescription, tSelection[1]);
		elseif tData.sClassFeatureName == "Animal Companion" and tData.sClassFeatureOriginalDescription then
			addDruidSentinelAnimalCompanion(tData.rAdd, tData.sClassFeatureOriginalDescription, tSelection[1]);
		else
			local sDomainDescription = "You have selected the " .. tSelection[1] .. " domain.";
			addBasicClassFeature(tData.rAdd, tSelection[1] .. " Domain", sDomainDescription);
		end
	end
end
function addDruidSentinelAcolyte(rAdd, sClassFeatureOriginalDescription, sSelectedSeason)
	local tCurrentFeatures = DB.getChildren(rAdd.nodeChar, "specialabilitylist");
	local isInList = false;
	for _, featureNode in pairs(tCurrentFeatures) do
		if DB.getText(DB.getPath(featureNode, "value")) == "Druid of " .. sSelectedSeason or
		 DB.getText(DB.getPath(featureNode, "value")) == "Druid of the " .. sSelectedSeason then
			isInList = true;
			break;
		end
	end
	if not isInList then
		local sPattern = '<link class="powerdesc" recordname="reference.features.(%w+)@([%w%s]+)">';
		local sFeaturesLink = string.gmatch(sClassFeatureOriginalDescription, sPattern);
		for w,v in sFeaturesLink do
			local sPattern = "reference.features." .. w .. "@" .. v;
			local sClassFeatureName = DB.getText(DB.getPath(sPattern, "name"));
			local sClassFeatureDescription = DB.getText(DB.getPath(sPattern, "description"));
			if sClassFeatureName == "Druid of " .. sSelectedSeason or sClassFeatureName == "Druid of the " .. sSelectedSeason then
				local sWindowLinkClass = "powerdesc";
				local sWindowLinkPath = sPattern;
				addBasicClassFeature(rAdd, sClassFeatureName, nil, sWindowLinkClass, sWindowLinkPath);
				break;
			end
		end
	end
end
function addDruidSentinelAnimalCompanion(rAdd, sClassFeatureOriginalDescription, sSelectedSeason)
	local tCurrentFeatures = DB.getChildren(rAdd.nodeChar, "specialabilitylist");
	local isNotInList = false;
	for _, featureNode in pairs(tCurrentFeatures) do
		if string.find(DB.getText(DB.getPath(featureNode, "value")), "Druid of " .. sSelectedSeason .. ":") or 
		 string.find(DB.getText(DB.getPath(featureNode, "value")), "Druid of the " .. sSelectedSeason .. ":") then
			isNotInList = true;
			break;
		end
	end
	if not isNotInList then
		local sPattern = '<link class="powerdesc" recordname="reference.features.(%w+)@([%w%s]+)">';
		local sFeaturesLink = string.gmatch(sClassFeatureOriginalDescription, sPattern);
		for w,v in sFeaturesLink do
			local sPattern = "reference.features." .. w .. "@" .. v;
			local sClassFeatureName = DB.getText(DB.getPath(sPattern, "name"));
			local sClassFeatureDescription = DB.getText(DB.getPath(sPattern, "description"));
			if string.find(sClassFeatureName, "Druid of " .. sSelectedSeason .. ":") or 
			 string.find(sClassFeatureName, "Druid of the " .. sSelectedSeason .. ":") then
			 	local sWindowLinkClass = "powerdesc";
			 	local sWindowLinkPath = sPattern;
				addBasicClassFeature(rAdd, sClassFeatureName, nil, sWindowLinkClass, sWindowLinkPath);
				break;
			end
		end
	end
end


---------------------------------------------
----- PALADIN (CAVALIER) Class Features ----
---------------------------------------------
function addPaladinCavalierPreFeatures(sClassName, rAdd, sDescriptionText, tClassFeatures)
	--First, see if you have a pact already selected. If you don't, select one, then go through the rest of the features.
	local tCurrentFeatures = DB.getChildren(rAdd.nodeChar, "specialabilitylist");
	local sAlreadyTakenVirtue = nil;
	local tVirtueNames = { "Virtue of Sacrifice", "Virtue of Valor" };
	for _, featureNode in pairs(tCurrentFeatures) do
		for x,virtueName in ipairs(tVirtueNames) do
			local sFeatureName = DB.getText(DB.getPath(featureNode, "value"));
			if sFeatureName then
				if string.find(sFeatureName, virtueName) then
					sAlreadyTakenVirtue = virtueName;
					break;
				end
			end
		end
	end
	if not sAlreadyTakenVirtue or sAlreadyTakenVirtue == "" then
		--Display a pop-up where we choose from the Hexblade pacts
		local tOptions = {}
		tOptions[1] = "Virtue of Sacrifice";
		tOptions[2] = "Virtue of Valor";
		local tDialogData = {
			title = Interface.getString("char_build_title_adddcavaliervirtue"),
			msg = Interface.getString("char_build_message_addcavaliervirtue"),
			options = tOptions,
			min = 1,
			max = 1,
			callback = CharClassFeatureDescManager.callbackResolvePaladinCavalierPreFeatureSelection,
			custom = { sClassName=sClassName, rAdd=rAdd, sDescriptionText=sDescriptionText, tClassFeatures=tClassFeatures },
		};
		DialogManager.requestSelectionDialog(tDialogData);
	end
end
function callbackResolvePaladinCavalierPreFeatureSelection(tSelection, tData)
	if not tSelection and #tSelection == 1 then
		ChatManager.SystemMessageResource("char_error_addclasssfeature");
		return;
	end

	local sVirtueDescription = "You have selected the " .. tSelection[1] .. " virtue.";
	local rCreatedIDChildNode = DB.createChild(tData.rAdd.nodeChar.getPath("specialabilitylist"));
	DB.setValue(rCreatedIDChildNode, "shortcut", "windowreference");
	DB.setValue(rCreatedIDChildNode, "value", "string", tSelection[1]);
	DB.setValue(rCreatedIDChildNode, "description", "string", sVirtueDescription);

	local tCurrentFeatures = DB.getChildren(tData.rAdd.nodeChar, "specialabilitylist");
	for w,v in pairs(tData.tClassFeatures) do
		local sClassFeatureDescriptionPattern = '';
		v = v:gsub("[%(%)%-]", "%%%0");
		if w < #tData.tClassFeatures then
			sClassFeatureDescriptionPattern = "<p>%s*<b>%s*" .. v:gsub("(%a)([%w_']*)", titleCase) .. "%s*</b></p>%s*(.-)<p><b>";
		elseif w == #tData.tClassFeatures then
			-- On the last feature entry, first try reading to the end of the description we're given
			sClassFeatureDescriptionPattern = "<p>%s*<b>%s*" .. v:gsub("(%a)([%w_']*)", titleCase) .. "%s*</b></p>%s*(.+)";
		end
		sClassFeatureSpecificDescriptionText = string.match(tData.sDescriptionText, sClassFeatureDescriptionPattern);
		if sClassFeatureSpecificDescriptionText then
			sClassFeatureFilteredDescriptionText = removeLinkLists(sClassFeatureSpecificDescriptionText);
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
			CharClassFeatureDescManager.addClassSpecificFeatures(tData.sClassName, tData.rAdd, v, sClassFeatureFilteredDescriptionText, sClassFeatureSpecificDescriptionText);
		end
	end
end
function addPaladinCavalierFeatures(sClassName, rAdd, sClassFeatureName, sClassFeatureFilteredDescription, sClassFeatureOriginalDescription)
	local tCurrentFeatures = DB.getChildren(rAdd.nodeChar, "specialabilitylist");
	local tLevelFourAlternativeClassFeaturesOptions = {};
	tLevelFourAlternativeClassFeaturesOptions[1] = "Pace Of The Virtuous Charger";
	tLevelFourAlternativeClassFeaturesOptions[2] = "Summoned Steed";
	--String data for the dialogue windows. 1 is title, 2 is message.
	local tLevelFourStringCharBuildData = {};
	tLevelFourStringCharBuildData[1] = "char_build_title_addvirtuouschargerorsummonedsteed";
	tLevelFourStringCharBuildData[2] = "char_build_message_addvirtuouschargerorsummonedsteed";	
	if sClassFeatureName == "Spirit of Virtue" then
		local rCreatedIDChildNode = DB.createChild(rAdd.nodeChar.getPath("specialabilitylist"));
		DB.setValue(rCreatedIDChildNode, "shortcut", "windowreference");
		DB.setValue(rCreatedIDChildNode, "value", "string", sClassFeatureName);
		DB.setValue(rCreatedIDChildNode, "description", "string", removeLinkLists(sClassFeatureOriginalDescription));
		displayPaladinCavalierSelectionsDialog(rAdd, sClassFeatureOriginalDescription, sClassFeatureName);
	elseif sClassFeatureName == "Virtue At-Will Power" then
		local rCreatedIDChildNode = DB.createChild(rAdd.nodeChar.getPath("specialabilitylist"));
		DB.setValue(rCreatedIDChildNode, "shortcut", "windowreference");
		DB.setValue(rCreatedIDChildNode, "value", "string", sClassFeatureName);
		DB.setValue(rCreatedIDChildNode, "description", "string", removeLinkLists(sClassFeatureOriginalDescription));
		displayPaladinCavalierSelectionsDialog(rAdd, sClassFeatureOriginalDescription, sClassFeatureName);		
	elseif sClassFeatureName == "Pace Of The Virtuous Charger" then
		--Add the feature, but if you have also already added Summoned Steed, choose between them
		local rCreatedIDChildNode = DB.createChild(rAdd.nodeChar.getPath("specialabilitylist"));
		DB.setValue(rCreatedIDChildNode, "shortcut", "windowreference");
		DB.setValue(rCreatedIDChildNode, "value", "string", sClassFeatureName);
		DB.setValue(rCreatedIDChildNode, "description", "string", sClassFeatureFilteredDescription);
		for _, featureNode in pairs(tCurrentFeatures) do
			if DB.getText(DB.getPath(featureNode, "value")) == "Summoned Steed" then
				displayAlternativeFeatureDialog(rAdd, tLevelFourAlternativeClassFeaturesOptions, tLevelFourStringCharBuildData);
				break;
			end
		end
	elseif sClassFeatureName == "Summoned Steed" then
		--Add the feature, but if you have also already added Pace of the Virtuous Charger, choose between them
		local rCreatedIDChildNode = DB.createChild(rAdd.nodeChar.getPath("specialabilitylist"));
		DB.setValue(rCreatedIDChildNode, "shortcut", "windowreference");
		DB.setValue(rCreatedIDChildNode, "value", "string", sClassFeatureName);
		DB.setValue(rCreatedIDChildNode, "description", "string", sClassFeatureOriginalDescription);
		for _, featureNode in pairs(tCurrentFeatures) do
			if DB.getText(DB.getPath(featureNode, "value")) == "Pace Of The Virtuous Charger" then
				displayAlternativeFeatureDialog(rAdd, tLevelFourAlternativeClassFeaturesOptions, tLevelFourStringCharBuildData);
				break;
			end
		end
	else
		local rCreatedIDChildNode = DB.createChild(rAdd.nodeChar.getPath("specialabilitylist"));
		DB.setValue(rCreatedIDChildNode, "shortcut", "windowreference");
		DB.setValue(rCreatedIDChildNode, "value", "string", sClassFeatureName);
		DB.setValue(rCreatedIDChildNode, "description", "string", sClassFeatureFilteredDescription);
		ChatManager.SystemMessageResource("char_abilities_message_classfeatureadd", sClassFeatureName, rAdd.sCharName);
	end
end

function displayPaladinCavalierSelectionsDialog(rAdd, sClassFeatureOriginalDescription, sClassFeatureName)
	local tClassFeatureOptions = {};
	local tOptions = {};
	local tCurrentFeatures = DB.getChildren(rAdd.nodeChar, "specialabilitylist");
	local sAlreadyTakenVirtue = "";
	--Find already selected virtue first
	for _, featureNode in pairs(tCurrentFeatures) do
		local sFeatureName = DB.getText(DB.getPath(featureNode, "value"));
		if string.match(sFeatureName, "Virtue of (%w+)") then
			sAlreadyTakenVirtue = string.match(sFeatureName, "Virtue of (%w+)");
			break;
		end
	end
	--If it exists, automatically choose the feature
	if sAlreadyTakenVirtue then
		local sPattern = '<link class="powerdesc" recordname="reference.features.(%w+)@([%w%s]+)">([%w%s%p]-)</link>';
		for w, v, featureLinkName in string.gmatch(sClassFeatureOriginalDescription, sPattern) do
			if string.find(featureLinkName, sAlreadyTakenVirtue) then
				local sPattern = "reference.features." .. w .. "@" .. v;
				local sClassFeatureDescription = DB.getText(DB.getPath(sPattern, "description"));
				local rCreatedIDChildNode = DB.createChild(rAdd.nodeChar.getPath("specialabilitylist"));
				DB.setValue(rCreatedIDChildNode, "shortcut", "windowreference");
				DB.setValue(rCreatedIDChildNode, "value", "string", featureLinkName);
				DB.setValue(rCreatedIDChildNode, "description", "string", sClassFeatureDescription);

				CharClassPowerManager.addAllPowersFromFeatureText(rAdd, sClassFeatureDescription, sClassFeatureOriginalDescription);
				break;
			end
		end
	else
		--If it doesn't exist, run the normal new feature selection dialogue
		--Display information on the selections in chat
		displayClassFeatureSelectionsDialog(rAdd, sClassFeatureOriginalDescription, sClassFeatureName);
	end
end


-------------------------------------------
----- RANGER (HUNTER) Class Features ----
-------------------------------------------
function addRangerHunterFeatures(sClassName, rAdd, sClassFeatureName, sClassFeatureFilteredDescription, sClassFeatureOriginalDescription)
	local tCurrentFeatures = DB.getChildren(rAdd.nodeChar, "specialabilitylist");
	if sClassFeatureName == "Archery Style" then
		local rCreatedIDChildNode = DB.createChild(rAdd.nodeChar.getPath("specialabilitylist"));
		DB.setValue(rCreatedIDChildNode, "shortcut", "windowreference");
		DB.setValue(rCreatedIDChildNode, "value", "string", sClassFeatureName);
		DB.setValue(rCreatedIDChildNode, "description", "string", removeLinkLists(sClassFeatureOriginalDescription));
		displayClassFeatureSelectionsDialog(rAdd, sClassFeatureOriginalDescription, sClassFeatureName);
	elseif sClassFeatureName == "Ranger Wilderness Knacks" then
		local rCreatedIDChildNode = DB.createChild(rAdd.nodeChar.getPath("specialabilitylist"));
		DB.setValue(rCreatedIDChildNode, "shortcut", "windowreference");
		DB.setValue(rCreatedIDChildNode, "value", "string", sClassFeatureName);
		DB.setValue(rCreatedIDChildNode, "description", "string", sClassFeatureOriginalDescription);
		displayClassFeatureSelectionsDialog(rAdd, sClassFeatureOriginalDescription, sClassFeatureName, 2);
	elseif string.find(sClassFeatureName:lower(), "level %d+ wilderness knack") then
		local rCreatedIDChildNode = DB.createChild(rAdd.nodeChar.getPath("specialabilitylist"));
		DB.setValue(rCreatedIDChildNode, "shortcut", "windowreference");
		DB.setValue(rCreatedIDChildNode, "value", "string", sClassFeatureName);
		DB.setValue(rCreatedIDChildNode, "description", "string", removeLinkLists(sClassFeatureOriginalDescription));
		local sOriginalWildernessKnackDescription = nil;
		for _, featureNode in pairs(tCurrentFeatures) do
			if DB.getText(DB.getPath(featureNode, "value")) == "Ranger Wilderness Knacks" then
				sOriginalWildernessKnackDescription = DB.getText(DB.getPath(featureNode, "description"));
				displayClassFeatureSelectionsDialog(rAdd, sOriginalWildernessKnackDescription, sClassFeatureName, 1);
			end
		end
	else
		local rCreatedIDChildNode = DB.createChild(rAdd.nodeChar.getPath("specialabilitylist"));
		DB.setValue(rCreatedIDChildNode, "shortcut", "windowreference");
		DB.setValue(rCreatedIDChildNode, "value", "string", sClassFeatureName);
		DB.setValue(rCreatedIDChildNode, "description", "string", sClassFeatureFilteredDescription);
		ChatManager.SystemMessageResource("char_abilities_message_classfeatureadd", sClassFeatureName, rAdd.sCharName);
	end
end



-------------------------------------------
----- RANGER (SCOUT) Class Features ----
-------------------------------------------
function addRangerScoutFeatures(sClassName, rAdd, sClassFeatureName, sClassFeatureFilteredDescription, sClassFeatureOriginalDescription)
	local tCurrentFeatures = DB.getChildren(rAdd.nodeChar, "specialabilitylist");
	if sClassFeatureName == "Two-Weapon Style" then
		local rCreatedIDChildNode = DB.createChild(rAdd.nodeChar.getPath("specialabilitylist"));
		DB.setValue(rCreatedIDChildNode, "shortcut", "windowreference");
		DB.setValue(rCreatedIDChildNode, "value", "string", sClassFeatureName);
		DB.setValue(rCreatedIDChildNode, "description", "string", removeLinkLists(sClassFeatureOriginalDescription));
		displayClassFeatureSelectionsDialog(rAdd, sClassFeatureOriginalDescription, sClassFeatureName);
	elseif sClassFeatureName == "Ranger Wilderness Knacks" then
		local rCreatedIDChildNode = DB.createChild(rAdd.nodeChar.getPath("specialabilitylist"));
		DB.setValue(rCreatedIDChildNode, "shortcut", "windowreference");
		DB.setValue(rCreatedIDChildNode, "value", "string", sClassFeatureName);
		DB.setValue(rCreatedIDChildNode, "description", "string", sClassFeatureOriginalDescription);
		displayClassFeatureSelectionsDialog(rAdd, sClassFeatureOriginalDescription, sClassFeatureName, 2);
	elseif string.find(sClassFeatureName:lower(), "level %d+ wilderness knack") then
		local rCreatedIDChildNode = DB.createChild(rAdd.nodeChar.getPath("specialabilitylist"));
		DB.setValue(rCreatedIDChildNode, "shortcut", "windowreference");
		DB.setValue(rCreatedIDChildNode, "value", "string", sClassFeatureName);
		DB.setValue(rCreatedIDChildNode, "description", "string", removeLinkLists(sClassFeatureOriginalDescription));
		local sOriginalWildernessKnackDescription = nil;
		for _, featureNode in pairs(tCurrentFeatures) do
			if DB.getText(DB.getPath(featureNode, "value")) == "Ranger Wilderness Knacks" then
				sOriginalWildernessKnackDescription = DB.getText(DB.getPath(featureNode, "description"));
				displayClassFeatureSelectionsDialog(rAdd, sOriginalWildernessKnackDescription, sClassFeatureName, 1);
			end
		end		
	else
		local rCreatedIDChildNode = DB.createChild(rAdd.nodeChar.getPath("specialabilitylist"));
		DB.setValue(rCreatedIDChildNode, "shortcut", "windowreference");
		DB.setValue(rCreatedIDChildNode, "value", "string", sClassFeatureName);
		DB.setValue(rCreatedIDChildNode, "description", "string", sClassFeatureFilteredDescription);
		ChatManager.SystemMessageResource("char_abilities_message_classfeatureadd", sClassFeatureName, rAdd.sCharName);
	end
end


-------------------------------------------
----- WARLOCK (HEXBLADE) Class Features ----
-------------------------------------------
function addWarlockHexbladePreFeatures(sClassName, rAdd, sDescriptionText, tClassFeatures)
	--First, see if you have a pact already selected. If you don't, select one, then go through the rest of the features.
	local tCurrentFeatures = DB.getChildren(rAdd.nodeChar, "specialabilitylist");
	local sAlreadyTakenPact = nil;
	local tPactNames = { "Elemental Pact", "Fey Pact", "Gloom Pact", "Infernal Pact", "Star Pact" };
	for _, featureNode in pairs(tCurrentFeatures) do
		for x,seasonName in ipairs(tPactNames) do
			local sFeatureName = DB.getText(DB.getPath(featureNode, "value"));
			if sFeatureName then
				if string.find(sFeatureName, seasonName) then
					sAlreadyTakenPact = seasonName;
					break;
				end
			end
		end
	end
	if not sAlreadyTakenPact or sAlreadyTakenPact == "" then
		--Display a pop-up where we choose from the Hexblade pacts
		local tOptions = {}
		tOptions[1] = "Elemental Pact";
		tOptions[2] = "Fey Pact";
		tOptions[3] = "Gloom Pact";
		tOptions[4] = "Infernal Pact";
		tOptions[5] = "Star Pact";
		local tDialogData = {
			title = Interface.getString("char_build_title_adddhexbladepact"),
			msg = Interface.getString("char_build_message_addhexbladepact"),
			options = tOptions,
			min = 1,
			max = 1,
			callback = CharClassFeatureDescManager.callbackResolveWarlockHexbladePreFeatureSelection,
			custom = { sClassName=sClassName, rAdd=rAdd, sDescriptionText=sDescriptionText, tClassFeatures=tClassFeatures },
		};
		DialogManager.requestSelectionDialog(tDialogData);
	end
end
function callbackResolveWarlockHexbladePreFeatureSelection(tSelection, tData)
	if not tSelection and #tSelection == 1 then
		ChatManager.SystemMessageResource("char_error_addclasssfeature");
		return;
	end

	local sPactDescription = "You have selected the " .. tSelection[1] .. " pact.";
	local rCreatedIDChildNode = DB.createChild(tData.rAdd.nodeChar.getPath("specialabilitylist"));
	DB.setValue(rCreatedIDChildNode, "shortcut", "windowreference");
	DB.setValue(rCreatedIDChildNode, "value", "string", tSelection[1]);
	DB.setValue(rCreatedIDChildNode, "description", "string", sPactDescription);

	local tCurrentFeatures = DB.getChildren(tData.rAdd.nodeChar, "specialabilitylist");
	for w,v in pairs(tData.tClassFeatures) do
		local sClassFeatureDescriptionPattern = '';
		v = v:gsub("[%(%)%-]", "%%%0");
		if w < #tData.tClassFeatures then
			sClassFeatureDescriptionPattern = "<p>%s*<b>%s*" .. v:gsub("(%a)([%w_']*)", titleCase) .. "%s*</b></p>%s*(.-)<p><b>";
		elseif w == #tData.tClassFeatures then
			-- On the last feature entry, first try reading to the end of the description we're given
			sClassFeatureDescriptionPattern = "<p>%s*<b>%s*" .. v:gsub("(%a)([%w_']*)", titleCase) .. "%s*</b></p>%s*(.+)";
		end
		sClassFeatureSpecificDescriptionText = string.match(tData.sDescriptionText, sClassFeatureDescriptionPattern);
		if sClassFeatureSpecificDescriptionText then
			sClassFeatureFilteredDescriptionText = removeLinkLists(sClassFeatureSpecificDescriptionText);
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
			CharClassFeatureDescManager.addClassSpecificFeatures(tData.sClassName, tData.rAdd, v, sClassFeatureFilteredDescriptionText, sClassFeatureSpecificDescriptionText);
		end
	end
end
function addWarlockHexbladeFeatures(sClassName, rAdd, sClassFeatureName, sClassFeatureFilteredDescription, sClassFeatureOriginalDescription)
	local tCurrentFeatures = DB.getChildren(rAdd.nodeChar, "specialabilitylist");

	if sClassFeatureName == "Pact Boon" then
		--Add the feature, but if you have also already added a pact, narrow pact-based features
		local rCreatedIDChildNode = DB.createChild(rAdd.nodeChar.getPath("specialabilitylist"));
		DB.setValue(rCreatedIDChildNode, "shortcut", "windowreference");
		DB.setValue(rCreatedIDChildNode, "value", "string", sClassFeatureName);
		DB.setValue(rCreatedIDChildNode, "description", "string", sClassFeatureFilteredDescription);
		displayWarlockHexbladePactDialog(sClassName, rAdd, sClassFeatureOriginalDescription, sClassFeatureName);
	elseif sClassFeatureName == "Pact Reward" then
		--Add the feature, but if you have also already added a pact, narrow pact-based features
		local rCreatedIDChildNode = DB.createChild(rAdd.nodeChar.getPath("specialabilitylist"));
		DB.setValue(rCreatedIDChildNode, "shortcut", "windowreference");
		DB.setValue(rCreatedIDChildNode, "value", "string", sClassFeatureName);
		DB.setValue(rCreatedIDChildNode, "description", "string", sClassFeatureFilteredDescription);
		displayWarlockHexbladePactDialog(sClassName, rAdd, sClassFeatureOriginalDescription, sClassFeatureName);
	elseif sClassFeatureName == "Pact Weapon" then
		--Add the feature, but if you have also already added a pact, narrow pact-based features
		local rCreatedIDChildNode = DB.createChild(rAdd.nodeChar.getPath("specialabilitylist"));
		DB.setValue(rCreatedIDChildNode, "shortcut", "windowreference");
		DB.setValue(rCreatedIDChildNode, "value", "string", sClassFeatureName);
		DB.setValue(rCreatedIDChildNode, "description", "string", sClassFeatureFilteredDescription);
		displayWarlockHexbladePactDialog(sClassName, rAdd, sClassFeatureOriginalDescription, sClassFeatureName);
	elseif sClassFeatureName == "Pact Weapon Retribution" then
		--Add the feature, but if you have also already added a pact, narrow pact-based features
		local rCreatedIDChildNode = DB.createChild(rAdd.nodeChar.getPath("specialabilitylist"));
		DB.setValue(rCreatedIDChildNode, "shortcut", "windowreference");
		DB.setValue(rCreatedIDChildNode, "value", "string", sClassFeatureName);
		DB.setValue(rCreatedIDChildNode, "description", "string", sClassFeatureFilteredDescription);
		displayWarlockHexbladePactDialog(sClassName, rAdd, sClassFeatureOriginalDescription, sClassFeatureName);
	elseif sClassFeatureName == "Summon Warlock's Ally" then
		--Add the feature, but if you have also already added a pact, narrow pact-based features
		addDefaultClassFeature(sClassName,rAdd, sClassFeatureName, sClassFeatureFilteredDescription, sClassFeatureOriginalDescription);
		displayWarlockHexbladePactDialog(sClassName, rAdd, sClassFeatureOriginalDescription, sClassFeatureName);		
	else
		addDefaultClassFeature(sClassName,rAdd, sClassFeatureName, sClassFeatureFilteredDescription, sClassFeatureOriginalDescription);
	end
end
function displayWarlockHexbladePactDialog(sClassName, rAdd, sClassFeatureOriginalDescription, sClassFeatureName)
	--Find out if you have a pact feature already, and if so, add the pact-based feature already
	local tCurrentFeatures = DB.getChildren(rAdd.nodeChar, "specialabilitylist");
	local sAlreadyTakenPact = "";
	local tPactNames = { "Elemental Pact", "Fey Pact", "Gloom Pact", "Infernal Pact", "Star Pact" };
	for _, featureNode in pairs(tCurrentFeatures) do
		for i,pactName in ipairs(tPactNames) do
			local sFeatureName = DB.getText(DB.getPath(featureNode, "value"));
			if sFeatureName then
				if string.find(sFeatureName, pactName) then
					sAlreadyTakenPact = pactName;
					break;
				end
			end
		end
	end

	if sAlreadyTakenPact and sAlreadyTakenPact ~= "" then
		if sClassFeatureName == "Pact Boon" and sClassFeatureOriginalDescription then
			addWarlockHexbladePactFeature(rAdd, sClassFeatureOriginalDescription, sAlreadyTakenPact, "Boon");
		elseif sClassFeatureName == "Pact Reward" and sClassFeatureOriginalDescription then
			addWarlockHexbladePactFeature(rAdd, sClassFeatureOriginalDescription, sAlreadyTakenPact, "Reward");
		elseif sClassFeatureName == "Pact Weapon" and sClassFeatureOriginalDescription then
			addWarlockHexbladePactFeature(rAdd, sClassFeatureOriginalDescription, sAlreadyTakenPact, "Weapon");
		elseif sClassFeatureName == "Pact Weapon Retribution" and sClassFeatureOriginalDescription then
			addWarlockHexbladePactFeature(rAdd, sClassFeatureOriginalDescription, sAlreadyTakenPact, "Weapon Retribution");
		elseif sClassFeatureName == "Summon Warlock's Ally" and sClassFeatureOriginalDescription then
			addWarlockHexbladePactFeature(rAdd, sClassFeatureOriginalDescription, sAlreadyTakenPact, "Summon Warlock's Ally", sClassFeatureName);
		end
	else
		--Display a pop-up where we choose from the Hexblade pacts
		local tOptions = {}
		tOptions[1] = "Elemental Pact";
		tOptions[2] = "Fey Pact";
		tOptions[3] = "Gloom Pact";
		tOptions[4] = "Infernal Pact";
		tOptions[5] = "Star Pact";
		local tDialogData = {
			title = Interface.getString("char_build_title_adddhexbladepact"),
			msg = Interface.getString("char_build_message_addhexbladepact"),
			options = tOptions,
			min = 1,
			max = 1,
			callback = CharClassFeatureDescManager.callbackResolveWarlockHexbladePactSelection,
			custom = { rAdd=rAdd, sClassFeatureOriginalDescription=sClassFeatureOriginalDescription, sClassFeatureName=sClassFeatureName },
		};
		DialogManager.requestSelectionDialog(tDialogData);
	end
end
function callbackResolveWarlockHexbladePactSelection(tSelection, tData)
	if not tSelection and #tSelection == 1 then
		ChatManager.SystemMessageResource("char_error_addclasssfeature");
		return;
	end
	if #tSelection == 1 then
		if (tData.sClassFeatureName == "Pact Boon" and tData.sClassFeatureOriginalDescription) or
			(tData.sClassFeatureName == "Pact Reward" and tData.sClassFeatureOriginalDescription) or
			(tData.sClassFeatureName == "Pact Weapon" and tData.sClassFeatureOriginalDescription) or
			(tData.sClassFeatureName == "Pact Weapon Retribution" and tData.sClassFeatureOriginalDescription) then
			local secondWord = string.match(tData.sClassFeatureName, "^%S+%s(%S+)")
			addWarlockHexbladePactFeature(tData.rAdd, tData.sClassFeatureOriginalDescription, tSelection[1], secondWord);
		else
			local sDomainDescription = "You have selected the " .. tSelection[1] .. " domain.";
			local rCreatedIDChildNode = DB.createChild(tData.rAdd.nodeChar.getPath("specialabilitylist"));
			DB.setValue(rCreatedIDChildNode, "shortcut", "windowreference");
			DB.setValue(rCreatedIDChildNode, "value", "string", tSelection[1] .. " Domain");
			DB.setValue(rCreatedIDChildNode, "description", "string", sDomainDescription);
		end
	end
end
function addWarlockHexbladePactFeature(rAdd, sClassFeatureOriginalDescription, sSelectedPact, sTextToFind, sParentClassFeatureName)
	if not sParentClassFeatureName then
		sParentClassFeatureName = "";
	end
	local tCurrentFeatures = DB.getChildren(rAdd.nodeChar, "specialabilitylist");
	local isInList = false;
	for _, featureNode in pairs(tCurrentFeatures) do
		if string.find(DB.getText(DB.getPath(featureNode, "value")), sSelectedPact .. " " .. sTextToFind) then
			isInList = true;
			break;
		end
	end
	if not isInList then
		local sPattern = '<link class="powerdesc" recordname="reference.features.(%w+)@([%w%s]+)">';
		local sFeaturesLink = string.gmatch(sClassFeatureOriginalDescription, sPattern);
		for w,v in sFeaturesLink do
			local sPattern = "reference.features." .. w .. "@" .. v;
			local sClassFeatureName = DB.getText(DB.getPath(sPattern, "name"));
			local sClassFeatureDescription = DB.getText(DB.getPath(sPattern, "description"));
			local sPactNameWithoutPactPart = string.gsub(sSelectedPact, " Pact", "");
			if string.find(sClassFeatureName, sSelectedPact .. " " .. sTextToFind, 1, true)
			or sClassFeatureName == sParentClassFeatureName .. " (" .. sPactNameWithoutPactPart .. ")" then
				local rCreatedIDChildNode = DB.createChild(rAdd.nodeChar.getPath("specialabilitylist"));
				DB.setValue(rCreatedIDChildNode, "shortcut", "windowreference", "powerdesc", sPattern);
				DB.setValue(rCreatedIDChildNode, "value", "string", sClassFeatureName);
				--DB.setValue(rCreatedIDChildNode, "description", "string", sClassFeatureOriginalDescription);
				ChatManager.SystemMessageResource("char_abilities_message_classfeatureadd", sClassFeatureName, rAdd.sCharName);

				if sTextToFind == "Boon" 
				or sTextToFind == "Weapon" 
				or sTextToFind == "Weapon Retribution" then
					CharClassPowerManager.addAllPowersFromFeatureText(rAdd, sClassFeatureDescription, sClassFeatureOriginalDescription);
				end
			end
		end
	end
end


-------------------------------------------
----- ASSASSIN (EXECUTIONER) Class Features ----
-------------------------------------------
function addAssassinExecutionerFeatures(sClassName, rAdd, sClassFeatureName, sClassFeatureFilteredDescription, sClassFeatureOriginalDescription)
	local tCurrentFeatures = DB.getChildren(rAdd.nodeChar, "specialabilitylist");
	if sClassFeatureName == "Guild Attacks" then
		addBasicClassFeature(rAdd, sClassFeatureName, sClassFeatureFilteredDescription);
		displayAssassinExecutionerGuildAttacksSelectionsDialog(rAdd, sClassFeatureOriginalDescription, sClassFeatureName);
	elseif sClassFeatureName == "Level 6 Executioner Utility Power" or
			sClassFeatureName == "Level 10 Executioner Utility Power" then
		addBasicClassFeature(rAdd, sClassFeatureName, sClassFeatureFilteredDescription);
		if sClassFeatureOriginalDescription then
			CharClassPowerManager.displayClassPowerSelectionsDialog(rAdd, sClassFeatureOriginalDescription, sClassFeatureName, 1);
		end
	else
		addDefaultClassFeature(sClassName, rAdd, sClassFeatureName, sClassFeatureFilteredDescription, sClassFeatureOriginalDescription);
	end
end
function displayAssassinExecutionerGuildAttacksSelectionsDialog(rAdd, sClassFeatureOriginalDescription, sClassFeatureName, nMaxSelections)
	local tClassFeatureOptions = {};
	local tOptions = {};
	--Display links to the selections
	local sPattern = '<link class="powerdesc" recordname="reference.features.(%w+)@([%w%s]+)">';
	local sFeaturesLink = string.gmatch(sClassFeatureOriginalDescription, sPattern);
	local nOptionsCount = 1;
	for w,v in sFeaturesLink do
		local sPattern = "reference.features." .. w .. "@" .. v;
		local sClassFeatureName = DB.getText(DB.getPath(sPattern, "name"));
		local sClassFeatureDescription = DB.getText(DB.getPath(sPattern, "description"));
		--tOptions[nOptionsCount] = sClassFeatureName;
		tClassFeatureOptions[sClassFeatureName] = DB.getPath(sPattern);
		-- local tMessageShortcuts = { { class="powerdesc", recordname=DB.getPath(sPattern) } };
		-- local tMessageData = {font = "systemfont", text = sClassFeatureName, shortcuts=tMessageShortcuts};
		-- Comm.addChatMessage(tMessageData);
		table.insert(tOptions, { text = sClassFeatureName, linkclass = "powerdesc", linkrecord = DB.getPath(sPattern), });
		nOptionsCount = nOptionsCount + 1;
	end
	--Display a pop-up where we choose from the class feature options
	if not nMaxSelections or nMaxSelections < 1 then
		nMaxSelections = 1;
	end
	local msg = string.format(Interface.getString("char_build_message_chooseclassfeatures"), nMaxSelections, sClassFeatureName);
	local tDialogData = {
		title = sClassFeatureName,
		msg = msg,
		options = tOptions,
		min = nMaxSelections,
		max = nMaxSelections,
		callback = CharClassFeatureDescManager.callbackResolveAssassinExecutionerGuildAttacksSelectionsDialogSelection,
		custom = { rAdd = rAdd, tClassFeatureOptions = tClassFeatureOptions, sClassFeatureOriginalDescription=sClassFeatureOriginalDescription }, 
	};
	DialogManager.requestSelectionDialog(tDialogData);	
end
function callbackResolveAssassinExecutionerGuildAttacksSelectionsDialogSelection(tSelection, tData, tSelectionLinks)
	if not tSelection or not tSelection[1] then
		ChatManager.SystemMessageResource("char_error_addclasssfeature");
		return;
	end

	local sSelectedClassFeatureSelectionsDBReference;
	local tCurrentFeatures = DB.getChildren(tData.rAdd.nodeChar, "specialabilitylist");
	local rAttackFinesseFeature = "";
	local rPoisonUseFeature = "";
	for _,selectedSkill in ipairs(tSelection) do
		for _, featureNode in pairs(tCurrentFeatures) do
			if string.find(DB.getText(DB.getPath(featureNode, "value")), "Attack Finesse") then
				rAttackFinesseFeature = featureNode;
			elseif string.find(DB.getText(DB.getPath(featureNode, "value")), "Poison Use") then
				rPoisonUseFeature = featureNode;
			end
			if DB.getText(DB.getPath(featureNode, "value")) ~= selectedSkill then
				for x, y in pairs(tData.tClassFeatureOptions) do
					if DB.getText(DB.getPath(featureNode, "value")) == x then
						DB.deleteNode(featureNode);
						break;
					end
				end
			end
		end
		--Way of the Ninja also adds proficiency with shuriken and the kusari-gama, 
		if selectedSkill == "Way of the Ninja" then
			local tWeaponProficiencies = { "shuriken", "kusari-gama" };
			local tCurrentWeaponProficiencies = DB.getChildren(tData.rAdd.nodeChar, "proficiencyweapon");
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
					local rCreatedIDChildNode = DB.createChild(tData.rAdd.nodeChar.getPath("proficiencyweapon"));
					DB.setValue(rCreatedIDChildNode, "shortcut", "windowreference");
					DB.setValue(rCreatedIDChildNode, "value", "string", x);
					ChatManager.SystemMessageResource("char_abilities_message_weaponproficiencyadd", x, tData.rAdd.sCharName);
				end
			end
			-- your Attack Finesse class feature also applies to kusari-gama and shuriken
			if rAttackFinesseFeature then
				local sAttackFinesseDescription = DB.getText(rAttackFinesseFeature, "description");
				sAttackFinesseDescription = sAttackFinesseDescription .. "\n\n This class feature also applies to kusari-gama and shuriken (from Way of the Ninja).";
				DB.setValue(rAttackFinesseFeature, "description", "string", sAttackFinesseDescription);
			end
			-- your assassin poisons that can be applied to ammunition can also be applied to your shuriken.
			if rPoisonUseFeature then
				local sPoisonUseDescription = DB.getText(rPoisonUseFeature, "description");
				sPoisonUseDescription = sPoisonUseDescription .. "\n\n Your assassin poisons that can be applied to ammunition can also be applied to your shuriken (from Way of the Ninja).";
				DB.setValue(rPoisonUseFeature, "description", "string", sPoisonUseDescription);
			end
		end
			
		sSelectedClassFeatureSelectionsDBReference = tData.tClassFeatureOptions[selectedSkill];
		local rCreatedIDChildNode = DB.createChild(tData.rAdd.nodeChar.getPath("specialabilitylist"));
		DB.setValue(rCreatedIDChildNode, "shortcut", "windowreference", "powerdesc", sSelectedClassFeatureSelectionsDBReference);
		DB.setValue(rCreatedIDChildNode, "value", "string", selectedSkill);
		--DB.setValue(rCreatedIDChildNode, "description", "string", sClassFeatureOriginalDescription);
		ChatManager.SystemMessageResource("char_abilities_message_classfeatureadd", selectedSkill, tData.rAdd.sCharName);

		--Add the powers
		local sSubClassFeatureOriginalDescription = DB.getText(DB.getPath(tSelectionLinks[1].linkrecord, "description"));
		local sParentClassFeatureOriginalDescription = tData.sClassFeatureOriginalDescription;
		CharClassPowerManager.addAllPowersFromFeatureText(tData.rAdd, sSubClassFeatureOriginalDescription, sParentClassFeatureOriginalDescription)
	end
end


----------------------------------------------
----- PALADIN (BLACKGUARD) Class Features ----
----------------------------------------------
function addPaladinBlackguardPreFeatures(sClassName, rAdd, sDescriptionText, tClassFeatures, nLevel, sFullDescriptionText)
	local tCurrentFeatures = DB.getChildren(rAdd.nodeChar, "specialabilitylist");
	local sClassFeatureDescriptionPattern = "<p>%s*<b>%s*Spirit Of Vice%s*</b></p>%s*(.-)<p><b>";
	local sClassFeatureOriginalDescription = string.match(sDescriptionText, sClassFeatureDescriptionPattern);
	local sClassFeatureName = "Spirit Of Vice";
	if sClassFeatureOriginalDescription then
		local fnCallbackWrapper = function()
			CharClassManager.addEssentialsClassFeatures(rAdd, nil, sFullDescriptionText, sClassName, nLevel, sFullDescriptionText, true);
		end			
		displayClassFeatureSelectionsDialog(rAdd, sClassFeatureOriginalDescription, sClassFeatureName, nil, nil, fnCallbackWrapper);

	end
end
function addPaladinBlackguardFeatures(sClassName, rAdd, sClassFeatureName, sClassFeatureFilteredDescription, sClassFeatureOriginalDescription, sFullDescriptionText)
	-- if sClassFeatureName == "Spirit Of Vice" then
	-- 	addBasicClassFeature(rAdd, sClassFeatureName, sClassFeatureFilteredDescription);
	-- 	displayClassFeatureSelectionsDialog(rAdd, sClassFeatureOriginalDescription, sClassFeatureName);
	-- else
	if sClassFeatureName == "Vice At-Will Power" then
		addPreChosenClassFeature(rAdd, sClassFeatureOriginalDescription, sClassFeatureName);
	elseif sClassFeatureName == "Improved Shroud Of Shadow" then
		addBasicClassFeature(rAdd, sClassFeatureName, sClassFeatureFilteredDescription);
		addPreChosenClassFeature(rAdd, sClassFeatureOriginalDescription, sClassFeatureName);
	elseif sClassFeatureName == "Level 22 Vice Utility Power" then
		addBasicClassFeature(rAdd, sClassFeatureName, sClassFeatureFilteredDescription);
		addPreChosenClassFeature(rAdd, sClassFeatureOriginalDescription, sClassFeatureName);
	else
		addDefaultClassFeature(sClassName, rAdd, sClassFeatureName, sClassFeatureFilteredDescription, sClassFeatureOriginalDescription);
	end
end
function addPaladinBlackguardViceAtWillPower(rAdd, sFullDescriptionText)
	if not rAdd then
		ChatManager.SystemMessageResource("char_error_addclassspower");
		return;
	end
	if not sFullDescriptionText then
		ChatManager.SystemMessageResource("char_error_addclassspower");
		return;
	end
	local sClassFeatureDescriptionPattern = "<p>%s*<b>%s*Vice At-Will Power%s*</b></p>%s*(.-)<p><b>";
	local sClassFeatureOriginalDescription = string.match(sFullDescriptionText, sClassFeatureDescriptionPattern);
	local sClassFeatureName = "Vice At-Will Power";
	addPreChosenClassFeature(rAdd, sClassFeatureOriginalDescription, sClassFeatureName);
end

-------------------------------------------
----- WARLOCK (BINDER) Class Features ----
-------------------------------------------
function addWarlockBinderPreFeatures(sClassName, rAdd, sDescriptionText, tClassFeatures)
	--First, see if you have a pact already selected. If you don't, select one, then go through the rest of the features.
	local tCurrentFeatures = DB.getChildren(rAdd.nodeChar, "specialabilitylist");
	local sAlreadyTakenPact = nil;
	local tPactNames = { "Fey Pact", "Gloom Pact", "Star Pact" };
	for _, featureNode in pairs(tCurrentFeatures) do
		for x,seasonName in ipairs(tPactNames) do
			local sFeatureName = DB.getText(DB.getPath(featureNode, "value"));
			if sFeatureName then
				if string.find(sFeatureName, seasonName) then
					sAlreadyTakenPact = seasonName;
					break;
				end
			end
		end
	end
	if not sAlreadyTakenPact or sAlreadyTakenPact == "" then
		--Display a pop-up where we choose from the Hexblade pacts
		local tOptions = {}
		tOptions[1] = "Fey Pact";
		tOptions[2] = "Gloom Pact";
		tOptions[3] = "Star Pact";
		local tDialogData = {
			title = Interface.getString("char_build_title_adddbinderpact"),
			msg = Interface.getString("char_build_message_addbinderpact"),
			options = tOptions,
			min = 1,
			max = 1,
			callback = CharClassFeatureDescManager.callbackResolveWarlockHexbladePreFeatureSelection,
			custom = { sClassName=sClassName, rAdd=rAdd, sDescriptionText=sDescriptionText, tClassFeatures=tClassFeatures },
		};
		DialogManager.requestSelectionDialog(tDialogData);
	end
end
function addWarlockBinderFeatures(sClassName, rAdd, sClassFeatureName, sClassFeatureFilteredDescription, sClassFeatureOriginalDescription)
	local tCurrentFeatures = DB.getChildren(rAdd.nodeChar, "specialabilitylist");

	if sClassFeatureName:upper() == "LEVEL 1 PACT ENCOUNTER POWER" then
		--Add the feature, but if you have also already added a pact, narrow pact-based features
		addBasicClassFeature(rAdd, sClassFeatureName, sClassFeatureFilteredDescription);
		displayWarlockBinderPactDialog(sClassName, rAdd, sClassFeatureOriginalDescription, sClassFeatureName);
	elseif sClassFeatureName:upper() == "PACT BOON (BINDER)" then
		--Add the feature, but if you have also already added a pact, narrow pact-based features
		addBasicClassFeature(rAdd, sClassFeatureName, sClassFeatureFilteredDescription);
		displayWarlockBinderPactDialog(sClassName, rAdd, sClassFeatureOriginalDescription, sClassFeatureName);
	else
		addDefaultClassFeature(sClassName, rAdd, sClassFeatureName, sClassFeatureFilteredDescription, sClassFeatureOriginalDescription);
	end
end
function displayWarlockBinderPactDialog(sClassName, rAdd, sClassFeatureOriginalDescription, sClassFeatureName)
	--Find out if you have a pact feature already, and if so, add the pact-based feature already
	local tCurrentFeatures = DB.getChildren(rAdd.nodeChar, "specialabilitylist");
	local sAlreadyTakenPact = "";
	local tPactNames = { "Fey Pact", "Gloom Pact", "Star Pact" };
	for _, featureNode in pairs(tCurrentFeatures) do
		for i,pactName in ipairs(tPactNames) do
			local sFeatureName = DB.getText(DB.getPath(featureNode, "value"));
			if sFeatureName then
				if string.find(sFeatureName, pactName) then
					sAlreadyTakenPact = pactName;
					break;
				end
			end
		end
	end

	if sAlreadyTakenPact and sAlreadyTakenPact ~= "" then
		if sClassFeatureName == "Level 1 Pact Encounter Power" and sClassFeatureOriginalDescription then
			addWarlockHexbladePactFeature(rAdd, sClassFeatureOriginalDescription, sAlreadyTakenPact, "Encounter Power");
		elseif sClassFeatureName == "Pact Boon (Binder)" and sClassFeatureOriginalDescription then
			addWarlockHexbladePactFeature(rAdd, sClassFeatureOriginalDescription, sAlreadyTakenPact, "Boon (Binder)");
		end
	else
		--Display a pop-up where we choose from the Binder pacts
		local tOptions = {}
		tOptions[1] = "Fey Pact";
		tOptions[2] = "Gloom Pact";
		tOptions[3] = "Star Pact";
		local tDialogData = {
			title = Interface.getString("char_build_title_adddbinderpact"),
			msg = Interface.getString("char_build_message_addbinderpact"),
			options = tOptions,
			min = 1,
			max = 1,
			callback = CharClassFeatureDescManager.callbackResolveWarlockHexbladePactSelection,
			custom = { rAdd=rAdd, sClassFeatureOriginalDescription=sClassFeatureOriginalDescription, sClassFeatureName=sClassFeatureName },
		};
		DialogManager.requestSelectionDialog(tDialogData);
	end
end


-------------------------------------------
----- BARBARIAN (BERSERKER) Class Features ----
-------------------------------------------
function addBarbarianBerserkerFeatures(sClassName, rAdd, sClassFeatureName, sClassFeatureFilteredDescription, sClassFeatureOriginalDescription)
	local tCurrentFeatures = DB.getChildren(rAdd.nodeChar, "specialabilitylist");
	if sClassFeatureName == "Heartland" then
		local rCreatedIDChildNode = DB.createChild(rAdd.nodeChar.getPath("specialabilitylist"));
		DB.setValue(rCreatedIDChildNode, "shortcut", "windowreference");
		DB.setValue(rCreatedIDChildNode, "value", "string", sClassFeatureName);
		DB.setValue(rCreatedIDChildNode, "description", "string", removeLinkLists(sClassFeatureOriginalDescription));
		displayClassFeatureSelectionsDialog(rAdd, sClassFeatureOriginalDescription, sClassFeatureName);
	else
		local rCreatedIDChildNode = DB.createChild(rAdd.nodeChar.getPath("specialabilitylist"));
		DB.setValue(rCreatedIDChildNode, "shortcut", "windowreference");
		DB.setValue(rCreatedIDChildNode, "value", "string", sClassFeatureName);
		DB.setValue(rCreatedIDChildNode, "description", "string", sClassFeatureFilteredDescription);
		ChatManager.SystemMessageResource("char_abilities_message_classfeatureadd", sClassFeatureName, rAdd.sCharName);
	end
end

-------------------------------------------
----- DRUID (PROTECTOR) Class Features ----
-------------------------------------------
function addDruidProtectorPreFeatures(sClassName, rAdd, sDescriptionText, tClassFeatures)
	--First, see if you have a druid circle already selected. If you don't, select one, then go through the rest of the features.
	local tCurrentFeatures = DB.getChildren(rAdd.nodeChar, "specialabilitylist");
	local sAlreadyTakenCircle = nil;
	local tCircleNames = { "Circle of Renewal", "Circle of Shelter" };
	for _, featureNode in pairs(tCurrentFeatures) do
		for x,circleName in ipairs(tCircleNames) do
			local sFeatureName = DB.getText(DB.getPath(featureNode, "value"));
			if sFeatureName then
				if string.find(sFeatureName, circleName) then
					sAlreadyTakenCircle = circleName;
					break;
				end
			end
		end
	end
	if not sAlreadyTakenCircle or sAlreadyTakenCircle == "" then
		--Display a pop-up where we choose from the Druid (Protector) circles
		local tOptions = {}
		tOptions[1] = "Circle of Renewal (Primal Guardian)";
		tOptions[2] = "Circle of Shelter (Primal Predator)";
		local tDialogData = {
			title = Interface.getString("char_build_title_addddruidprotectorcircle"),
			msg = Interface.getString("char_build_message_adddruidprotectorcircle"),
			options = tOptions,
			min = 1,
			max = 1,
			callback = CharClassFeatureDescManager.callbackResolveDruidProtectorPreFeatureSelection,
			custom = { sClassName=sClassName, rAdd=rAdd, sDescriptionText=sDescriptionText, tClassFeatures=tClassFeatures },
		};
		DialogManager.requestSelectionDialog(tDialogData);
	end
end
function callbackResolveDruidProtectorPreFeatureSelection(tSelection, tData)
	if not tSelection and #tSelection == 1 then
		ChatManager.SystemMessageResource("char_error_addclasssfeature");
		return;
	end

	local sCircleName = tSelection[1];
	local sCircleDescription = "You have selected the " .. sCircleName .. ". This determines your Druid Circle and Summon Natural Ally.";
	local rCreatedIDChildNode = DB.createChild(tData.rAdd.nodeChar.getPath("specialabilitylist"));
	DB.setValue(rCreatedIDChildNode, "shortcut", "windowreference");
	DB.setValue(rCreatedIDChildNode, "value", "string", sCircleName);
	DB.setValue(rCreatedIDChildNode, "description", "string", sCircleDescription);

	local tCurrentFeatures = DB.getChildren(tData.rAdd.nodeChar, "specialabilitylist");
	for w,v in pairs(tData.tClassFeatures) do
		local sClassFeatureDescriptionPattern = '';
		v = v:gsub("[%(%)%-]", "%%%0");
		if w < #tData.tClassFeatures then
			sClassFeatureDescriptionPattern = "<p>%s*<b>%s*" .. v:gsub("(%a)([%w_']*)", titleCase) .. "%s*</b></p>%s*(.-)<p><b>";
		elseif w == #tData.tClassFeatures then
			-- On the last feature entry, first try reading to the end of the description we're given
			sClassFeatureDescriptionPattern = "<p>%s*<b>%s*" .. v:gsub("(%a)([%w_']*)", titleCase) .. "%s*</b></p>%s*(.+)";
		end
		sClassFeatureSpecificDescriptionText = string.match(tData.sDescriptionText, sClassFeatureDescriptionPattern);
		if sClassFeatureSpecificDescriptionText then
			sClassFeatureFilteredDescriptionText = removeLinkLists(sClassFeatureSpecificDescriptionText);
		end
		--Revert v back to unescaped version
		v = v:gsub("%%", "")
		local isFeatureInList = false;
		for _, featureNode in pairs(tCurrentFeatures) do
			if DB.getText(DB.getPath(featureNode, "value")) == v then
				isFeatureInList = true;
				break;
			end
		end
		if isFeatureInList == false then
			CharClassFeatureDescManager.addClassSpecificFeatures(tData.sClassName, tData.rAdd, v, sClassFeatureFilteredDescriptionText, sClassFeatureSpecificDescriptionText);
		end
	end
end
function addDruidProtectorFeatures(sClassName, rAdd, sClassFeatureName, sClassFeatureFilteredDescription, sClassFeatureOriginalDescription)
	local tCurrentFeatures = DB.getChildren(rAdd.nodeChar, "specialabilitylist");

	if sClassFeatureName:upper() == "DRUID CIRCLE" then
		--Add the feature, but if you have also already added a pact, narrow pact-based features
		local rCreatedIDChildNode = DB.createChild(rAdd.nodeChar.getPath("specialabilitylist"));
		DB.setValue(rCreatedIDChildNode, "shortcut", "windowreference");
		DB.setValue(rCreatedIDChildNode, "value", "string", sClassFeatureName);
		DB.setValue(rCreatedIDChildNode, "description", "string", sClassFeatureFilteredDescription);
		displayDruidProtectorCircleDialog(sClassName, rAdd, sClassFeatureOriginalDescription, sClassFeatureName);
	elseif sClassFeatureName:upper() == "SUMMON NATURAL ALLY" then
		--Add the feature, but if you have also already added a pact, narrow pact-based features
		local rCreatedIDChildNode = DB.createChild(rAdd.nodeChar.getPath("specialabilitylist"));
		DB.setValue(rCreatedIDChildNode, "shortcut", "windowreference");
		DB.setValue(rCreatedIDChildNode, "value", "string", sClassFeatureName);
		DB.setValue(rCreatedIDChildNode, "description", "string", sClassFeatureFilteredDescription);
		displayDruidProtectorCircleDialog(sClassName, rAdd, sClassFeatureOriginalDescription, sClassFeatureName);
	else
		local rCreatedIDChildNode = DB.createChild(rAdd.nodeChar.getPath("specialabilitylist"));
		DB.setValue(rCreatedIDChildNode, "shortcut", "windowreference");
		DB.setValue(rCreatedIDChildNode, "value", "string", sClassFeatureName);
		DB.setValue(rCreatedIDChildNode, "description", "string", sClassFeatureFilteredDescription);
		ChatManager.SystemMessageResource("char_abilities_message_classfeatureadd", sClassFeatureName, rAdd.sCharName);
	end
end
function displayDruidProtectorCircleDialog(sClassName, rAdd, sClassFeatureOriginalDescription, sClassFeatureName)
	--Find out if you have a pact feature already, and if so, add the pact-based feature already
	local tCurrentFeatures = DB.getChildren(rAdd.nodeChar, "specialabilitylist");
	local sAlreadyTakenCircle = nil;
	local tCircleNames = { "Circle of Renewal", "Circle of Shelter" };
	for _, featureNode in pairs(tCurrentFeatures) do
		for x,circleName in ipairs(tCircleNames) do
			local sFeatureName = DB.getText(DB.getPath(featureNode, "value"));
			if sFeatureName then
				if string.find(sFeatureName, circleName) then
					sAlreadyTakenCircle = circleName;
					break;
				end
			end
		end
	end

	if sAlreadyTakenCircle and sAlreadyTakenCircle ~= "" then
		if sClassFeatureName == "Druid Circle" and sClassFeatureOriginalDescription then
			addDruidProtectorDruidCircle(rAdd, sClassFeatureOriginalDescription, sAlreadyTakenCircle);
		elseif sClassFeatureName == "Summon Natural Ally" and sClassFeatureOriginalDescription then
			addDruidProtectorNaturalAlly(rAdd, sClassFeatureOriginalDescription, sAlreadyTakenCircle);
		end
	else
		--Display a pop-up where we choose from the Binder pacts
		local tOptions = {}
		tOptions[1] = "Circle of Renewal (Primal Guardian)";
		tOptions[2] = "Circle of Shelter (Primal Predator)";
		local tDialogData = {
			title = Interface.getString("char_build_title_addddruidprotectorcircle"),
			msg = Interface.getString("char_build_message_adddruidprotectorcircle"),
			options = tOptions,
			min = 1,
			max = 1,
			callback = CharClassFeatureDescManager.callbackResolveDruidProtectorCircleSelection,
			custom = { rAdd=rAdd, sClassFeatureOriginalDescription=sClassFeatureOriginalDescription, sClassFeatureName=sClassFeatureName },
		};
		DialogManager.requestSelectionDialog(tDialogData);
	end
end
function callbackResolveDruidProtectorCircleSelection(tSelection, tData)
	if not tSelection and #tSelection == 1 then
		ChatManager.SystemMessageResource("char_error_addclasssfeature");
		return;
	end
	if #tSelection == 1 then
		if (tData.sClassFeatureName == "Druid Circle" and tData.sClassFeatureOriginalDescription) then
			addDruidProtectorDruidCircle(tData.rAdd, tData.sClassFeatureOriginalDescription, tSelection[1]);
		elseif (tData.sClassFeatureName == "Summon Natural Ally" and tData.sClassFeatureOriginalDescription) then
			addDruidProtectorNaturalAlly(tData.rAdd, tData.sClassFeatureOriginalDescription, tSelection[1]);
		else
			local sCircleName = tSelection[1];
			local sCircleDescription = "You have selected the " .. sCircleName .. ". This determines your Druid Circle and Summon Natural Ally.";
			local rCreatedIDChildNode = DB.createChild(tData.rAdd.nodeChar.getPath("specialabilitylist"));
			DB.setValue(rCreatedIDChildNode, "shortcut", "windowreference");
			DB.setValue(rCreatedIDChildNode, "value", "string", sCircleName);
			DB.setValue(rCreatedIDChildNode, "description", "string", sCircleDescription);
		end
	end
end
function addDruidProtectorDruidCircle(rAdd, sClassFeatureOriginalDescription, selectedCircle)
	local tCurrentFeatures = DB.getChildren(rAdd.nodeChar, "specialabilitylist");
	local isInList = false;
	selectedCircle = selectedCircle:gsub("%(.+%)", "");
	for _, featureNode in pairs(tCurrentFeatures) do
		if DB.getText(DB.getPath(featureNode, "value")) == selectedCircle then
			isInList = true;
			break;
		end
	end
	if not isInList then
		local sPattern = '<link class="powerdesc" recordname="reference.features.(%w+)@([%w%s]+)">';
		local sFeaturesLink = string.gmatch(sClassFeatureOriginalDescription, sPattern);
		for w,v in sFeaturesLink do
			local sPattern = "reference.features." .. w .. "@" .. v;
			local sClassFeatureName = DB.getText(DB.getPath(sPattern, "name"));
			local sClassFeatureDescription = DB.getText(DB.getPath(sPattern, "description"));
			if string.find(sClassFeatureName, selectedCircle, 1, true) then
				local rCreatedIDChildNode = DB.createChild(rAdd.nodeChar.getPath("specialabilitylist"));
				DB.setValue(rCreatedIDChildNode, "shortcut", "windowreference", "powerdesc", sPattern);
				DB.setValue(rCreatedIDChildNode, "value", "string", sClassFeatureName);
				--DB.setValue(rCreatedIDChildNode, "description", "string", sClassFeatureOriginalDescription);
				ChatManager.SystemMessageResource("char_abilities_message_classfeatureadd", sClassFeatureName, rAdd.sCharName);
				break;
			end
		end
	end
end
function addDruidProtectorNaturalAlly(rAdd, sClassFeatureOriginalDescription, selectedCircle)
	local sPrimal = "";
	if selectedCircle:upper() == "CIRCLE OF RENEWAL" then
		sPrimal = "Primal Guardian";
	elseif selectedCircle:upper() == "CIRCLE OF SHELTER" then
		sPrimal = "Primal Predator";
	end
	local tCurrentFeatures = DB.getChildren(rAdd.nodeChar, "specialabilitylist");
	local isInList = false;
	for _, featureNode in pairs(tCurrentFeatures) do
		if string.find(DB.getText(DB.getPath(featureNode, "value")), "Summon Natural Ally" .. " (" .. sPrimal .. ")") then
			isInList = true;
			break;
		end
	end
	if not isInList then
		local sPattern = '<link class="powerdesc" recordname="reference.features.(%w+)@([%w%s]+)">';
		local sFeaturesLink = string.gmatch(sClassFeatureOriginalDescription, sPattern);
		for w,v in sFeaturesLink do
			local sPattern = "reference.features." .. w .. "@" .. v;
			local sClassFeatureName = DB.getText(DB.getPath(sPattern, "name"));
			local sClassFeatureDescription = DB.getText(DB.getPath(sPattern, "description"));
			if string.find(sClassFeatureName, "Summon Natural Ally" .. " (" .. sPrimal .. ")", 1, true) then
				local rCreatedIDChildNode = DB.createChild(rAdd.nodeChar.getPath("specialabilitylist"));
				DB.setValue(rCreatedIDChildNode, "shortcut", "windowreference", "powerdesc", sPattern);
				DB.setValue(rCreatedIDChildNode, "value", "string", sClassFeatureName);
				--DB.setValue(rCreatedIDChildNode, "description", "string", sClassFeatureOriginalDescription);
				ChatManager.SystemMessageResource("char_abilities_message_classfeatureadd", sClassFeatureName, rAdd.sCharName);
				break;
			end
		end
	end
end


-------------------------------------------
----- WIZARD (WITCH) Class Features ----
-------------------------------------------
function addWizardWitchFeatures(sClassName, rAdd, sClassFeatureName, sClassFeatureFilteredDescription, sClassFeatureOriginalDescription)
	local tCurrentFeatures = DB.getChildren(rAdd.nodeChar, "specialabilitylist");
	if sClassFeatureName == "Moon Coven" then
		local rCreatedIDChildNode = DB.createChild(rAdd.nodeChar.getPath("specialabilitylist"));
		DB.setValue(rCreatedIDChildNode, "shortcut", "windowreference");
		DB.setValue(rCreatedIDChildNode, "value", "string", sClassFeatureName);
		DB.setValue(rCreatedIDChildNode, "description", "string", removeLinkLists(sClassFeatureOriginalDescription));
		displayClassFeatureSelectionsDialog(rAdd, sClassFeatureOriginalDescription, sClassFeatureName);
	else
		local rCreatedIDChildNode = DB.createChild(rAdd.nodeChar.getPath("specialabilitylist"));
		DB.setValue(rCreatedIDChildNode, "shortcut", "windowreference");
		DB.setValue(rCreatedIDChildNode, "value", "string", sClassFeatureName);
		DB.setValue(rCreatedIDChildNode, "description", "string", sClassFeatureFilteredDescription);
		ChatManager.SystemMessageResource("char_abilities_message_classfeatureadd", sClassFeatureName, rAdd.sCharName);
	end
end


-------------------------------------------
----- SORCERER (ELEMENTALIST) Class Features ----
-------------------------------------------
function addSorcererElementalistFeatures(sClassName, rAdd, sClassFeatureName, sClassFeatureFilteredDescription, sClassFeatureOriginalDescription)
	local tCurrentFeatures = DB.getChildren(rAdd.nodeChar, "specialabilitylist");
	if sClassFeatureName == "Elemental Specialty" then
		local rCreatedIDChildNode = DB.createChild(rAdd.nodeChar.getPath("specialabilitylist"));
		DB.setValue(rCreatedIDChildNode, "shortcut", "windowreference");
		DB.setValue(rCreatedIDChildNode, "value", "string", sClassFeatureName);
		DB.setValue(rCreatedIDChildNode, "description", "string", removeLinkLists(sClassFeatureOriginalDescription));
		displayClassFeatureSelectionsDialog(rAdd, sClassFeatureOriginalDescription, sClassFeatureName);
	else
		local rCreatedIDChildNode = DB.createChild(rAdd.nodeChar.getPath("specialabilitylist"));
		DB.setValue(rCreatedIDChildNode, "shortcut", "windowreference");
		DB.setValue(rCreatedIDChildNode, "value", "string", sClassFeatureName);
		DB.setValue(rCreatedIDChildNode, "description", "string", sClassFeatureFilteredDescription);
		ChatManager.SystemMessageResource("char_abilities_message_classfeatureadd", sClassFeatureName, rAdd.sCharName);
	end
end


---------------------------------------
-- Utility functions
--
function switch(x, cases)
  local match = cases[x] or cases.default or function() end

  return match()
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

function createSet(tbl)
	local set = {};
	for _, v in ipairs(tbl) do
		set[v] = true;
	end
	return set;
end

--Use like this: string.gsub(str, "(%a)([%w_']*)", titleCase)
function titleCase( first, rest )
   return first:upper()..rest:lower()
end


function deleteFromSpecialAbilities(rAdd, rFeatureNode, sFeatureName)
	if not rAdd then
		ChatManager.SystemMessageResource("char_error_removingclasssfeature");
		return;
	end
	if not rFeatureNode and not sFeatureName then
		ChatManager.SystemMessageResource("char_error_removingclasssfeature");
		return;
	end
	local tCurrentFeatures = DB.getChildren(rAdd.nodeChar, "specialabilitylist");
	for _, featureNode in pairs(tCurrentFeatures) do
		if (rFeatureNode and featureNode == rFeatureNode) or (sFeatureName and DB.getText(DB.getPath(featureNode, "value")) == sFeatureName) then
			DB.deleteNode(featureNode);
		end
	end
end

function matchWholeWord(input_string, word_to_find)
    local pattern = "%f[%w_]" .. word_to_find .. "%f[^%w_]"
    -- string.match returns the captured values or nil. 
    -- Since the frontier patterns have zero width, the captured value is the word itself.
    -- We can wrap the word in capture groups to ensure it is returned.
    return string.match(input_string, "(" .. pattern .. ")")
end