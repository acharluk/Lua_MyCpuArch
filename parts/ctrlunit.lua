require 'parts.memory'
require 'parts.register'

ctrlunit = {}

function ctrlunit:new(name, mem_file)
	object = {}
	setmetatable(object, self)
	self.__index = self

	object.name = name
	object.mem_file = mem_file
	object.program_counter = 0x0
	
	object.memory = nil
	object.register_a = nil
	object.register_b = nil

	log(LOG_LEVEL.INFO, "Created control unit: name = " .. name)
	return object
end

function ctrlunit:initialize()
	log(LOG_LEVEL.INFO, self.name .. "->Init")
	self.memory = memory:new(self.name .. ">Memory", self.mem_file)
	self.memory:initialize()

	self.register_a = register:new(self.name .. ">Register A")
	self.register_b = register:new(self.name .. ">Register B")
end

function ctrlunit:nextInstruction()
	log(LOG_LEVEL.DEBUG, "Next instruction")
	print(":::", string.char(self.memory.data[self.program_counter]))


	self.program_counter = self.program_counter + 1
end