architecture = {
	
	[0x00] = {
		name = "HALT",
		f = function()
			CPU_RUNNING = false
			log(LOG_LEVEL.INFO, "CPU stopped")
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
			mem:set(mem:getp(pc + 1), pc)
		end
	},

}