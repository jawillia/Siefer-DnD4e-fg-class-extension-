-- 
-- Please see the license.html file included with this distribution for 
-- attribution and copyright information.
--

aRecordOverrides = {
	["class"] = {
		aDataMap = { "class", "reference.classes" }, 
		sListDisplayClass = "masterindexitem_id",
		sRecordDisplayClass = "powerdesc", 
		tOptions = {
			bExport = true,
		}
	}
};

function onInit()
	LibraryData.overrideRecordTypes(aRecordOverrides);
end