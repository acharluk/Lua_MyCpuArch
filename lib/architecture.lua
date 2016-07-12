architecture = {
	
	[0x00] = {
		name = "NOP",
		f = function()
		end
	},


	--[[ ALU functions ]]--

	[0x01] = {
		name = "ALU ADD",
		f = function()
			n_bytes = 1
			alu:add()
		end
	},

	[0x02] = {
		name = "ALU SUB",
		f = function()
			n_bytes = 1
			alu:sub()
		end
	},

	[0x03] = {
		name = "ALU MUL",
		f = function()
			n_bytes = 1
			alu:mul()
		end
	},

	[0x04] = {
		name = "ALU DIV",
		f = function()
			n_bytes = 1
			alu:div()
		end
	},

	[0x11] = {
		name = "ALU OR",
		f = function()
			n_bytes = 1
			alu:bor()
		end
	},

	[0x12] = {
		name = "ALU AND",
		f = function()
			n_bytes = 1
			alu:band()
		end
	},

	[0x13] = {
		name = "ALU XOR",
		f = function()
			n_bytes = 1
			alu:bxor()
		end
	},


	--[[ Register functions ]]--

	[0xEF] = {
		name = "JMP $PC+1",
		f = function()
			n_bytes = 0
			pc = mem:get(pc + 1)
		end
	},

	[0xE0] = {
		name = "LOAD PC $$PC+1",
		f = function()
			n_bytes = 0
			pc = mem:getp(pc + 1)
		end
	},

	[0xE1] = {
		name = "LOAD REG A $$PC+1",
		f = function()
			n_bytes = 2
			reg_a:set( mem:getp(pc + 1) )
		end
	},

	[0xE2] = {
		name = "LOAD REG B $$PC+1",
		f = function()
			n_bytes = 2
			reg_b:set( mem:getp(pc + 1) )
		end
	},

	[0xF0] = {
		name = "STORE PC $$PC+1",
		f = function()
			n_bytes = 2
			mem:set(mem:get(pc + 1), pc)
		end
	},

	[0xF1] = {
		name = "STORE REG A $$PC+1",
		f = function()
			n_bytes = 2
			mem:set(mem:get(pc + 1), reg_a:get())
		end
	},

	[0xF2] = {
		name = "STORE REG B $$PC+1",
		f = function()
			n_bytes = 2
			mem:set(mem:get(pc + 1), reg_b:get())
		end
	},

	[0xF3] = {
		name = "STORE REG ALU $$PC+1",
		f = function()
			n_bytes = 2
			mem:set(mem:get(pc + 1), alu.alu_register:get())
		end
	},

	[0xC0] = {
		name = "MOV $$PC+1 $$PC+2",
		f = function()
			n_bytes = 3
			local byte = mem:getp(pc + 1)
			mem:set(mem:get(pc + 2), byte)
		end
	},

	--[[ I/O functions ]]--

	[0xA0] = {
		name = "OUT $PC+1 SIZE",
		f = function()
			n_bytes = 3
			local start = mem:get(pc + 1)
			local num_bytes = mem:get(pc + 2)

			for byte = 0, num_bytes - 1 do
				io.stdout:write(string.char( mem:get(start + byte) ))
			end
			io.stdout:write("\n")
		end
	},

	[0xA1] = {
		name = "IN $PC+1 SIZE",
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

	[0xB0] = {
		name = "OUT_RAW $PC+1 SIZE",
		f = function()
			n_bytes = 3
			local start = mem:get(pc + 1)
			local num_bytes = mem:get(pc + 2)

			for byte = 0, num_bytes - 1 do
				io.stdout:write( decToBase(mem:get(start + byte), 16) )
			end
			io.stdout:write("\n")
		end
	},

	[0xB1] = {
		name = "IN_RAW $PC+1 SIZE",
		f = function()
			n_bytes = 3
			local start = mem:get(pc + 1)
			local num_bytes = mem:get(pc + 2)
			-- Read user input
			local str = io.stdin:read()

			for byte = 0, num_bytes - 1 do
				local char = tonumber(str, 16)
				mem:set(start + byte, char)
			end
		end
	},


	[0xFF] = {
		name = "HALT",
		f = function()
			CPU_RUNNING = false
		end
	}

}