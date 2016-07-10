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
	log(LOG_LEVEL.INFO, self.name .. "->Init")
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

function memory:get(address)
	--@TODO: Check address out of bounds
	return self.data[address]
end

-- Return data where the address is pointing
function memory:getp(address)
	return self:get(self:get(address))
end

function memory:set(address, value)
	--@TODO: Check address and value
	self.data[address] = value
end

function memory:dump()
	log(LOG_LEVEL.INFO, self.name .. "->Dump")
	local f_handle = io.open(self.file, 'wb')

	for i = 0x0, MEMORY_SIZE do
		f_handle:write( string.char(self.data[i] % 0xFF) )
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