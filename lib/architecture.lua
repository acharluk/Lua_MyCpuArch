architecture = {
	
	[0x00] = {
	name = "HALT",
	f = function()
		CPU_RUNNING = false
		log(LOG_LEVEL.INFO, "CPU stopped")
	end
	},

	-- ALU Add pc+1 pc+2
	[0x01] = {
	name = "ALU ADD $$PC+1 $$PC+2",
	f = function()
		n_bytes = 3
		alu:add(mem:getp(pc + 1), mem:getp(pc + 2))
	end
	},

}