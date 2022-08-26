DiceHand = {}

class("DiceHand").extends(NobleSprite)

local diewidth = 40
local padding = 15

function DiceHand:init(x,y,numberofdice,six,odd,even)
  DiceHand.super.init(self, "assets/images/tray")

  self.__x = x
  self.__y = y
   -- set up the dice
  self.dicesprites = {}
  for i = 1,numberofdice do
    self.dicesprites[i] = Dice(-300, 100, 1)
    self.dicesprites[i]:setBad(six, odd, even)
  end

  -- set up the 'tray'

  self:setSize(345, 38)
  self:setCenter(0.0, 0.0)
  self:moveTo(x,y)
end

function DiceHand:addToScene(scene)
  scene:addSprite(self)

  for i = 1,#self.dicesprites do
    scene:addSprite(self.dicesprites[i])
  end
end

function DiceHand:removeFromScene(scene)
  scene:removeSprite(self)

  for i = 1,#self.dicesprites do
    scene:removeSprite(self.dicesprites[i])
  end
end

function DiceHand:showTheDice()
  for i = 1,#self.dicesprites do
    self.dicesprites[i]:moveTo(self.__x + padding + (i-1)*diewidth, self.__y - padding, 1)
  end
end

function DiceHand:hideTheDice()
  for i = 1,#self.dicesprites do
    self.dicesprites[i]:moveTo(-300, 100, 1)
  end
end

function DiceHand:rollTheDice()
  for i = 1,#self.dicesprites do
    self.dicesprites[i]:rollDice()
  end
end
