--卡牌控制器

local CardsController = class("CardsController",require("ControlBase"))

CardsController.__APPEVENT_BINDING = {
	KEY_DOWN 	= 	"onKeyDown",
	KEY_UP		=	"onKeyUp",
}

function CardsController:onCreate()

end

function CardsController:onDestroy()

end

function CardsController:onKeyDown(e,code)
	print("CardsController:onKeyDown:" .. tostring(code))
	if code == cc.KeyCode.KEY_A then
		local card = MyApp.md_cards:randomCard()
		if not MyApp.md_cards:getCardByObjectid(card.objectid) then
			MyApp.md_cards:addCard(card)
		end
	elseif code == cc.KeyCode.KEY_D then
		MyApp.md_cards:removeCardByIndex(1)
	elseif code == cc.KeyCode.KEY_F then
		dump(MyApp.md_cards.cards_)
	end
end

function CardsController:onKeyUp(code)

end


return CardsController
