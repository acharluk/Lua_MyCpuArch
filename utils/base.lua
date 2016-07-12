function toBin(byte)
	local bits = select(2, math.frexp(byte))
	local out = {}       

	for b = 1, bits do
		local bit = math.fmod(byte, 2)
		out[b] = bit == 1
		byte = (byte - bit) / 2
	end

	return out
end

function toBool(byte)
	local out = {}

	for i = 1, #byte do
		out[i] = byte[i] == 1
	end

	return out
end

function decToBase(number, base)
	local k, out = "0123456789ABCDEF", ""

	while number > 0 do
		number, d = math.floor(number / base), math.fmod(number, base) + 1
		out = string.sub(k, d, d) .. out
	end

	if out == "" then
		out = "00"
	end
	if #out < 2 then
		out = "0" .. out
	end

	return out
end
