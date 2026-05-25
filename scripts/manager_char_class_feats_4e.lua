-- 
-- Please see the license.html file included with this distribution for 
-- attribution and copyright information.
--

function addClassFeats(sClassFeatureOriginalDescription, rAdd, sClassFeatureName)
	if not sClassFeatureOriginalDescription or not rAdd then
		ChatManager.SystemMessageResource("char_abilities_message_erroraddingclassfeaturefeat", sClassFeatureName, rAdd.sCharName);
		return;
	end

	local sPattern = "You gain the (.-) feat as a bonus feat.";
	local sClassFeatureFeatName = string.match(sClassFeatureOriginalDescription, sPattern);
	if not sClassFeatureFeatName then
		sPattern = "You gain the (.+) feat."
		sClassFeatureFeatName = string.match(sClassFeatureOriginalDescription, sPattern);
	end
	if not sClassFeatureFeatName then
		sPattern = "You gain ([%a][%a ]-) as a bonus feat";
		sClassFeatureFeatName = string.match(sClassFeatureOriginalDescription, sPattern);		
	end
	Debug.console("sClassFeatureFeatName", sClassFeatureFeatName);
	if sClassFeatureFeatName then
		local tFeatNodes = DB.getChildrenGlobal("reference.feats");
		for _,featNode in ipairs(tFeatNodes) do
			local sFeatName = DB.getText(featNode, "name");
			local sFeatDescription = DB.getText(featNode, "description");
			if sFeatName then
				sFeatName = StringManager.trim(sFeatName:gsub('%b[]', ''));
			end
			if sFeatName == sClassFeatureFeatName then
				local rCreatedIDChildNode = DB.createChild(rAdd.nodeChar.getPath("featlist"));
				local rFindNode = DB.findNode(DB.getPath(featNode));
				DB.setValue(rCreatedIDChildNode, "value", "string", sClassFeatureFeatName);
				if rFindNode then
					DB.setValue(rCreatedIDChildNode, "shortcut", "windowreference", "powerdesc", DB.getPath(featNode));
				else
					DB.setValue(rCreatedIDChildNode, "shortcut", "windowreference");
					DB.setValue(rCreatedIDChildNode, "description", "string", sFeatDescription);
				end
				ChatManager.SystemMessageResource("char_abilities_message_classfeatadd", sClassFeatureFeatName, rAdd.sCharName);
			end

		end
	end
end

