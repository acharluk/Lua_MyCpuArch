function panic(reason)
	-- Stop CPU clock
	CPU_RUNNING = false

	-- Save logging level
	local lls = LOG_LEVEL_SEL
	
	-- Disable logging and step mode
	LOG_LEVEL_SEL = 6
	STEP_MODE 	= false

	-- Print reason
	io.stderr:write("\n________________________________________________________")
	io.stderr:write("\n[PANIC] -> " .. reason .. "\n")

	-- Print register values
	io.stderr:write("Program counter: " .. pc .. "\n")
	io.stderr:write("Register A: " .. reg_a:get() .. " [" .. decToBase(reg_a:get(), 16) .."]\n")
	io.stderr:write("Register B: " .. reg_b:get() .. " [" .. decToBase(reg_b:get(), 16) .."]\n")
	io.stderr:write("Register ALU: " .. alu.alu_register:get() .. " [" .. decToBase(alu.alu_register:get(), 16) .."]\n")

	-- Print memory dump
	io.stderr:write("Memory dump:\n")
	mem:show()

	io.stderr:write("\n________________________________________________________\n\n")

	-- Enable logging
	LOG_LEVEL_SEL = lls
end