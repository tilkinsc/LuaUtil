	
local Constraint = {}

-- returns a number either the minimum or maximum specified value if the given number is less than or greater than the limits, else itself
Constraint.constrain = function(m, v, ma)
	return v < m and m or v > ma and ma or v
end

Constraint.iLimit = function(m, va, ma)
	local this = {
		Min = m;
		Value = va;
		Max = ma;
	}
	
	-- basic calls to each operation
	return setmetatable(this, {
		__add = function(self, v)
			self.Value = Constraint.constrain(self.Min, self.Value + v, self.Max)
			return self
		end;
		__mul = function(self, v)
			self.Value = Constraint.constrain(self.Min, self.Value * v, self.Max)
			return self
		end;
		__div = function(self, v)
			self.Value = Constraint.constrain(self.Min, self.Value / v, self.Max)
			return self
		end;
		__sub = function(self, v)
			self.Value = Constraint.constrain(self.Min, self.Value - v, self.Max)
			return self
		end;
		__mod = function(self, v)
			self.Value = Constraint.constrain(self.Min, self.Value % v, self.Max)
			return self;
		end;
	})
end

return Constraint
