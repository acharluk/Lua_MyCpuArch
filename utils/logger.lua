-- Opposite for LOG_LEVEL
local levels = {}
for k, v in pairs(LOG_LEVEL) do
	levels[v] = k
end

function log(level, str)
	if level <= LOG_LEVEL_SEL then
		print("[" .. levels[level] .. "] -> " .. str)
	end
end