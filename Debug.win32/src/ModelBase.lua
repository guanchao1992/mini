--[[
	所有Model的基类，提供通用的初始化函数onCreate和释放函数onDestroy

]]

local ModelBase = class("ModelBase")

function ModelBase:ctor( ... )
	self.app_ 	= MyApp
	self.name_	= self.__cname

	if self.onCreate then self:onCreate(...) end
end

function ModelBase:__onDestroy()
	if self.onDestroy then self:onDestroy() end
end

return ModelBase