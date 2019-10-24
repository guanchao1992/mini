--卡牌库数据管理

local CardsModel = class("CardsModel",require("ModelBase"))

local carditem = 
{
	objectid	= 0,	--唯一id
	id 			= 0,	--对应CardsInfoResource中的id
	level 		= 0,	--等级
}


function CardsModel:onCreate()
	self:initInfo()

end

function CardsModel:initInfo()
	math.randomseed(tostring(os.time()):reverse():sub(1, 7)) --设置时间种子

	self.cards_ = {}
	--self.cards = {{id=1,level=2},{id=1,level=2},{id=1,level=2}}	
	for i=1,10 do
		local card = self.randomCard()
		if not self:getCardByObjectid(card.objectid) then
			self:addCard(card)
		end
	end
end

function CardsModel:randomCard()
	local objectid = math.random(100000000,199999999)
	local id = math.random(1,#DataConf.CardsInfoResource)
	local card = {objectid = objectid,id = id,level = 1}
	card = card or CardsInfoResource[id]
	return card
end

--[[
card{objectid,id,level}
]]
function CardsModel:addCard(card)
	self.cards_ = self.cards_ or {}
	table.insert(self.cards_,card)
end

function CardsModel:removeCardByObjectid(objectid)
	for i,card in pairs(self.cards_) do
		if card.objectid == objectid then
			table.remove(self.cards_,i)
			return
		end
	end
end

function CardsModel:removeCardByIndex(index)
	table.remove(self.cards_,index)
end

function CardsModel:removeAllCards()
	self.cards_ = {}
end

function CardsModel:getCardByObjectid(objectid)
	for k,v in pairs(self.cards_) do
		if v.objectid == objectid then
			return v
		end
	end
	return nil
end

function CardsModel:getCardByIndex(index)
	local card = self.cards_[index]
	if card then
		return card
	end
end

--检测合成,并返回所有能够合成的id
function CardsModel:checkMerge()
	local merges = {}
	for k,v in pairs(DataConf.CardsMergeResource) do

	end
	
	return merges
end

return CardsModel