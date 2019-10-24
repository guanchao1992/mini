

local MyApp = class("MyApp", cc.load("mvc").AppBase)
local Timer = require("tools.Timer")


local EventConst = require("app.const.EventConst")
local DataConf = require("app.const.DataConf")

function MyApp:onCreate()
    math.randomseed(os.time())

    rawset(_G, self.__cname, self)
    cc.bind(self,"event")

    rawset(_G, "EventConst",EventConst)
    rawset(_G, "DataConf",DataConf)
    
    self.timer_ = Timer.new()
    self.timer_:start(handler(self,self.update),0)
    self.runtime_ = 0

    self:registController()
    self:registMoudel()

    self:dispatch(EventConst.GAME_START)
end

function MyApp:update(id,dt)
	self.runtime_ = self.runtime_ + dt

end

--注册所有的controller
function MyApp:registController()
	self.cl_cards = require("app.controller.CardsController").new()
end
function MyApp:unregistController()
	self.cl_cards = nil
end

--注册所有的moudel
function MyApp:registMoudel()
	self.md_cards = require("app.moudels.CardsModel").new()
end
function MyApp:unregistMoudel()
	self.md_cards =  nil 
end


return MyApp
