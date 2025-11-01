-- 
-- Please see the license.html file included with this distribution for 
-- attribution and copyright information.
--

function addClassSpecificFeatures(sClassName, rAdd, sClassFeatureName, sClassFeatureFilteredDescription, sClassFeatureOriginalDescription)
	switch(sClassName:upper(), 
	{
		["CLERIC (TEMPLAR)"] = function() return addClericTemplarFeatures(sClassName, rAdd, sClassFeatureName, sClassFeatureFilteredDescription, sClassFeatureOriginalDescription) end,
		["FIGHTER (WEAPONMASTER)"] = function() return addFighterWeaponmasterFeatures(sClassName, rAdd, sClassFeatureName, sClassFeatureFilteredDescription, sClassFeatureOriginalDescription) end,
		["RANGER"] = function() return addRangerFeatures(sClassName, rAdd, sClassFeatureName, sClassFeatureFilteredDescription, sClassFeatureOriginalDescription) end,
		default = function() return addDefaultClassFeature(sClassName, rAdd, sClassFeatureName, sClassFeatureFilteredDescription) end
	});
end

function addDefaultClassFeature(sClassName, rAdd, sClassFeatureName, sClassFeatureDescription)
	local rCreatedIDChildNode = DB.createChild(rAdd.nodeChar.getPath("specialabilitylist"));
	DB.setValue(rCreatedIDChildNode, "shortcut", "windowreference");
	DB.setValue(rCreatedIDChildNode, "value", "string", sClassFeatureName);
	DB.setValue(rCreatedIDChildNode, "description", "string", sClassFeatureDescription);
	ChatManager.SystemMessageResource("char_abilities_message_classfeatureadd", sClassFeatureName, rAdd.sCharName);
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
		-- if tSelection[1] == "Channel Divinity:Divine Fortune" then
		-- 	for _, featureNode in pairs(tCurrentFeatures) do
		-- 		if DB.getText(DB.getPath(featureNode, "value")) == "Battle Cleric's Lore" then
		-- 			DB.deleteNode(featureNode);
		-- 			break;
		-- 		end
		-- 	end
		-- elseif tSelection[1] == "Battle Cleric's Lore" then
		-- 		for _, featureNode in pairs(tCurrentFeatures) do
		-- 		if DB.getText(DB.getPath(featureNode, "value")) == "Healer's Lore" then
		-- 			DB.deleteNode(featureNode);
		-- 			break;
		-- 		end
		-- 	end
		-- end
	end
end
function callbackResolveClericCDTurnUndeadSelection(tSelection, rAdd, tSelectionLinks)
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
					break;
				end
			end
		elseif tSelection[1] == "Battle Cleric's Lore" then
				for _, featureNode in pairs(tCurrentFeatures) do
				if DB.getText(DB.getPath(featureNode, "value")) == "Healer's Lore" then
					DB.deleteNode(featureNode);
					break;
				end
			end
		end
	end
end

------------------------------------------------
----- Fighter (Weaponmaster) Class Features ----
------------------------------------------------
function addFighterWeaponmasterFeatures(sClassName, rAdd, sClassFeatureName, sClassFeatureFilteredDescription, sClassFeatureOriginalDescription)
	local tCurrentFeatures = DB.getChildren(rAdd.nodeChar, "specialabilitylist");
	if sClassFeatureName == "Combat Agility" then
		--Add the feature, but if you have also already added Combat Superiority, choose between them
		local rCreatedIDChildNode = DB.createChild(rAdd.nodeChar.getPath("specialabilitylist"));
		DB.setValue(rCreatedIDChildNode, "shortcut", "windowreference");
		DB.setValue(rCreatedIDChildNode, "value", "string", sClassFeatureName);
		DB.setValue(rCreatedIDChildNode, "description", "string", sClassFeatureFilteredDescription);
		for _, featureNode in pairs(tCurrentFeatures) do
			if DB.getText(DB.getPath(featureNode, "value")) == "Combat Superiority" then
				displayFighterWeaponmasterCombatSuperiorityDialog(rAdd);
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
				displayFighterWeaponmasterCombatSuperiorityDialog(rAdd);
				break;
			end
		end
	elseif sClassFeatureName == "Fighter Talents" then
		-- Add the feature and choose between all of the fighter talents
		local rCreatedIDChildNode = DB.createChild(rAdd.nodeChar.getPath("specialabilitylist"));
		DB.setValue(rCreatedIDChildNode, "shortcut", "windowreference");
		DB.setValue(rCreatedIDChildNode, "value", "string", sClassFeatureName);
		DB.setValue(rCreatedIDChildNode, "description", "string", sClassFeatureOriginalDescription);
		displayFighterWeaponmasterFighterTalentsDialog(rAdd, sClassFeatureOriginalDescription);
	else
		local rCreatedIDChildNode = DB.createChild(rAdd.nodeChar.getPath("specialabilitylist"));
		DB.setValue(rCreatedIDChildNode, "shortcut", "windowreference");
		DB.setValue(rCreatedIDChildNode, "value", "string", sClassFeatureName);
		DB.setValue(rCreatedIDChildNode, "description", "string", sClassFeatureFilteredDescription);
		ChatManager.SystemMessageResource("char_abilities_message_classfeatureadd", sClassFeatureName, rAdd.sCharName);
	end
end
function displayFighterWeaponmasterCombatSuperiorityDialog(rAdd, sClassFeatureOriginalDescription)
	--Display information on the selections in chat
	local sPattern = '<link class="powerdesc" recordname="reference.features.(%w+)@([%w%s]+)">';
	local tCurrentFeatures = DB.getChildren(rAdd.nodeChar, "specialabilitylist");
	for x,y in pairs(tCurrentFeatures) do
		if DB.getText(DB.getPath(y, "value")) == "Combat Agility" or DB.getText(DB.getPath(y, "value")) == "Combat Superiority" then
			local tMessageShortcuts = { { class="ref_ability", recordname=DB.getPath(y) } };
			local tMessageData = {font = "systemfont", text = DB.getText(DB.getPath(y, "value")), shortcuts=tMessageShortcuts};
			Comm.addChatMessage(tMessageData);
		end
	end
	--Display a pop-up where we either choose Combat Superiority or Combat Agility
	local tOptions = {}
	tOptions[1] = "Combat Superiority";
	tOptions[2] = "Combat Agility";
	local tDialogData = {
		title = Interface.getString("char_build_title_addcombatsuperiority"),
		msg = Interface.getString("char_build_message_addcombatsuperiorityoragility"),
		options = tOptions,
		min = 1,
		max = 1,
		callback = CharClassFeatureManager.callbackResolveFighterCombatSuperiorityDialogSelection,
		custom = rAdd,
	};
	DialogManager.requestSelectionDialog(tDialogData);
end
function callbackResolveFighterCombatSuperiorityDialogSelection(tSelection, rAdd, tSelectionLinks)
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
		if tSelection[1] == "Combat Superiority" then
			for _, featureNode in pairs(tCurrentFeatures) do
				if DB.getText(DB.getPath(featureNode, "value")) == "Combat Agility" then
					DB.deleteNode(featureNode);
					ChatManager.SystemMessageResource("char_abilities_message_classfeatureadd", tSelection[1], rAdd.sCharName);
					break;
				end
			end
		elseif tSelection[1] == "Combat Agility" then
				for _, featureNode in pairs(tCurrentFeatures) do
				if DB.getText(DB.getPath(featureNode, "value")) == "Combat Superiority" then
					DB.deleteNode(featureNode);
					ChatManager.SystemMessageResource("char_abilities_message_classfeatureadd", tSelection[1], rAdd.sCharName);
					break;
				end
			end
		end
	end
end

function displayFighterWeaponmasterFighterTalentsDialog(rAdd, sClassFeatureOriginalDescription)
	local tFighterTalentOptions = {};
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
		tFighterTalentOptions[sClassFeatureName] = DB.getPath(sPattern);
		local tMessageShortcuts = { { class="powerdesc", recordname=DB.getPath(sPattern) } };
		local tMessageData = {font = "systemfont", text = sClassFeatureName, shortcuts=tMessageShortcuts};
		Comm.addChatMessage(tMessageData);
	end
	--Display a pop-up where we either choose from the fighter talents
	local tDialogData = {
		title = Interface.getString("char_build_title_addfightertalents"),
		msg = Interface.getString("char_build_message_addfightertalents"),
		options = tOptions,
		min = 1,
		max = 1,
		callback = CharClassFeatureManager.callbackResolveFighterTalentsDialogSelection,
		custom = { rAdd = rAdd, tFighterTalentOptions = tFighterTalentOptions }, 
	};
	DialogManager.requestSelectionDialog(tDialogData);	
end
function callbackResolveFighterTalentsDialogSelection(tSelection, tData)
	if not tSelection or not tSelection[1] then
		CharManager.outputUserMessage("char_error_addclasssfeature");
		return;
	end
	local sSelectedFighterTalentDBReference;
	local tCurrentFeatures = DB.getChildren(tData.rAdd.nodeChar, "specialabilitylist");
	if #tSelection == 1 then
		for _, featureNode in pairs(tCurrentFeatures) do
			if DB.getText(DB.getPath(featureNode, "value")) ~= tSelection[1] then
				for x, y in pairs(tData.tFighterTalentOptions) do
					if DB.getText(DB.getPath(featureNode, "value")) == x then
						DB.deleteNode(featureNode);
						break;
					end
				end
			end
		end
		sSelectedFighterTalentDBReference = tData.tFighterTalentOptions[tSelection[1]];
		local rCreatedIDChildNode = DB.createChild(tData.rAdd.nodeChar.getPath("specialabilitylist"));
		DB.setValue(rCreatedIDChildNode, "shortcut", "windowreference", "powerdesc", sSelectedFighterTalentDBReference);
		DB.setValue(rCreatedIDChildNode, "value", "string", tSelection[1]);
		--DB.setValue(rCreatedIDChildNode, "description", "string", sClassFeatureOriginalDescription);
		ChatManager.SystemMessageResource("char_abilities_message_classfeatureadd", tSelection[1], tData.rAdd.sCharName);
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
		-- Add the feature and choose between all of the fighter talents
		local rCreatedIDChildNode = DB.createChild(rAdd.nodeChar.getPath("specialabilitylist"));
		DB.setValue(rCreatedIDChildNode, "shortcut", "windowreference");
		DB.setValue(rCreatedIDChildNode, "value", "string", sClassFeatureName);
		DB.setValue(rCreatedIDChildNode, "description", "string", sClassFeatureOriginalDescription);
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
	for x,y in pairs(tCurrentFeatures) do
		if DB.getText(DB.getPath(y, "value")) == "Prime Shot" or DB.getText(DB.getPath(y, "value")) == "Running Attack" then
			local tMessageShortcuts = { { class="ref_ability", recordname=DB.getPath(y) } };
			local tMessageData = {font = "systemfont", text = DB.getText(DB.getPath(y, "value")), shortcuts=tMessageShortcuts};
			Comm.addChatMessage(tMessageData);
		end
	end
	--Display a pop-up where we either choose Prime Shot or Running Attack
	local tOptions = {}
	tOptions[1] = "Prime Shot";
	tOptions[2] = "Running Attack";
	tOptions[3] = "Beast Mastery";
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
			for _, featureNode in pairs(tCurrentFeatures) do
				if DB.getText(DB.getPath(featureNode, "value")) == "Prime Shot" or DB.getText(DB.getPath(featureNode, "value")) == "Running Attack" then
					DB.deleteNode(featureNode);
					ChatManager.SystemMessageResource("char_abilities_message_classfeatureadd", tSelection[1], rAdd.sCharName);
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
	--Display a pop-up where we either choose from the fighter talents
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
		ChatManager.SystemMessageResource("char_abilities_message_classfeatureadd", tSelection[1], tData.rAdd.sCharName);
	end
end


---------------------------------------
-- Utility functions
--
function switch(x, cases)
  local match = cases[x] or cases.default or function() end

  return match()
end