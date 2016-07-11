require 'utils'

require 'parts.cpu'

local CPU = cpu:new("CPU", "data/memory.bin")
CPU:initialize()

-- If step mode is enabled, wait for each clock
if STEP_MODE then
	while CPU_RUNNING do
		io.stdout:write("\nNext step: ")
		io.stdin:read()

		CPU:clock()
	end
else
	while CPU_RUNNING do
		CPU:clock()
	end
end

CPU:stop()