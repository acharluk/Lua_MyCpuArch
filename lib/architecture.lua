architecture = {
	
	[0x00] = {
		name = "HALT",
		f = function()
			CPU_RUNNING = false
		end
	},

	[0x01] = {
		name = "ALU ADD $$PC+1 $$PC+2",
		f = function()
			n_bytes = 3
			alu:add(mem:getp(pc + 1), mem:getp(pc + 2))
		end
	},

	[0x02] = {
		name = "ALU SUB $$PC+1 $$PC+2",
		f = function()
			n_bytes = 3
			alu:sub(mem:getp(pc + 1), mem:getp(pc + 2))
		end
	},

	[0x03] = {
		name = "ALU MUL $$PC+1 $$PC+2",
		f = function()
			n_bytes = 3
			alu:mul(mem:getp(pc + 1), mem:getp(pc + 2))
		end
	},

	[0x04] = {
		name = "ALU DIV $$PC+1 $$PC+2",
		f = function()
			n_bytes = 3
			alu:div(mem:getp(pc + 1), mem:getp(pc + 2))
		end
	},

	[0x11] = {
		name = "ALU OR $$PC+1 $$PC+2",
		f = function()
			n_bytes = 3
			alu:bor(mem:getp(pc + 1), mem:getp(pc + 2))
		end
	},

	[0x12] = {
		name = "ALU AND $$PC+1 $$PC+2",
		f = function()
			n_bytes = 3
			alu:band(mem:getp(pc + 1), mem:getp(pc + 2))
		end
	},

	[0x13] = {
		name = "ALU XOR $$PC+1 $$PC+2",
		f = function()
			n_bytes = 3
			alu:bxor(mem:getp(pc + 1), mem:getp(pc + 2))
		end
	},

	[0xE0] = {
		name = "LOAD PC $$PC+1",
		f = function()
			n_bytes = 0
			pc = mem:getp(pc + 1)
		end
	},



	[0xF0] = {
		name = "STORE PC $$PC+1",
		f = function()
			n_bytes = 2
			mem:set(mem:get(pc + 1), pc)
		end
	},

	[0xA0] = {
		name = "OUT $$PC+1 SIZE",
		f = function()
			n_bytes = 3
			local start = mem:get(pc + 1)
			local num_bytes = mem:get(pc + 2)

			for byte = 0, num_bytes - 1 do
				io.stdout:write(string.char( mem:get(start + byte) ))
			end
		end
	},

	[0xA1] = {
		name = "IN $$PC+1 SIZE",
		f = function()
			n_bytes = 3
			local start = mem:get(pc + 1)
			local num_bytes = mem:get(pc + 2)
			-- Read user input
			local str = io.stdin:read()

			for byte = 0, num_bytes - 1 do
				local char = str:sub(byte + 1, byte + 1)
				if char ~= "" then
					char = string.byte(char)
				else
					char = 0x0
				end
				mem:set(start + byte, char)
			end
		end
	},


}