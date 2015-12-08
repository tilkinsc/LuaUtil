
local Math = require("Math")

local Vector2 = {}

Vector2.new = function(x, y)
	local this = {
		X = x or 0;
		Y = y or 0;
	}
	this.magnitude = math.sqrt(x * x + y * y)
	
	-- low 'float' precision linear interpolation
	-- v is ending vector2
	-- a is normalized distance ratio between point a and b
	this.lerpl = function(self, v, a)
		return Vector2.new(
			Math.lerpl(self.X, v.X, a),
			Math.lerpl(self.Y, v.Y, a)
		)
	end
	
	-- high 'double' precision linear interpolation
	-- v is goal number
	-- a is normalized distance ratio between point a and b
	this.lerph = function(self, v, a)
		return Vector2.new(
			Math.lerph(self.X, v.X, a),
			Math.lerph(self.Y, v.Y, a)
		)
	end
	
	-- when indexing, unit will, if called, be added to the field space with a normalized unit vector of X and Y in the field space
	-- just standard operations that manipulate X and Y based off the operator you are doing
	return setmetatable(this, {
		__index = function(self, i)
			if(i == "unit")then
				self.unit = Vector2.new(self.X / self.magnitude, self.Y / self.magnitude)
				return self.unit
			end
		end;
		__add = function(self, v)
			local t = type(v) == "number"
			self.X = self.X + (t and v or v.X)
			self.Y = self.Y + (t and v or v.Y)
			return self
		end;
		__sub = function(self, v)
			local t = type(v) == "number"
			self.X = self.X - (t and v or v.X)
			self.Y = self.Y - (t and v or v.Y)
			return self
		end;
		__mul = function(self, v)
			local t = type(v) == "number"
			self.X = self.X * (t and v or v.X)
			self.Y = self.Y * (t and v or v.Y)
			return self
		end;
		__div = function(self, v)
			local t = type(v) == "number"
			self.X = self.X / (t and v or v.X)
			self.Y = self.Y / (t and v or v.Y)
			return self
		end;
		__mod = function(self, v)
			local t = type(v) == "number"
			self.X = self.X % (t and v or v.X)
			self.Y = self.Y % (t and v or v.Y)
			return self
		end;
		__unm = function(self)
			self.X = -self.X
			self.Y = -self.Y
		end;
	})
end

return Vector2
