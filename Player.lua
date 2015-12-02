
local Player = {}

-- stats is a dictionary which holds Variable -> Value amendments
Player.new = function(stats)
	local this = {
		Stats = stats;
		Data = {};
	}
	
	setmetatable(this, {
		__index = function(self, i)
			return self.Data[i] or self.Stats[i]
		end;
		__newindex = function(self, i, v)
			rawset(self, i, v)
		end;
	})
	
	this.GetStatsIndexes = function(self)
		local out = {}
		for i, v in pairs(self.Stats)do
			table.insert(out, i)
		end
		return out
	end
	
	this.GetDataIndexes = function(self)
		local out = {}
		for i, v in pairs(self.Data)do
			table.insert(out, i)
		end
		return out
	end
	
	this.GetTotalStats = function(self)
		local out = 0
		for i, v in pairs(self.Stats)do
			out = out + v
		end
		return out
	end
	
	return this
end

return Player
