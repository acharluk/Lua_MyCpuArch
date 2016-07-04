register = {}

function register:new()
	object = {}
 	setmetatable(object, self)
 	self.__index = self

 	object.name = name
 	object.data = {}

 	log(LOG_LEVEL.INFO, "Created register: name = " .. name)
 	return object
end