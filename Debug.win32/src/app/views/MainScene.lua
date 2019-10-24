
local MainScene = class("MainScene", cc.load("mvc").ViewBase)

function MainScene:onCreate()
	-- add background image
	display.newSprite("HelloWorld.png")
	:move(display.center)
	:addTo(self)

	-- add HelloWorld label
	cc.Label:createWithSystemFont("Hello World", "Arial", 40)
	:move(display.cx, display.cy + 200)
	:addTo(self)


	--print("12344")
	--MyApp:test()

	--键盘响应
	if not self.key_back_handler_ then
		self.key_back_handler_ = cc.EventListenerKeyboard:create()
		self.key_back_handler_:registerScriptHandler(handler(self, self.onKeyPressed),cc.Handler.EVENT_KEYBOARD_PRESSED)
		self.key_back_handler_:registerScriptHandler(handler(self, self.onKeyReleased),cc.Handler.EVENT_KEYBOARD_RELEASED)
	end

	local eventDispatcher = cc.Director:getInstance():getEventDispatcher()
	eventDispatcher:addEventListenerWithSceneGraphPriority(self.key_back_handler_,self)	

end

function MainScene:onKeyPressed(code,event)
	print('[按下]' .. code)
	MyApp:dispatch(EventConst.KEY_DOWN,code)
	-- body
end

function MainScene:onKeyReleased(code,event)
	print('[弹起]' .. code)
	MyApp:dispatch(EventConst.KEY_UP,code)
	--body
end

return MainScene
