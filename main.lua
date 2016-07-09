require 'utils'

require 'parts.cpu'

local CPU = cpu:new("Main CPU", "data/memory.bin")
CPU:initialize()

while CPU_RUNNING do
	CPU:clock()
end

CPU:stop()