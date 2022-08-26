OneHundredMetres = {}
class("OneHundredMetres").extends(NobleScene)

OneHundredMetres.baseColor = Graphics.kColorWhite

local background
local sequence
local dicehand

function OneHundredMetres:init()
	OneHundredMetres.super.init(self)
	background = Graphics.image.new("assets/images/track")

  dicehand = DiceHand(10, 202, 4, true, false, false)

	local crankTick = 0

	OneHundredMetres.inputHandler = {
		upButtonDown = function()
			dicehand:showTheDice()
		end,
		downButtonDown = function()
			dicehand:hideTheDice()
		end,
		-- rightButtonDown = function()
		-- 	dicesprites[1]:setBad(true, false, false)
		-- end,
		cranked = function(change, acceleratedChange)
			crankTick = crankTick + change
			if (crankTick > 30) then
				crankTick = 0
        dicehand:rollTheDice()
				-- menu:selectNext()
			elseif (crankTick < -30) then
				crankTick = 0
				-- menu:selectPrevious()
			end
		end,
		AButtonDown = function()
			Noble.transition(TitleScene, 1, Noble.TransitionType.DIP_TO_WHITE)
		end,
		-- BButtonDown = function()
		-- 	dicesprites[1]:rollDice()
		-- end
	}

end

function OneHundredMetres:enter()
	OneHundredMetres.super.enter(self)

  sequence = Sequence.new():from(0):to(100, 1.5, Ease.outBounce)
  sequence:start();
end

function OneHundredMetres:start()
	OneHundredMetres.super.start(self)

	Noble.Input.setCrankIndicatorStatus(true)

  dicehand:addToScene(self)
end

function OneHundredMetres:drawBackground()
	OneHundredMetres.super.drawBackground(self)

	background:draw(0, 0)
end

function OneHundredMetres:update()
	OneHundredMetres.super.update(self)

end

function OneHundredMetres:exit()
	OneHundredMetres.super.exit(self)

	Noble.Input.setCrankIndicatorStatus(false)
	sequence = Sequence.new():from(100):to(240, 0.25, Ease.inSine)
	sequence:start();

end

function OneHundredMetres:finish()
	OneHundredMetres.super.finish(self)

  dicehand:removeFromScene(self)
end
