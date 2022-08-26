Dice = {}

class("Dice").extends(NobleSprite)

function Dice:init(x,y, val)
	Dice.super.init(self, "assets/images/dice", true)
  self:setSize(37, 37)
  self:setImage(self.animation.imageTable:getImage(val))
	self:setZIndex(800)
  self:moveTo(x,y)
end
