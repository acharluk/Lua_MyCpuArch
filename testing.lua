require 'utils'

--require 'parts.memory'
--require 'parts.register'
require 'parts.ctrlunit'

log(LOG_LEVEL.DEBUG, "Starting!")
--[[
myMemory = memory:new("My memory", "data/memory.bin")
myMemory2 = memory:new("Second memory")

myMemory:initialize()


myRegister = register:new("Register 1")

myRegister:set(0xFF)

print("Register data: " .. myRegister:get())
--]]--

myCU = ctrlunit:new("My CU", "data/memory.bin")
myCU:initialize()

myCU:nextInstruction()
myCU:nextInstruction()
myCU:nextInstruction()
myCU:nextInstruction()
myCU:nextInstruction()