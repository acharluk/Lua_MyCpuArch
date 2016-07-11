function panic(reason)
	-- Stop CPU clock
	CPU_RUNNING = false

	-- Disable logging and step mode
	local lls = LOG_LEVEL_SEL
	LOG_LEVEL_SEL = 6
	local sm = STEP_MODE
	STEP_MODE 	= false

	-- Print reason
	io.stdout:write("\n________________________________________________________")
	io.stdout:write("\n[PANIC] -> " .. reason .. "\n")

	-- Print register values
	io.stdout:write("Program counter: " .. pc .. "\n")
	io.stdout:write("Register A: " .. reg_a:get() .. " [" .. decToBase(reg_a:get(), 16) .."]\n")
	io.stdout:write("Register B: " .. reg_b:get() .. " [" .. decToBase(reg_b:get(), 16) .."]\n")
	io.stdout:write("Register ALU: " .. alu.alu_register:get() .. " [" .. decToBase(alu.alu_register:get(), 16) .."]\n")

	-- Print memory dump
	io.stdout:write("Memory dump:\n")
	mem:show()

	io.stdout:write("\n________________________________________________________\n\n")

	-- Enable logging and step mode
	LOG_LEVEL_SEL = lls
	STEP_MODE = sm
end