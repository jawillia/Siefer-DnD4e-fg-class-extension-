function addClassSpecificPowers(sClassName, rAdd, sClassFeatureName, sClassFeatureFilteredDescription, sClassFeatureOriginalDescription)
	switch(sClassName:upper(), 
	{
		--PHB1
		["WARLOCK"] = function() return addWarlockPowers(sClassName, rAdd, sClassFeatureName, sClassFeatureFilteredDescription, sClassFeatureOriginalDescription) end,
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
		["WARLOCK (HEXBLADE)"] = function() return addWarlockHexbladeFeatures(sClassName, rAdd, sClassFeatureName, sClassFeatureFilteredDescription, sClassFeatureOriginalDescription) end,		
		--HoS
		["ASSASSIN (EXECUTIONER)"] = function() return addAssassinExecutionerFeatures(sClassName, rAdd, sClassFeatureName, sClassFeatureFilteredDescription, sClassFeatureOriginalDescription) end,
		["PALADIN (BLACKGUARD)"] = function() return addPaladinBlackguardFeatures(sClassName, rAdd, sClassFeatureName, sClassFeatureFilteredDescription, sClassFeatureOriginalDescription) end,
		["WARLOCK (BINDER)"] = function() return addWarlockBinderFeatures(sClassName, rAdd, sClassFeatureName, sClassFeatureFilteredDescription, sClassFeatureOriginalDescription) end,
		--HoF
		["BARBARIAN (BERSERKER)"] = function() return addBarbarianBerserkerFeatures(sClassName, rAdd, sClassFeatureName, sClassFeatureFilteredDescription, sClassFeatureOriginalDescription) end,
		["DRUID (PROTECTOR)"] = function() return addDruidProtectorFeatures(sClassName, rAdd, sClassFeatureName, sClassFeatureFilteredDescription, sClassFeatureOriginalDescription) end,
		["WIZARD (WITCH)"] = function() return addWizardWitchFeatures(sClassName, rAdd, sClassFeatureName, sClassFeatureFilteredDescription, sClassFeatureOriginalDescription) end,
		--HoEC
		["SORCERER (ELEMENTALIST)"] = function() return addSorcererElementalistFeatures(sClassName, rAdd, sClassFeatureName, sClassFeatureFilteredDescription, sClassFeatureOriginalDescription) end,
		default = function() return addDefaultClassFeature(sClassName, rAdd, sClassFeatureName, sClassFeatureFilteredDescription) end
	});
end

---------------------------------------------
--- Generic Non-Dialogue Power Add Methods
---------------------------------------------
--Adds all powers that are in the text of a class feature
function addAllFeaturePowers(rAdd, sClassFeatureOriginalDescription, sClassFeatureName)
	if not rAdd or not sClassFeatureOriginalDescription or not sClassFeatureName then
		CharManager.outputUserMessage("char_error_addclassspower");
		return;
	end
	local sPattern = '<link class="powerdesc" recordname="reference.powers.(%w+)@([%w%s]+)">';
	local sPowersLink = string.gmatch(sClassFeatureOriginalDescription, sPattern);
	for w,v in sPowersLink do
		local sPowerPath = "reference.powers." .. w .. "@" .. v;
		local sPowerName = DB.getText(DB.getPath(sPowerPath, "name"));
		
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
end

--Adds a power based that matches the name of a feature
function addFeatureNamePower(rAdd, sClassFeatureName)
	if not rAdd or not sClassFeatureName then
		CharManager.outputUserMessage("char_error_addclassspower");
		return;
	end
	local tPowerNodes = DB.getChildrenGlobal("reference.powers");
	for _,powerNode in ipairs(tPowerNodes) do
		local sPowerName = DB.getText(DB.getPath(powerNode, "name"));
		if sClassFeatureName == sPowerName then
			local sPowerPath = DB.getPath(powerNode);
			local tCurrentPowers = DB.getChildren(rAdd.nodeChar, "powers");
			local isPowerInList = false;
			for _, currentPower in pairs(tCurrentPowers) do
				if DB.getText(currentPower, "name") == sPowerName then
					isPowerInList = true;
					break;
				end
			end
			if isPowerInList == false and sPowerPath and sPowerPath ~= "" then
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
			break;
		end
	end
end

--Searches Sub-Feature Text for Name of all Powers from the parent class feature text, and adds them
function addAllPowersFromFeatureText(rAdd, sSubClassFeatureOriginalDescription, sParentClassFeatureOriginalDescription)
	if not rAdd or not sSubClassFeatureOriginalDescription or not sParentClassFeatureOriginalDescription then
		CharManager.outputUserMessage("char_error_addclassspower");
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
		local tCurrentPowers = DB.getChildren(rAdd.nodeChar, "powers");
		local isPowerInList = false;
		for _, powerNode in pairs(tCurrentPowers) do
			if DB.getText(DB.getPath(powerNode, "name")) == powerName then
				isPowerInList = true;
				break;
			end
		end
		if isPowerInList == false and DB.findNode(DB.getPath(powerPath)) then
			local sPowerActionSpeed = DB.getText(DB.getPath(powerPath, "action"));
			local sPowerSource = DB.getText(DB.getPath(powerPath, "source"));
			local sPowerKeywords = DB.getText(DB.getPath(powerPath, "keywords"));
			local sPowerRange = DB.getText(DB.getPath(powerPath, "range"));
			local sPowerRecharge = DB.getText(DB.getPath(powerPath, "recharge"));
			local sPowerFullDescription = DB.getText(DB.getPath(powerPath, "flavor")) .. "\n\n" .. DB.getText(DB.getPath(powerPath, "description"))
			local rCreatedIDChildNode = DB.createChild(rAdd.nodeChar.getPath("powers"));
			DB.setValue(rCreatedIDChildNode, "action", "string", sPowerActionSpeed);
			DB.setValue(rCreatedIDChildNode, "name", "string", powerName);
			DB.setValue(rCreatedIDChildNode, "source", "string", sPowerSource);
			DB.setValue(rCreatedIDChildNode, "keywords", "string", sPowerKeywords);
			DB.setValue(rCreatedIDChildNode, "range", "string", sPowerRange);
			DB.setValue(rCreatedIDChildNode, "recharge", "string", sPowerRecharge);
			DB.setValue(rCreatedIDChildNode, "shortdescription", "string", sPowerFullDescription);
			CharManager.parseDescription(rCreatedIDChildNode);
			ChatManager.SystemMessageResource("char_abilities_message_poweradd", powerName, rAdd.sCharName);
		end
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
	local nOptionsCount = 1;
	for w,v in sPowersLink do
		local sPattern = "reference.powers." .. w .. "@" .. v;
		local sClassFeatureName = DB.getText(DB.getPath(sPattern, "name"));
		local sClassFeatureDescription = DB.getText(DB.getPath(sPattern, "description"));
		table.insert(tOptions, { text = sClassFeatureName, linkclass = "powerdesc", linkrecord = DB.getPath(sPattern), });
		nOptionsCount = nOptionsCount + 1;
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
		callback = CharClassFeatureManager.callbackResolveClassFeatureSelectionsDialogSelection,
		custom = rAdd, 
	};
	DialogManager.requestSelectionDialog(tDialogData);	
end
function callbackResolveClassPowersSelectionsDialogSelection(tSelection, rAdd, tSelectionLinks)
	if not tSelection or not tSelection[1] then
		CharManager.outputUserMessage("char_error_addclassspower");
		return;
	end
	if not tSelectionLinks then
		CharManager.outputUserMessage("char_error_addclassspower");
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
end

