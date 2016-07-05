memory = {}

function memory:new(name, file)
 	object = {}
 	setmetatable(object, self)
 	self.__index = self

 	object.name = name
 	object.file = file
 	object.data = {}

 	log(LOG_LEVEL.INFO, "Created memory: name = " .. name)
 	return object
 end

function memory:initialize()
	local f_handle = io.open(self.file, 'rb')

	if f_handle then
		-- Load each byte into data
		for i = 0x0, MEMORY_SIZE do
			local byte = string.byte(f_handle:read(1))
			self.data[i] = byte
		end
	else
		for i = 0x0, MEMORY_SIZE do
			self.data[i] = 0x0
		end
	end


	f_handle:close()
end

function memory:dump()
	local f_handle = io.open(file, 'wb')

	for i = 0x0, MEMORY_SIZE do
		f_handle:write( string.char(self.data[i]) )
	end

	f_handle:close()
end

function memory.createBlank(file)
	local f_handle = io.open(file, 'wb')

	for i = 0x0, MEMORY_SIZE do
		f_handle:write( string.char(0x0) )
	end

	f_handle:close()
end