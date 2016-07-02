memory = {}

function memory:new(name)
 	self = {}
 	setmetatable(self, memory)

 	self.name = name

 	print("Created memory: name = " .. name)
 	return self
 end



function memory.createBlank(file)
	local f_handle = io.open(file, 'wb')

	for i = 0x0, MEMORY_SIZE do
		f_handle:write( string.char(0x0) )
	end

	f_handle:close()
end