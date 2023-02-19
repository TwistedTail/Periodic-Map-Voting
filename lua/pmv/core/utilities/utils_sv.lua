local Utils = PMV.Utilities
local os    = os


--- Returns the Unix time of the beginning of the first day of the next month from the current date.
-- The given Unix time will use the UTC timezone.
function Utils.GetNextPeriod()
	local Date    = os.date("!*t")
	local Month   = Date.month
	local NewYear = Month == 12

	Date.year  = Date.year + (NewYear and 1 or 0)
	Date.month = Month % 12 + 1
	Date.day   = 1
	Date.hour  = 0
	Date.min   = 0
	Date.sec   = 0
	Date.isdst = nil
	Date.wday  = nil
	Date.yday  = nil

	return os.time(Date)
end

--- Returns the current Unix time using the UTC timezone.
function Utils.GetCurrentTime()
	return os.time(os.date("!*t"))
end
