require 'parts.ctrlunit'

cpu = {}

function cpu:new(name, mem_file)
	object = {}
	setmetatable(object, self)
	self.__index = self

	object.name = name
	object.mem_file = mem_file

	object.cu = nil

	return object
end

function cpu:initialize()
	log(LOG_LEVEL.INFO, self.name .. "->Init")

	cu = ctrlunit:new("Main Control Unit", self.mem_file)
end