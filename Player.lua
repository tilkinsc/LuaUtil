
local Player = {}

Player.new = function(statics, stats)
	-- tables are string keys (dictionaries)
	-- Stats are not static, but introduced as an external table, should be integers
	-- Data are not static
	-- statics gets unpacked into this, prevents popping the metatable for no reason
	local this = {
		Stats = stats;
		Data = {};
	}
	for i, v in pairs(statics)do
		this[i] = v
	end
	
	setmetatable(this, {
		-- if not in this, find from stats, else data
		__index = function(self, i)
			return self.Stats[i] or self.Data[i]
		end;
	})
	
	-- get string keys of all your stats
	this.GetStatsIndexes = function(self)
		local out = {}
		for i, v in pairs(self.Stats)do
			table.insert(out, i)
		end
		return out
	end
	
	-- get string keys of all your data
	this.GetDataIndexes = function(self)
		local out = {}
		for i, v in pairs(self.Data)do
			table.insert(out, i)
		end
		return out
	end
	
	-- sums all your stats values
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
