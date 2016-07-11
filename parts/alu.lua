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
	log(LOG_LEVEL.INFO, self.name .. "::Init")
	self.alu_register = register:new(self.name .. ">Register ALU")
end

--[[ ALU functions ]]--

function alu:add()
	self.alu_register:set(reg_a:get() + reg_b:get())
	log(LOG_LEVEL.INFO, self.name .. "::Add: " .. reg_a:get() .. " + " .. reg_b:get() .. " = " .. self.alu_register:get())
end

function alu:sub()
	self.alu_register:set(reg_a:get() - reg_b:get())
	log(LOG_LEVEL.INFO, self.name .. "::Sub: " .. reg_a:get() .. " - " .. reg_b:get() .. " = " .. self.alu_register:get())
end

function alu:mul()
	self.alu_register:set(reg_a:get() * reg_b:get())
	log(LOG_LEVEL.INFO, self.name .. "::Sub: " .. reg_a:get() .. " * " .. reg_b:get() .. " = " .. self.alu_register:get())
end

function alu:div()
	self.alu_register:set(math.floor(reg_a:get() / reg_b:get()))
	log(LOG_LEVEL.INFO, self.name .. "::Div: " .. reg_a:get() .. " / " .. reg_b:get() .. " = " .. self.alu_register:get())
end

function alu:bor()
	self.alu_register:set(reg_a:get() | reg_b:get())
	log(LOG_LEVEL.INFO, self.name .. "::Or: " .. reg_a:get() .. " or " .. reg_b:get() .. " = " .. self.alu_register:get())
end

function alu:band()
	self.alu_register:set(reg_a:get() & reg_b:get())
	log(LOG_LEVEL.INFO, self.name .. "::And: " .. reg_a:get() .. " and " .. reg_b:get() .. " = " .. self.alu_register:get())
end

function alu:bxor()
	self.alu_register:set(reg_a:get() ~ reg_b:get())
	log(LOG_LEVEL.INFO, self.name .. "::Xor: " .. reg_a:get() .. " xor " .. reg_b:get() .. " = " .. self.alu_register:get())
end