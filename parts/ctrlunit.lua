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
	log(LOG_LEVEL.INFO, self.name .. "::Init")
	self.memory = memory:new(self.name .. ">RAM", self.mem_file)

	self.register_a = register:new(self.name .. ">Register A")
	self.register_b = register:new(self.name .. ">Register B")

	self.alu = alu:new("ALU")

	self.memory:initialize()
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

	reg_a = self.register_a
	reg_b = self.register_b

	-- Load the instruction from table
	local instruction = architecture[byte]

	-- Check that the instruction is in the architecture table
	if instruction then
		-- Print next function
		log(LOG_LEVEL.INFO, "Next instruction [0x" .. decToBase(pc, 16) .. "] :: " .. instruction.name)

		-- Run function
		instruction.f()
		
		self.program_counter = pc + n_bytes
	else
		panic("Instruction not recognized at address 0x" .. decToBase(pc, 16))
	end
end