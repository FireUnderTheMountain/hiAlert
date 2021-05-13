local addonName, hiAlert = ...
local hiAAA = hiAlert.Ace


-- You don't even have to register events - any function named after an event is run.
function hiAAA:ZONE_CHANGED()
	--self:Print("Zone change - Test enabled")
end

--EOF
