require 'parts.memory'
require 'parts.register'
require 'parts.alu'

require 'lib.architecture'

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
	object.alu = nil

	log(LOG_LEVEL.INFO, "Created control unit: name = " .. name)
	return object
end

function ctrlunit:initialize()
	log(LOG_LEVEL.INFO, self.name .. "->Init")
	self.memory = memory:new(self.name .. ">Memory", self.mem_file)
	self.memory:initialize()

	self.register_a = register:new(self.name .. ">Register A")
	self.register_b = register:new(self.name .. ">Register B")

	self.alu = alu:new("ALU")
	self.alu:initialize()
end

function ctrlunit:nextInstruction()
	--[[ Variables for instruction simplicity ]]--
	byte = self.memory.data[self.program_counter]

	-- Number of bytes the instruction needs
	n_bytes = 1

	mem = self.memory
	pc = self.program_counter
	alu = self.alu

	-- Print next function
	print("")
	log(LOG_LEVEL.DEBUG, "Next instruction [" .. pc .. "]-> " .. architecture[byte].name)

	-- Run function
	architecture[byte].f()
	
	pc = pc + n_bytes
end