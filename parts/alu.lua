require 'parts.register'

alu = {}

function alu:new(name)
	object = {}
	setmetatable(object, self)
	self.__index = self

	object.name = name

	object.alu_register = nil

	log(LOG_LEVEL.INFO, "Created ALU: name = " .. name)
	return object
end

function alu:initialize()
	log(LOG_LEVEL.INFO, self.name .. "->Init")
	self.alu_register = register:new(self.name .. ">Register ALU")
	
end

function alu:add(num_1, num_2)
	-- This is really WIP
	self.alu_register:set(num_1 + num_2)

	log(LOG_LEVEL.INFO, self.name .. "->Add: " .. num_1 .. " + " .. num_2 .. " = " .. self.alu_register:get())
end