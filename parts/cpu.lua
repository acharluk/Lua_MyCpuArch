require 'parts.ctrlunit'

cpu = {}

function cpu:new(name, mem_file)
	object = {}
	setmetatable(object, self)
	self.__index = self

	object.name = name
	object.mem_file = mem_file

	object.cu = nil

	log(LOG_LEVEL.INFO, "Created CPU: name = " .. name)
	return object
end

function cpu:initialize()
	log(LOG_LEVEL.INFO, self.name .. "::Init")

	self.cu = ctrlunit:new("Control Unit", self.mem_file)
	self.cu:initialize()
	print("")
end

function cpu:clock()
	self.cu:nextInstruction()
end

function cpu:stop()
	self.cu.memory:dump()
	log(LOG_LEVEL.INFO, "CPU stopped")
end