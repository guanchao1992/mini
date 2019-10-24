--[[
	所有Controller的基类，提供通用的事件绑定 
	__APPEVENT_BINDING ={}绑定的事件
]]

local Timer = require("tools.Timer")

local ControlBase = class("ControlBase")

function ControlBase:ctor(...)
	self.app_ = MyApp
	self.name = self.__cname
	self.timer_ = Timer.new()

	local appevents = rawget(self.class,"__APPEVENT_BINDING")
	if appevents then
		self:createAppEventBinding(appevents)
	end

	if self.onCreate then
		self:onCreate(...)
	end
end

function ControlBase:__onDestroy()
	if self.onDestroy then
		self:onDestroy()
	end

	if self.appevent_list_ then
		for _,v in pairs(self.appevent_list_) do
			--print(k,v)
			self.app_:removeEventListener(v)
		end
	end

	self.timer_:killAll()
end


function ControlBase:createAppEventBinding(binding)
	print("createAppEventBinding:".. self.__cname )
	self.appevent_list_ = {}
	for eventname,v in pairs(binding) do
		assert(type(self[v]) == "function" , "[ControlBase:createAppEventBinding] binding must be a function! eventname = "..eventname)
		assert(EventConst[eventname],"[ControlBase:createAppEventBinding] EventConst[".. eventname .."] is nil!" )
		self.appevent_list_[eventname] = self.app_:addEventListener(EventConst[eventname] , handler(self,self[v]))
	end
end

return ControlBase
