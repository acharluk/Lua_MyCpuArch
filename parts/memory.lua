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
	log(LOG_LEVEL.INFO, self.name .. "::Init")
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
	return self.data[address]
end

-- Return data where the address is pointing
function memory:getp(address)
	return self.data[self.data[address]]
end

function memory:set(address, value)
	if address < 0x00 or address > 0xFF then
		panic("Address out of bounds: " .. decToBase(address, 16))
	elseif value < 0x00 or value > 0xFF then
		panic("Value out of bounds: " .. decToBase(value, 16))
	end

	self.data[address] = value
end

function memory:dump()
	log(LOG_LEVEL.INFO, self.name .. "::Dump")
	local f_handle = io.open(self.file, 'wb')

	for i = 0x0, MEMORY_SIZE do
		f_handle:write( string.char(self.data[i]) )
	end

	f_handle:close()
end

function memory:show()
	for i = 0x0, MEMORY_SIZE do
		io.stdout:write(decToBase(self.data[i], 16) .. " ")
	end
end

function memory.createBlank(file)
	local f_handle = io.open(file, 'wb')

	for i = 0x0, MEMORY_SIZE do
		f_handle:write( string.char(0x0) )
	end

	f_handle:close()
end