-- 
-- Please see the license.html file included with this distribution for 
-- attribution and copyright information.
--

function addClassSpecificFeatures(sClassName, rAdd, sClassFeatureName, sClassFeatureFilteredDescription, sClassFeatureOriginalDescription)
	switch(sClassName:upper(), 
	{
		--PHB1
		["CLERIC (TEMPLAR)"] = function() return addClericTemplarFeatures(sClassName, rAdd, sClassFeatureName, sClassFeatureFilteredDescription, sClassFeatureOriginalDescription) end,
		["FIGHTER (WEAPONMASTER)"] = function() return addFighterWeaponmasterFeatures(sClassName, rAdd, sClassFeatureName, sClassFeatureFilteredDescription, sClassFeatureOriginalDescription) end,
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
		["CLERIC (WARPRIEST)"] = function() return addClericWarpriestFeatures(sClassName, rAdd, sClassFeatureName, sClassFeatureFilteredDescription, sClassFeatureOriginalDescription) end,
		["FIGHTER (KNIGHT)"] = function() return addFighterKnightFeatures(sClassName, rAdd, sClassFeatureName, sClassFeatureFilteredDescription, sClassFeatureOriginalDescription) end,
		["WIZARD (MAGE)"] = function() return addWizardMageFeatures(sClassName, rAdd, sClassFeatureName, sClassFeatureFilteredDescription, sClassFeatureOriginalDescription) end,
		--HotFK
		["DRUID (SENTINEL)"] = function() return addDruidSentinelFeatures(sClassName, rAdd, sClassFeatureName, sClassFeatureFilteredDescription, sClassFeatureOriginalDescription) end,
		["PALADIN (CAVALIER)"] = function() return addPaladinCavalierFeatures(sClassName, rAdd, sClassFeatureName, sClassFeatureFilteredDescription, sClassFeatureOriginalDescription) end,
		["RANGER (HUNTER)"] = function() return addRangerHunterFeatures(sClassName, rAdd, sClassFeatureName, sClassFeatureFilteredDescription, sClassFeatureOriginalDescription) end,
		["RANGER (SCOUT)"] = function() return addRangerScoutFeatures(sClassName, rAdd, sClassFeatureName, sClassFeatureFilteredDescription, sClassFeatureOriginalDescription) end,		
		default = function() return addDefaultClassFeature(sClassName, rAdd, sClassFeatureName, sClassFeatureFilteredDescription) end
	});
end

function addClassSpecificPreFeatures(sClassName, rAdd, sDescriptionText, tClassFeatures)
	switch(sClassName:upper(), 
	{
		["CLERIC (WARPRIEST)"] = function() return addClericWarpriestPreFeatures(sClassName, rAdd, sDescriptionText, tClassFeatures) end,
		["DRUID (SENTINEL)"] = function() return addDruidSentinelPreFeatures(sClassName, rAdd, sDescriptionText, tClassFeatures) end		
	});
end

function addDefaultClassFeature(sClassName, rAdd, sClassFeatureName, sClassFeatureDescription)
	local rCreatedIDChildNode = DB.createChild(rAdd.nodeChar.getPath("specialabilitylist"));
	DB.setValue(rCreatedIDChildNode, "shortcut", "windowreference");
	DB.setValue(rCreatedIDChildNode, "value", "string", sClassFeatureName);
	DB.setValue(rCreatedIDChildNode, "description", "string", sClassFeatureDescription);
	ChatManager.SystemMessageResource("char_abilities_message_classfeatureadd", sClassFeatureName, rAdd.sCharName);
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
	--Display information on the selections in chat
	-- local sPattern = '<link class="powerdesc" recordname="reference.features.(%w+)@([%w%s]+)">';
	local tCurrentFeatures = DB.getChildren(rAdd.nodeChar, "specialabilitylist");
	for x,y in pairs(tCurrentFeatures) do
		for sAltclassFeatureIndex,sAltclassFeatureName in pairs(tAlternativeClassFeatures) do
			if DB.getText(DB.getPath(y, "value")) == sAltclassFeatureName then
				local tMessageShortcuts = { { class="ref_ability", recordname=DB.getPath(y) } };
				local tMessageData = {font = "systemfont", text = DB.getText(DB.getPath(y, "value")), shortcuts=tMessageShortcuts};
				Comm.addChatMessage(tMessageData);
			end
		end
	end
	--Display a pop-up where we either choose Combat Superiority or Combat Agility
	local tOptions = {}
	local nOptionsCount = 1;
	for sAltclassFeatureIndex,sAltclassFeatureName in pairs(tAlternativeClassFeatures) do
		tOptions[nOptionsCount] = sAltclassFeatureName;
		nOptionsCount = nOptionsCount + 1;
	end
	local tDialogData = {
		title = Interface.getString(sDialogueTitle),
		msg = Interface.getString(sDialogueMsg),
		options = tOptions,
		min = 1,
		max = 1,
		callback = CharClassFeatureManager.callbackResolveAlternativeFeatureDialogSelection,
		custom = { rAdd=rAdd, tAlternativeClassFeatures=tAlternativeClassFeatures },
	};
	DialogManager.requestSelectionDialog(tDialogData);
end
function callbackResolveAlternativeFeatureDialogSelection(tSelection, tData)
	if not tSelection or not tSelection[1]  then
		CharManager.outputUserMessage("char_error_addclasssfeature");
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
					end
				end
			end
		end
	end
end

function displayClassFeatureSelectionsDialog(rAdd, sClassFeatureOriginalDescription, sClassFeatureName, nMaxSelections)
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
		tOptions[nOptionsCount] = sClassFeatureName;
		nOptionsCount = nOptionsCount + 1;
		tClassFeatureOptions[sClassFeatureName] = DB.getPath(sPattern);
		local tMessageShortcuts = { { class="powerdesc", recordname=DB.getPath(sPattern) } };
		local tMessageData = {font = "systemfont", text = sClassFeatureName, shortcuts=tMessageShortcuts};
		Comm.addChatMessage(tMessageData);
	end
	--Display a pop-up where we either choose from the class feature options
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
		callback = CharClassFeatureManager.callbackResolveClassFeatureSelectionsDialogSelection,
		custom = { rAdd = rAdd, tClassFeatureOptions = tClassFeatureOptions }, 
	};
	DialogManager.requestSelectionDialog(tDialogData);	
end
function callbackResolveClassFeatureSelectionsDialogSelection(tSelection, tData)
	if not tSelection or not tSelection[1] then
		CharManager.outputUserMessage("char_error_addclasssfeature");
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
		local rCreatedIDChildNode = DB.createChild(rAdd.nodeChar.getPath("specialabilitylist"));
		DB.setValue(rCreatedIDChildNode, "shortcut", "windowreference");
		DB.setValue(rCreatedIDChildNode, "value", "string", sClassFeatureName);
		DB.setValue(rCreatedIDChildNode, "description", "string", sClassFeatureFilteredDescription);
		ChatManager.SystemMessageResource("char_abilities_message_classfeatureadd", sClassFeatureName, rAdd.sCharName);		
	end
end
function displayClericTemplarHealerLoreDialog(rAdd, sbattleClericLoreReference)
	--Display information on the selections in chat
	local tCurrentFeatures = DB.getChildren(rAdd.nodeChar, "specialabilitylist");
	for x,y in pairs(tCurrentFeatures) do
		if DB.getText(DB.getPath(y, "value")) == "Battle Cleric's Lore" or DB.getText(DB.getPath(y, "value")) == "Healer's Lore" then
			local tMessageShortcuts = { { class="ref_ability", recordname=DB.getPath(y) } };
			if sbattleClericLoreReference and DB.getText(DB.getPath(y, "value")) == "Battle Cleric's Lore" then
				tMessageShortcuts = {{ class="powerdesc", recordname=sbattleClericLoreReference }}
			end
			local tMessageData = {font = "systemfont", text = DB.getText(DB.getPath(y, "value")), shortcuts=tMessageShortcuts};
			Comm.addChatMessage(tMessageData);
		end
	end
	--Display a pop-up where we either choose Healer's Lore or Battle Cleric's Lore
	local tOptions = {}
	tOptions[1] = "Healer's Lore";
	tOptions[2] = "Battle Cleric's Lore";
	local tDialogData = {
		title = Interface.getString("char_build_title_addhealerlore"),
		msg = Interface.getString("char_build_message_addhealerorbattlelore"),
		options = tOptions,
		min = 1,
		max = 1,
		callback = CharClassFeatureManager.callbackResolveClericHealerLoreDialogSelection,
		custom = rAdd,
	};
	DialogManager.requestSelectionDialog(tDialogData);
end
function callbackResolveClericHealerLoreDialogSelection(tSelection, rAdd, tSelectionLinks)
	if not tSelectionLinks then
		CharManager.outputUserMessage("char_error_addclasssfeature");
		return;
	end
	if not tSelection then
		CharManager.outputUserMessage("char_error_addclasssfeature");
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
	--Display information on the selections in chat
	local tCurrentFeatures = DB.getChildren(rAdd.nodeChar, "specialabilitylist");
	for x,y in pairs(tCurrentFeatures) do
		if DB.getText(DB.getPath(y, "value")) == "Battle Cleric's Lore" or DB.getText(DB.getPath(y, "value")) == "Healer's Lore" then
			local tMessageShortcuts = { { class="ref_ability", recordname=DB.getPath(y) } };
			if sbattleClericLoreReference and DB.getText(DB.getPath(y, "value")) == "Battle Cleric's Lore" then
				tMessageShortcuts = {{ class="powerdesc", recordname=sbattleClericLoreReference }}
			end
			local tMessageData = {font = "systemfont", text = DB.getText(DB.getPath(y, "value")), shortcuts=tMessageShortcuts};
			Comm.addChatMessage(tMessageData);
		end
	end

	--Display a pop-up where we either choose Divine Fortune or Favor of the Gods for Cleric Channel Divinity
	local tOptions = {}
	tOptions[1] = "Channel Divinity:Divine Fortune";
	tOptions[2] = "Channel Divinity:Favor of the Gods";
	local tDialogData = {
		title = Interface.getString("char_build_title_addhealerlore"),
		msg = Interface.getString("char_build_message_addhealerorbattlelore"),
		options = tOptions,
		min = 1,
		max = 1,
		callback = CharClassFeatureManager.callbackResolveClericChannelDivinity,
		custom = rAdd,
	};
	DialogManager.requestSelectionDialog(tDialogData);

	--Display a pop-up where we either choose Turn Undead, Healer's Mercy, or Punish the Profane for Cleric Channel Divinity
	local tOptions = {}
	tOptions[1] = "Channel Divinity:Turn Undead";
	tOptions[2] = "Channel Divinity:Healer's Mercy";
	tOptions[3] = "Channel Divinity:Punish the Profane";
	local tDialogData = {
		title = Interface.getString("char_build_title_addhealerlore"),
		msg = Interface.getString("char_build_message_addhealerorbattlelore"),
		options = tOptions,
		min = 1,
		max = 1,
		callback = CharClassFeatureManager.callbackResolveClericChannelDivinity,
		custom = rAdd,
	};
	DialogManager.requestSelectionDialog(tDialogData);
end
function callbackResolveClericChannelDivinity(tSelection, rAdd, tSelectionLinks)
	if not tSelectionLinks then
		CharManager.outputUserMessage("char_error_addclasssfeature");
		return;
	end
	if not tSelection then
		CharManager.outputUserMessage("char_error_addclasssfeature");
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
		local rCreatedIDChildNode = DB.createChild(rAdd.nodeChar.getPath("specialabilitylist"));
		DB.setValue(rCreatedIDChildNode, "shortcut", "windowreference");
		DB.setValue(rCreatedIDChildNode, "value", "string", sClassFeatureName);
		DB.setValue(rCreatedIDChildNode, "description", "string", sClassFeatureFilteredDescription);
		for _, featureNode in pairs(tCurrentFeatures) do
			if DB.getText(DB.getPath(featureNode, "value")) == "Combat Superiority" then
				displayAlternativeFeatureDialog(rAdd, tAlternativeClassFeaturesOptions, tStringCharBuildData);
				break;
			end
		end
	elseif sClassFeatureName == "Combat Superiority" then
		--Add the feature, but if you have also already added Combat Agility, choose between them
		local rCreatedIDChildNode = DB.createChild(rAdd.nodeChar.getPath("specialabilitylist"));
		DB.setValue(rCreatedIDChildNode, "shortcut", "windowreference");
		DB.setValue(rCreatedIDChildNode, "value", "string", sClassFeatureName);
		DB.setValue(rCreatedIDChildNode, "description", "string", sClassFeatureFilteredDescription);
		for _, featureNode in pairs(tCurrentFeatures) do
			if DB.getText(DB.getPath(featureNode, "value")) == "Combat Agility" then
				displayAlternativeFeatureDialog(rAdd, tAlternativeClassFeaturesOptions, tStringCharBuildData);
				break;
			end
		end
	elseif sClassFeatureName == "Fighter Talents" then
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

-------------------------------------------
----- Ranger Class Features ----
-------------------------------------------
function addRangerFeatures(sClassName, rAdd, sClassFeatureName, sClassFeatureFilteredDescription, sClassFeatureOriginalDescription)
	local tCurrentFeatures = DB.getChildren(rAdd.nodeChar, "specialabilitylist");
	if sClassFeatureName == "Prime Shot" then
		--Add the feature, but if you have also already added Running Attack, choose between them
		local rCreatedIDChildNode = DB.createChild(rAdd.nodeChar.getPath("specialabilitylist"));
		DB.setValue(rCreatedIDChildNode, "shortcut", "windowreference");
		DB.setValue(rCreatedIDChildNode, "value", "string", sClassFeatureName);
		DB.setValue(rCreatedIDChildNode, "description", "string", sClassFeatureFilteredDescription);
		for _, featureNode in pairs(tCurrentFeatures) do
			if DB.getText(DB.getPath(featureNode, "value")) == "Running Attack" then
				displayRangerPrimeShotDialog(rAdd);
				break;
			end
		end
	elseif sClassFeatureName == "Running Attack" then
		--Add the feature, but if you have also already added Prime Shot, choose between them
		local rCreatedIDChildNode = DB.createChild(rAdd.nodeChar.getPath("specialabilitylist"));
		DB.setValue(rCreatedIDChildNode, "shortcut", "windowreference");
		DB.setValue(rCreatedIDChildNode, "value", "string", sClassFeatureName);
		DB.setValue(rCreatedIDChildNode, "description", "string", sClassFeatureFilteredDescription);
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
		local rCreatedIDChildNode = DB.createChild(rAdd.nodeChar.getPath("specialabilitylist"));
		DB.setValue(rCreatedIDChildNode, "shortcut", "windowreference");
		DB.setValue(rCreatedIDChildNode, "value", "string", sClassFeatureName);
		DB.setValue(rCreatedIDChildNode, "description", "string", sClassFeatureFilteredDescription);
		displayRangerFightingStyleDialog(rAdd, sClassFeatureOriginalDescription);
	else
		local rCreatedIDChildNode = DB.createChild(rAdd.nodeChar.getPath("specialabilitylist"));
		DB.setValue(rCreatedIDChildNode, "shortcut", "windowreference");
		DB.setValue(rCreatedIDChildNode, "value", "string", sClassFeatureName);
		DB.setValue(rCreatedIDChildNode, "description", "string", sClassFeatureFilteredDescription);
		ChatManager.SystemMessageResource("char_abilities_message_classfeatureadd", sClassFeatureName, rAdd.sCharName);
	end
end
function displayRangerPrimeShotDialog(rAdd, sClassFeatureOriginalDescription)
	--Display information on the selections in chat
	local sPattern = '<link class="powerdesc" recordname="reference.features.(%w+)@([%w%s]+)">';
	local tCurrentFeatures = DB.getChildren(rAdd.nodeChar, "specialabilitylist");
	local isBeastMasterySelected = false;
	for x,y in pairs(tCurrentFeatures) do
		if DB.getText(DB.getPath(y, "value")) == "Beast Mastery" then
			isBeastMasterySelected = true;
		end
		if DB.getText(DB.getPath(y, "value")) == "Prime Shot" or DB.getText(DB.getPath(y, "value")) == "Running Attack" then
			local tMessageShortcuts = { { class="ref_ability", recordname=DB.getPath(y) } };
			local tMessageData = {font = "systemfont", text = DB.getText(DB.getPath(y, "value")), shortcuts=tMessageShortcuts};
			Comm.addChatMessage(tMessageData);
		end
	end
	--Display a pop-up where we either choose Prime Shot or Running Attack, 
	-- unless they've already selected the Beast Mastery Fighting Style
	local tOptions = {}
	if isBeastMasterySelected then
		tOptions[1] = "Beast Mastery";
	else
		tOptions[1] = "Prime Shot";
		tOptions[2] = "Running Attack";
		tOptions[3] = "Beast Mastery";
	end
	local tDialogData = {
		title = Interface.getString("char_build_title_addprimeshot"),
		msg = Interface.getString("char_build_message_addprimeshotorrunningattack"),
		options = tOptions,
		min = 1,
		max = 1,
		callback = CharClassFeatureManager.callbackResolveRangerPrimeShotDialogSelection,
		custom = rAdd,
	};
	DialogManager.requestSelectionDialog(tDialogData);
end
function callbackResolveRangerPrimeShotDialogSelection(tSelection, rAdd)
	if not tSelection or not tSelection[1] then
		CharManager.outputUserMessage("char_error_addclasssfeature");
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
		tOptions[nOptionsCount] = sClassFeatureName;
		nOptionsCount = nOptionsCount + 1;
		tFightingStyleOptions[sClassFeatureName] = DB.getPath(sPattern);
		local tMessageShortcuts = { { class="powerdesc", recordname=DB.getPath(sPattern) } };
		local tMessageData = {font = "systemfont", text = sClassFeatureName, shortcuts=tMessageShortcuts};
		Comm.addChatMessage(tMessageData);
	end
	--Display a pop-up where we choose from the fighting styles
	local tDialogData = {
		title = Interface.getString("char_build_title_addfightingstyle"),
		msg = Interface.getString("char_build_message_addfightingstyle"),
		options = tOptions,
		min = 1,
		max = 1,
		callback = CharClassFeatureManager.callbackResolveFightingStyleDialogSelection,
		custom = { rAdd = rAdd, tFightingStyleOptions = tFightingStyleOptions }, 
	};
	DialogManager.requestSelectionDialog(tDialogData);	
end
function callbackResolveFightingStyleDialogSelection(tSelection, tData)
	if not tSelection or not tSelection[1] then
		CharManager.outputUserMessage("char_error_addclasssfeature");
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
	--Display information on the selections in chat
	local sPattern = '<link class="powerdesc" recordname="reference.features.(%w+)@([%w%s]+)">';
	local tCurrentFeatures = DB.getChildren(rAdd.nodeChar, "specialabilitylist");
	for x,y in pairs(tCurrentFeatures) do
		if DB.getText(DB.getPath(y, "value")) == "Standard Warlord Armor Features" or DB.getText(DB.getPath(y, "value")) == "Archer Warlord" then
			local tMessageShortcuts = { { class="ref_ability", recordname=DB.getPath(y) } };
			local tMessageData = {font = "systemfont", text = DB.getText(DB.getPath(y, "value")), shortcuts=tMessageShortcuts};
			Comm.addChatMessage(tMessageData);
		end
	end
	--Display a pop-up where we either choose Standard Warlord Armor Features or Archer Warlord
	local tOptions = {}
	tOptions[1] = "Standard Warlord Armor Features";
	tOptions[2] = "Archer Warlord";
	local tDialogData = {
		title = Interface.getString("char_build_title_addarcherwarlord"),
		msg = Interface.getString("char_build_message_addarcherwarlord"),
		options = tOptions,
		min = 1,
		max = 1,
		callback = CharClassFeatureManager.callbackResolveWarlordMarshalArcherWarlordDialogSelection,
		custom = rAdd,
	};
	DialogManager.requestSelectionDialog(tDialogData);
end
function callbackResolveWarlordMarshalArcherWarlordDialogSelection(tSelection, rAdd)
	if not tSelection or not tSelection[1] then
		CharManager.outputUserMessage("char_error_addclasssfeature");
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
		displayClassFeatureSelectionsDialog(rAdd, sClassFeatureOriginalDescription, sClassFeatureName);
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
function displaySorcererSpellSourceDialog(rAdd, sClassFeatureOriginalDescription)
	local tSpellSourceOptions = {};
	local tOptions = {};
	local tAllOptions = {};
	local tAllDBReferenceOptions = {};
	--Start with the Sorcerer class features we already know about
	local tExistingSpellSources = { "Cosmic Magic", "Dragon Magic", "Storm Magic", "Wild Magic" };
	--Display information on the selections in chat
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
			tOptions[nOptionsCount] = sClassFeatureName;
			nOptionsCount = nOptionsCount + 1;
			tSpellSourceOptions[sClassFeatureName] = DB.getPath(sPattern);
			local tMessageShortcuts = { { class="powerdesc", recordname=DB.getPath(sPattern) } };
			local tMessageData = {font = "systemfont", text = sClassFeatureName, shortcuts=tMessageShortcuts};
			Comm.addChatMessage(tMessageData);
		else
			tAllOptions[nAllOptionsCount] = sClassFeatureName;
			nAllOptionsCount = nAllOptionsCount + 1;
			tAllDBReferenceOptions[sClassFeatureName] = DB.getPath(sPattern);
		end
	end
	--Display a pop-up where we choose from the sorcerer spell sources
	local tDialogData = {
		title = Interface.getString("char_build_title_addfightingstyle"),
		msg = Interface.getString("char_build_message_addfightingstyle"),
		options = tOptions,
		min = 1,
		max = 1,
		callback = CharClassFeatureManager.callbackResolveSorcererSpellSourceSelectionsDialogSelection,
		custom = { rAdd = rAdd, tClassFeatureOptions = tSpellSourceOptions, tAllOptions=tAllOptions, tAllDBReferenceOptions=tAllDBReferenceOptions }, 
	};
	DialogManager.requestSelectionDialog(tDialogData);	
end
function callbackResolveSorcererSpellSourceSelectionsDialogSelection(tSelection, tData)
	if not tSelection or not tSelection[1] then
		CharManager.outputUserMessage("char_error_addclasssfeature");
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
	--Display information on the selections in chat
	local tCurrentFeatures = DB.getChildren(rAdd.nodeChar, "specialabilitylist");
	for x,y in pairs(tCurrentFeatures) do
		if DB.getText(DB.getPath(y, "value")) == "Battle Cleric's Lore" or DB.getText(DB.getPath(y, "value")) == "Healer's Lore" then
			local tMessageShortcuts = { { class="ref_ability", recordname=DB.getPath(y) } };
			if sbattleClericLoreReference and DB.getText(DB.getPath(y, "value")) == "Battle Cleric's Lore" then
				tMessageShortcuts = {{ class="powerdesc", recordname=sbattleClericLoreReference }}
			end
			local tMessageData = {font = "systemfont", text = DB.getText(DB.getPath(y, "value")), shortcuts=tMessageShortcuts};
			Comm.addChatMessage(tMessageData);
		end
	end

	--Display a pop-up where we either choose Resistive Formula or Shielding Elixer healing infusion
	local tOptions = {}
	tOptions[1] = "Healing Infusion: Resistive Formula";
	tOptions[2] = "Healing Infusion: Shielding Elixir";
	local tDialogData = {
		title = Interface.getString("char_build_title_addartificerhealinginfusion"),
		msg = Interface.getString("char_build_message_addartificerhealinginfusion"),
		options = tOptions,
		min = 1,
		max = 1,
		callback = CharClassFeatureManager.callbackResolveArtificerHealingInfusion,
		custom = rAdd,
	};
	DialogManager.requestSelectionDialog(tDialogData);
end
function callbackResolveArtificerHealingInfusion(tSelection, rAdd, tSelectionLinks)
	if not tSelectionLinks then
		CharManager.outputUserMessage("char_error_addclasssfeature");
		return;
	end
	if not tSelection then
		CharManager.outputUserMessage("char_error_addclasssfeature");
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
	local tDomainNames = { "Correlon", "Death", "Domination", "Earth", "Oghma", "Selune", "Storm", "Sun", "Torm" };
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
		--Display a pop-up where we either choose from the Warpriest domains
		local tOptions = {}
		tOptions[1] = "Correlon";
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
			callback = CharClassFeatureManager.callbackResolveClericWarpriestPreFeatureSelection,
			custom = { sClassName=sClassName, rAdd=rAdd, sDescriptionText=sDescriptionText, tClassFeatures=tClassFeatures },
		};
		DialogManager.requestSelectionDialog(tDialogData);
	end
end
function callbackResolveClericWarpriestPreFeatureSelection(tSelection, tData)
	if not tSelection and #tSelection == 1 then
		CharManager.outputUserMessage("char_error_addclasssfeature");
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
			CharClassFeatureManager.addClassSpecificFeatures(tData.sClassName, tData.rAdd, v, sClassFeatureFilteredDescriptionText, sClassFeatureSpecificDescriptionText);
		end
	end
end

function addClericWarpriestFeatures(sClassName, rAdd, sClassFeatureName, sClassFeatureFilteredDescription, sClassFeatureOriginalDescription)
	local tCurrentFeatures = DB.getChildren(rAdd.nodeChar, "specialabilitylist");

	if sClassFeatureName == "Channel Divinity Powers" then
		--Add the feature, but if you have also already added a domain, narrow domain and channel divinity features
		local rCreatedIDChildNode = DB.createChild(rAdd.nodeChar.getPath("specialabilitylist"));
		DB.setValue(rCreatedIDChildNode, "shortcut", "windowreference");
		DB.setValue(rCreatedIDChildNode, "value", "string", sClassFeatureName);
		DB.setValue(rCreatedIDChildNode, "description", "string", sClassFeatureFilteredDescription);
		displayClericWarpriestDomainDialog(sClassName, rAdd, sClassFeatureOriginalDescription, sClassFeatureName);
	elseif sClassFeatureName == "Domain Features" then
		--Add the feature, but if you have also already added a domain, narrow domain and channel divinity features
		local rCreatedIDChildNode = DB.createChild(rAdd.nodeChar.getPath("specialabilitylist"));
		DB.setValue(rCreatedIDChildNode, "shortcut", "windowreference");
		DB.setValue(rCreatedIDChildNode, "value", "string", sClassFeatureName);
		DB.setValue(rCreatedIDChildNode, "description", "string", sClassFeatureFilteredDescription);
		displayClericWarpriestDomainDialog(sClassName, rAdd, sClassFeatureOriginalDescription, sClassFeatureName);
	else
		local rCreatedIDChildNode = DB.createChild(rAdd.nodeChar.getPath("specialabilitylist"));
		DB.setValue(rCreatedIDChildNode, "shortcut", "windowreference");
		DB.setValue(rCreatedIDChildNode, "value", "string", sClassFeatureName);
		DB.setValue(rCreatedIDChildNode, "description", "string", sClassFeatureFilteredDescription);
		ChatManager.SystemMessageResource("char_abilities_message_classfeatureadd", sClassFeatureName, rAdd.sCharName);
	end
end
function displayClericWarpriestDomainDialog(sClassName, rAdd, sClassFeatureOriginalDescription, sClassFeatureName)
	--Find out if you have a domain feature already, and if so, add the domain feature already
	local tCurrentFeatures = DB.getChildren(rAdd.nodeChar, "specialabilitylist");
	local sAlreadyTakenDomain = "";
	local tDomainNames = { "Correlon", "Death", "Domination", "Earth", "Oghma", "Selune", "Storm", "Sun", "Torm" };
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
		--Display a pop-up where we either choose from the Warpriest domains
		local tOptions = {}
		tOptions[1] = "Correlon";
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
			callback = CharClassFeatureManager.callbackResolveClericWarpriestDomainSelection,
			custom = { rAdd=rAdd, sClassFeatureOriginalDescription=sClassFeatureOriginalDescription, sClassFeatureName=sClassFeatureName },
		};
		DialogManager.requestSelectionDialog(tDialogData);
	end
end
function callbackResolveClericWarpriestDomainSelection(tSelection, tData)
	if not tSelection and #tSelection == 1 then
		CharManager.outputUserMessage("char_error_addclasssfeature");
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
			if sClassFeatureName == sSelectedDomain .. " Domain Features and Powers" then
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
			displayFighterKnightFeywildGuardianDialog(rAdd, removeLinkLists(sClassFeatureOriginalDescription));
		else
			local rCreatedIDChildNode = DB.createChild(rAdd.nodeChar.getPath("specialabilitylist"));
			DB.setValue(rCreatedIDChildNode, "shortcut", "windowreference");
			DB.setValue(rCreatedIDChildNode, "value", "string", sClassFeatureName);
			DB.setValue(rCreatedIDChildNode, "description", "string", removeLinkLists(sClassFeatureOriginalDescription));
		end
	else
		local rCreatedIDChildNode = DB.createChild(rAdd.nodeChar.getPath("specialabilitylist"));
		DB.setValue(rCreatedIDChildNode, "shortcut", "windowreference");
		DB.setValue(rCreatedIDChildNode, "value", "string", sClassFeatureName);
		DB.setValue(rCreatedIDChildNode, "description", "string", sClassFeatureFilteredDescription);
		ChatManager.SystemMessageResource("char_abilities_message_classfeatureadd", sClassFeatureName, rAdd.sCharName);
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
		callback = CharClassFeatureManager.callbackResolveFighterKnightBattleGuardianSelection,
		custom = { rAdd=rAdd, sClassFeatureOriginalDescription=sClassFeatureOriginalDescription },
	};
	DialogManager.requestSelectionDialog(tDialogData);
end
function callbackResolveFighterKnightBattleGuardianSelection(tSelection, tData)
	if not tSelection and #tSelection == 1 then
		CharManager.outputUserMessage("char_error_addclasssfeature");
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
		local sClassFeatureDescription = tData.sClassFeatureOriginalDescription;
		if tSelection[1] == "Feywild Guardian" then
			sClassFeatureDescription = "Eladrin can choose to gain the Feywild Guardian power in place of Battle Guardian.\n\n - Feywild Guardian";
		end
		local rCreatedIDChildNode = DB.createChild(tData.rAdd.nodeChar.getPath("specialabilitylist"));
		DB.setValue(rCreatedIDChildNode, "shortcut", "windowreference");
		DB.setValue(rCreatedIDChildNode, "value", "string", sClassFeatureName);
		DB.setValue(rCreatedIDChildNode, "description", "string", sClassFeatureDescription);
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
----- DRUID (SENTINEL) Class Features ----
-------------------------------------------
function addDruidSentinelPreFeatures(sClassName, rAdd, sDescriptionText, tClassFeatures)
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
		--Display a pop-up where we either choose from the Druid seasons
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
			callback = CharClassFeatureManager.callbackResolveDruidSentinelPreFeatureSelection,
			custom = { sClassName=sClassName, rAdd=rAdd, sDescriptionText=sDescriptionText, tClassFeatures=tClassFeatures },
		};
		DialogManager.requestSelectionDialog(tDialogData);
	end
end
function callbackResolveDruidSentinelPreFeatureSelection(tSelection, tData)
	if not tSelection and #tSelection == 1 then
		CharManager.outputUserMessage("char_error_addclasssfeature");
		return;
	end

	local sSeasonDescription = "You have selected the season of " .. tSelection[1] .. ".";
	local rCreatedIDChildNode = DB.createChild(tData.rAdd.nodeChar.getPath("specialabilitylist"));
	DB.setValue(rCreatedIDChildNode, "shortcut", "windowreference");
	DB.setValue(rCreatedIDChildNode, "value", "string", "Season of " .. tSelection[1]);
	DB.setValue(rCreatedIDChildNode, "description", "string", sSeasonDescription);

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
			CharClassFeatureManager.addClassSpecificFeatures(tData.sClassName, tData.rAdd, v, sClassFeatureFilteredDescriptionText, sClassFeatureSpecificDescriptionText);
		end
	end
end

function addDruidSentinelFeatures(sClassName, rAdd, sClassFeatureName, sClassFeatureFilteredDescription, sClassFeatureOriginalDescription)
	local tCurrentFeatures = DB.getChildren(rAdd.nodeChar, "specialabilitylist");

	if sClassFeatureName == "Acolyte of the Natural Cycle" then
		--Add the feature, but if you have also already added a season, narrow domain and channel divinity features
		local rCreatedIDChildNode = DB.createChild(rAdd.nodeChar.getPath("specialabilitylist"));
		DB.setValue(rCreatedIDChildNode, "shortcut", "windowreference");
		DB.setValue(rCreatedIDChildNode, "value", "string", sClassFeatureName);
		DB.setValue(rCreatedIDChildNode, "description", "string", sClassFeatureFilteredDescription);
		displayDruidSentinelSeasonDialog(sClassName, rAdd, sClassFeatureOriginalDescription, sClassFeatureName);
	elseif sClassFeatureName == "Animal Companion" then
		--Add the feature, but if you have also already added a season, narrow domain and channel divinity features
		local rCreatedIDChildNode = DB.createChild(rAdd.nodeChar.getPath("specialabilitylist"));
		DB.setValue(rCreatedIDChildNode, "shortcut", "windowreference");
		DB.setValue(rCreatedIDChildNode, "value", "string", sClassFeatureName);
		DB.setValue(rCreatedIDChildNode, "description", "string", sClassFeatureFilteredDescription);
		displayDruidSentinelSeasonDialog(sClassName, rAdd, sClassFeatureOriginalDescription, sClassFeatureName);
	elseif sClassFeatureName == "Druid Wilderness Knacks" then
		--Add the feature, but if you have also already added a season, narrow domain and channel divinity features
		local rCreatedIDChildNode = DB.createChild(rAdd.nodeChar.getPath("specialabilitylist"));
		DB.setValue(rCreatedIDChildNode, "shortcut", "windowreference");
		DB.setValue(rCreatedIDChildNode, "value", "string", sClassFeatureName);
		DB.setValue(rCreatedIDChildNode, "description", "string", sClassFeatureFilteredDescription);
		displayClassFeatureSelectionsDialog(rAdd, sClassFeatureOriginalDescription, sClassFeatureName, 2);		
	else
		local rCreatedIDChildNode = DB.createChild(rAdd.nodeChar.getPath("specialabilitylist"));
		DB.setValue(rCreatedIDChildNode, "shortcut", "windowreference");
		DB.setValue(rCreatedIDChildNode, "value", "string", sClassFeatureName);
		DB.setValue(rCreatedIDChildNode, "description", "string", sClassFeatureFilteredDescription);
		ChatManager.SystemMessageResource("char_abilities_message_classfeatureadd", sClassFeatureName, rAdd.sCharName);
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
			addClericDruidSentinelAnimalCompanion(rAdd, sClassFeatureOriginalDescription, sAlreadyTakenSeason);
		end
	else
		--Display a pop-up where we either choose from the Warpriest domains
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
			callback = CharClassFeatureManager.callbackResolveClericWarpriestDomainSelection,
			custom = { rAdd=rAdd, sClassFeatureOriginalDescription=sClassFeatureOriginalDescription, sClassFeatureName=sClassFeatureName },
		};
		DialogManager.requestSelectionDialog(tDialogData);
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
function addClericDruidSentinelAnimalCompanion(rAdd, sClassFeatureOriginalDescription, sSelectedSeason)
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
----- PALADIN (CAVALIER) Class Features ----
-------------------------------------------
function addPaladinCavalierFeatures(sClassName, rAdd, sClassFeatureName, sClassFeatureFilteredDescription, sClassFeatureOriginalDescription)
	local tCurrentFeatures = DB.getChildren(rAdd.nodeChar, "specialabilitylist");
	if sClassFeatureName == "Spirit of Virtue" then
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
		DB.setValue(rCreatedIDChildNode, "description", "string", removeLinkLists(sClassFeatureOriginalDescription));
		displayClassFeatureSelectionsDialog(rAdd, sClassFeatureOriginalDescription, sClassFeatureName, 2);
	else
		local rCreatedIDChildNode = DB.createChild(rAdd.nodeChar.getPath("specialabilitylist"));
		DB.setValue(rCreatedIDChildNode, "shortcut", "windowreference");
		DB.setValue(rCreatedIDChildNode, "value", "string", sClassFeatureName);
		DB.setValue(rCreatedIDChildNode, "description", "string", sClassFeatureFilteredDescription);
		ChatManager.SystemMessageResource("char_abilities_message_classfeatureadd", sClassFeatureName, rAdd.sCharName);
	end
end



-------------------------------------------
----- RANGER (SC0UT) Class Features ----
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
		DB.setValue(rCreatedIDChildNode, "description", "string", removeLinkLists(sClassFeatureOriginalDescription));
		displayClassFeatureSelectionsDialog(rAdd, sClassFeatureOriginalDescription, sClassFeatureName, 2);
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