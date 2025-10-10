-- 
-- Please see the license.html file included with this distribution for 
-- attribution and copyright information.
--

function addClassSpecificFeatures(sClassName, rAdd, sClassFeatureName, sClassFeatureDescription)
	switch(sClassName:upper(), 
	{
		["CLERIC (TEMPLAR)"] = function() return addClericTemplarFeatures(sClassName, rAdd, sClassFeatureName, sClassFeatureDescription) end,
		default = function() return addDefaultClassFeature(sClassName, rAdd, sClassFeatureName, sClassFeatureDescription) end
	});
end

function addDefaultClassFeature(sClassName, rAdd, sClassFeatureName, sClassFeatureDescription)
	local rCreatedIDChildNode = DB.createChild(rAdd.nodeChar.getPath("specialabilitylist"));
	DB.setValue(rCreatedIDChildNode, "shortcut", "windowreference");
	DB.setValue(rCreatedIDChildNode, "value", "string", sClassFeatureName);
	DB.setValue(rCreatedIDChildNode, "description", "string", sClassFeatureDescription);
	ChatManager.SystemMessageResource("char_abilities_message_classfeatureadd", sClassFeatureName, rAdd.sCharName);
end

function addClericTemplarFeatures(sClassName, rAdd, sClassFeatureName, sClassFeatureDescription)
	local tCurrentFeatures = DB.getChildren(rAdd.nodeChar, "specialabilitylist");
	if sClassFeatureName == "Battle Cleric's Lore" then
		--Add the feature, but if you have also already added Healer's Lore, choose between them
		local rCreatedIDChildNode = DB.createChild(rAdd.nodeChar.getPath("specialabilitylist"));
		DB.setValue(rCreatedIDChildNode, "shortcut", "windowreference");
		DB.setValue(rCreatedIDChildNode, "value", "string", sClassFeatureName);
		DB.setValue(rCreatedIDChildNode, "description", "string", sClassFeatureDescription);
		for _, featureNode in pairs(tCurrentFeatures) do
			if DB.getText(DB.getPath(featureNode, "value")) == "Healer's Lore" then
				displayClericTemplarHealerLoreDialog(rAdd)
				break;
			end
		end
	elseif sClassFeatureName == "Healer's Lore" then
		--Add the feature, but if you have also already added Battle Cleric's Lore, choose between them
		local rCreatedIDChildNode = DB.createChild(rAdd.nodeChar.getPath("specialabilitylist"));
		DB.setValue(rCreatedIDChildNode, "shortcut", "windowreference");
		DB.setValue(rCreatedIDChildNode, "value", "string", sClassFeatureName);
		DB.setValue(rCreatedIDChildNode, "description", "string", sClassFeatureDescription);
		for _, featureNode in pairs(tCurrentFeatures) do
			if DB.getText(DB.getPath(featureNode, "value")) == "Battle Cleric's Lore" then
				displayClericTemplarHealerLoreDialog(rAdd)
				break;
			end
		end
	end
end
function displayClericTemplarHealerLoreDialog(rAdd)
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
		CharManager.outputUserMessage("char_error_addclassskill");
		return;
	end
	if not tSelection then
		CharManager.outputUserMessage("char_error_addclassskill");
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


--Utility function
function switch(x, cases)
  local match = cases[x] or cases.default or function() end

  return match()
end