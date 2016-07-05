register = {}

function register:new(name)
	object = {}
 	setmetatable(object, self)
 	self.__index = self

 	object.name = name
 	object.data = 0x00

 	log(LOG_LEVEL.INFO, "Created register: name = " .. name)
 	return object
end

function register:get()
	log(LOG_LEVEL.INFO, self.name .. "->GET: [" .. tostring(self.data) .. "]")
	return self.data
end

function register:set(data)
	self.data = data
	log(1, self.name .. "->SET: [" .. tostring(self.data) .. "]")
end