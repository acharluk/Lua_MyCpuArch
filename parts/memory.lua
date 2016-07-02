memory = {}

function memory:new(name, file)
 	self = {}
 	setmetatable(self, memory)

 	self.name = name
 	self.file = file
 	self.data = {}

 	log(LOG_LEVEL.INFO, "Created memory: name = " .. name)
 	return self
 end

function memory:initialize()
	local f_handle = io.open(self.file, 'rb')

	-- Load each byte into data
	for i = 0x0, MEMORY_SIZE do
		local byte = f_handle:read(1)
		-- Parse to binary
		-- self.data[i] = parsed_byte
	end


	f_handle:close()
end

function memory:dump()
	local f_handle = io.open(file, 'wb')

	for i = 0x0, MEMORY_SIZE do
		-- Parse to hex
		-- f_handle:write( string.char(parsed_byte) )
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