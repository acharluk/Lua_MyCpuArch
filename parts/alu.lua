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

function alu:sub(num_1, num_2)
	-- This is really WIP
	self.alu_register:set(num_1 - num_2)

	log(LOG_LEVEL.INFO, self.name .. "->Sub: " .. num_1 .. " - " .. num_2 .. " = " .. self.alu_register:get())
end

function alu:mul(num_1, num_2)
	-- This is really WIP
	self.alu_register:set(num_1 * num_2)

	log(LOG_LEVEL.INFO, self.name .. "->Sub: " .. num_1 .. " * " .. num_2 .. " = " .. self.alu_register:get())
end

function alu:div(num_1, num_2)
	-- This is really WIP
	self.alu_register:set(math.floor(num_1 / num_2))

	log(LOG_LEVEL.INFO, self.name .. "->Div: " .. num_1 .. " / " .. num_2 .. " = " .. self.alu_register:get())
end

function alu:bor(num_1, num_2)
	-- This is really WIP
	self.alu_register:set(bit32.bor(num_1, num_2))

	log(LOG_LEVEL.INFO, self.name .. "->Or: " .. num_1 .. " or " .. num_2 .. " = " .. self.alu_register:get())
end

function alu:band(num_1, num_2)
	-- This is really WIP
	self.alu_register:set(bit32.band(num_1, num_2))

	log(LOG_LEVEL.INFO, self.name .. "->And: " .. num_1 .. " and " .. num_2 .. " = " .. self.alu_register:get())
end

function alu:bxor(num_1, num_2)
	-- This is really WIP
	self.alu_register:set(bit32.bxor(num_1, num_2))

	log(LOG_LEVEL.INFO, self.name .. "->Xor: " .. num_1 .. " xor " .. num_2 .. " = " .. self.alu_register:get())
end