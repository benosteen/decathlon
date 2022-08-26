Dice = {}

class("Dice").extends(NobleSprite)

function Dice:init(x,y, val)
	Dice.super.init(self, "assets/images/dice", true)

	if val == nil then
		val = 1
	end

	self.score = val

	self.__badsix = false
	self.__odd = false
	self.__even = false
	self.__hold = false

  self:setSize(37, 37)
  self:setCenter(0.0, 0.0)
  self:setFace(val)
	self:setZIndex(800)
  self:moveTo(x,y)
end

function Dice:setFace(number)
	if number == 6 and self.__badsix then
		self.score = -6
		self:setImage(self.animation.imageTable:getImage(7))
	elseif number % 2 == 0 and self.__even or number % 2 ~= 0 and self.__odd then
		self:setImage(self.animation.imageTable:getImage(8))
		self.score = 0
	else
		self:setImage(self.animation.imageTable:getImage(number))
		self.score = number
	end
end

function Dice:setBad(six, odd, even)
	self.__badsix = six
	self.__odd = odd
	self.__even = even
end

function Dice:rollDice()
	if self.__hold ~= true then
		self:setFace(math.random(1,6))
	end
end
