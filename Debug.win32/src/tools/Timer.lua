--[[
	定时器
]]

local Timer = class("Timer")

function Timer:ctor()
	self.scheduler_ = cc.Director:getInstance():getScheduler()
	self.timers_ = {}
end

--[[
	callback	执行定时回调
	interval	间隔时间
	count		执行总次数,为nil则执行无数次
]]
function Timer:start(callback,interval,count)
	local timerid
	local curcount = count
	local function tickfunc(dt)
		if curcount ~= nil then
			curcount = curcount - 1
			if	curcount <=0 then
				self:kill(timerid)
			end
		end
		callback(timerid,dt)
	end
	timerid = self.scheduler_:scheduleScriptFunc(tickfunc,interval,false)
	self.timers_[timerid] = timerid
	return timerid
end

function Timer:runOnce(callback,interval)
	return self:start(callback,interval,1)
end

function Timer:kill(timerid)
	if timerid and self.timers_[timerid] then
		self.scheduler_:unscheduleScriptEntry(timerid)
		self.timers_[timerid] = nil
	end
end

function Timer:killAll()
	for timerid , _ in pairs(self.timers_) do
		self:kill(timerid)
	end
end

return Timer