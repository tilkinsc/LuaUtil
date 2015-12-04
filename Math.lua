
local Table = require("Table")

local Math = {}

Math.nlog =  2.718281828459

-- start is the number you wish to round
-- length is a number starting with 1 and only containing 0s
-- length dictates what position in the digit you round to
Math.round = function(start, length)
	return math.floor(start * length + 0.5) / length
end

-- low 'float' precision linear interpolation, 3 
-- start is beginning number
-- ending is goal number
-- alpha is normalized distance
Math.lerpl = function(start, ending, alpha)
	return start + (ending - start) * alpha
end

-- high 'double' precision linear interpolation
-- start is beginning number
-- ending is goal number
-- alpha is normalized distance
Math.lerph = function(start, ending, alpha)
	return (1 - alpha) * start + ending * alpha
end

-- the pythagorean theorem
-- x is the x in the coordinate system
-- y is the y in the coordinate system
Math.pythag = function(x, y)
	return math.sqrt(x * x + y * y)
end

-- adds all values of a tuple together, adding to the number specified
-- start's value is reassigned then added to and finally returned
-- the tuple is only numbers or canonical number strings
Math.sum = function(start, ...)
	local out = start
	for _, v in pairs({...})do
		out = out + v
	end
	return out
end

-- like Math.sum, but subtracts all the numbers instead of adding them
Math.diff = function(start, ...)
	local out = start
	for _, v in pairs({...})do
		out = out - v
	end
	return out
end

-- finds the mean of a tuple
Math.mean = function(...)
	local tab = {...}
	return Math.sum(0, unpack(tab)) / #tab
end

-- finds the mean of a tuple
Math.median = function(..., middle)
	local tab = {...}
	table.sort(tab)
	local middle = #tab / 2
	if(#tab % 2 == 0 and middle)then
		return (tab[middle] + tab[middle+1]) / 2
	end
	return tab[middle]
end

-- finds the mode of a tuple
Math.mode = function(...)
	local register = Table.count({...})
	local highest = 0
	local index = 0
	for i, v in pairs(register)do
		if(v > highest)then
			highest = v
			index = i
		end
	end
	return index
end

-- finds the range of a tuple
Math.range = function(...)
	local tab = {...}
	return math.max(unpack(tab)) - math.min(unpack(tab))
end

-- returns the power of a number whose exponent must be negative
-- number is the leading coefficient
-- exponent is the negative number, which is the exponent
Math.npow = function(number, exponent)
	return 1 / math.pow(number, exponent)
end

return Math
