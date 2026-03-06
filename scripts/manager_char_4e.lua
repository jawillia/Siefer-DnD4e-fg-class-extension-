-- 
-- Please see the license.html file included with this distribution for 
-- attribution and copyright information.
--

--
-- LINK HANDLING
--

function onClassLinkPressed(nodeChar)
	local _, sRecord = DB.getValue(nodeChar, "classlink", "", "");
	if CharManagerWith4EClassExtension.helperOpenLinkRecord("class", sRecord) then
		return true;
	end

	CharManagerWith4EClassExtension.helperOpenLinkRecordFail("class", sRecord);
	return false;
end

function helperOpenLinkRecord(sRecordType, sRecord)
	if ((sRecord or "") == "") or ((sRecordType or "") == "") then
		return false;
	end
	local nodeRecord = DB.findNode(sRecord);
	if nodeRecord then
		local sDisplayClass = RecordDataManager.getRecordTypeDisplayClass(sRecordType, nodeRecord);
		Interface.openWindow(sDisplayClass, nodeRecord);
		return true;
	end
	return false;
end

function onHybridClassLinkPressed(nodeChar)
	local _, sRecord = DB.getValue(nodeChar, "hybridclasslink", "", "");
	if CharManagerWith4EClassExtension.helperOpenLinkRecord("class", sRecord) then
		return true;
	end

	CharManagerWith4EClassExtension.helperOpenLinkRecordFail("class", sRecord);
	return false;
end



--
-- INSERT CHAR SHEET TRAITS FROM DESCRIPTION WITHOUT MODIFIED COMPENDIUM
--
function helperSetTraitFromDescription(nodeRecord, sTraitPath, sDescriptionText, sPattern, sType)
	local sFieldType = sType or "string";
	local currentValue = DB.getValue(nodeRecord, sTraitPath);
	if not currentValue or currentValue == "" or (sFieldType == "number" and currentValue == 0) then
		local sValue = string.match(sDescriptionText, sPattern);
		if sValue then
			if sFieldType == "number" then
				DB.setValue(nodeRecord, sTraitPath, "number", tonumber(sValue) or 0);
			else
				DB.setValue(nodeRecord, sTraitPath, "string", sValue);
			end
		end
	end
end

function updateClassFieldsFromDescription(nodeRecord)
	local sDescriptionText = DB.getValue(nodeRecord, "description", "");
	if not sDescriptionText then
		return;
	end

	-- Role
	helperSetTraitFromDescription(nodeRecord, "traits.role.text", sDescriptionText,
		"<b>%s*Role%s*:%s*</b>%s*(.-)</p>");
	-- Power Source
	helperSetTraitFromDescription(nodeRecord, "traits.powersource.text", sDescriptionText,
		"<b>%s*Power Source%s*:%s*</b>%s*(.-)</p>");
	-- Key Abilities
	helperSetTraitFromDescription(nodeRecord, "traits.keyabilities.text", sDescriptionText,
		"<b>%s*Key Abilities%s*:%s*</b>%s*(.-)</p>");
	-- Armor Proficiencies
	helperSetTraitFromDescription(nodeRecord, "traits.armorproficiencies.text", sDescriptionText,
		"<b>%s*Armor Proficiencies%s*:%s*</b>(.-)</p>");
	-- Weapon Proficiencies
	helperSetTraitFromDescription(nodeRecord, "traits.weaponproficiencies.text", sDescriptionText,
		"<b>%s*Weapon Proficiencies%s*:%s*</b>(.-)</p>");
	-- Implement
	helperSetTraitFromDescription(nodeRecord, "traits.implement.text", sDescriptionText,
		"<b>%s*Implement%s*:%s*</b>(.-)</p>");
	-- Bonus to Defense
	helperSetTraitFromDescription(nodeRecord, "traits.bonustodefense.text", sDescriptionText,
		"<b>%s*Bonus to Defense%s*:%s*</b>%s*(.-)</p>");
	-- Hit Points at 1st Level
	helperSetTraitFromDescription(nodeRecord, "traits.hitpoints1stlevel.text", sDescriptionText,
		"<b>%s*Hit Points at 1st Level%s*</b>:%s*(.-)</p>");
	-- Hit Points per Level Gained
	helperSetTraitFromDescription(nodeRecord, "traits.hitpointsperlevelgained.text", sDescriptionText,
		"<b>%s*Hit Points per Level Gained%s*</b>:%s*(.-)</p>", "number");
	-- Healing Surges per Day
	helperSetTraitFromDescription(nodeRecord, "traits.healingsurgesperday.text", sDescriptionText,
		"<b>%s*Healing Surges per Day%s*</b>:%s*(.-)</p>");
	-- Trained Skills
	helperSetTraitFromDescription(nodeRecord, "traits.trainedskills.text", sDescriptionText,
		"<b>%s*Trained Skills%s*</b>%s*:%s*(.-)</p>");

	-- Class Skill List
	local tCurrentClassSkills = DB.getChildren(nodeRecord, "traits.classskilllist");
	if not next(tCurrentClassSkills) then
		local sClassSkillsText = string.match(sDescriptionText, "<i>%s*Class Skills%s*</i>%s*:%s*(.-)</p>");
		if sClassSkillsText then
			local tClassSkills = StringManager.split(sClassSkillsText, ",");
			for _, sSkill in pairs(tClassSkills) do
				sSkill = sSkill:gsub("^%s+", ""):gsub("%s+$", "");
				if sSkill ~= "" then
					local nodeSkill = DB.createChild(DB.getPath(nodeRecord, "traits.classskilllist"));
					if nodeSkill then
						DB.setValue(nodeSkill, "name", "string", sSkill);
					end
				end
			end
		end
	end
end
