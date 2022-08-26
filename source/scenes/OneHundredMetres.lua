OneHundredMetres = {}
class("OneHundredMetres").extends(NobleScene)

OneHundredMetres.baseColor = Graphics.kColorWhite

local background
local sequence

function OneHundredMetres:init()
	OneHundredMetres.super.init(self)
	background = Graphics.image.new("assets/images/track")

	local crankTick = 0

	OneHundredMetres.inputHandler = {
		-- upButtonDown = function()
		-- 	menu:selectPrevious()
		-- end,
		-- downButtonDown = function()
		-- 	menu:selectNext()
		-- end,
		cranked = function(change, acceleratedChange)
			crankTick = crankTick + change
			if (crankTick > 30) then
				crankTick = 0
        dicesprites[1]:moveTo(300,200)
				-- menu:selectNext()
			elseif (crankTick < -30) then
				crankTick = 0

        dicesprites[1]:moveTo(-100,200)
				-- menu:selectPrevious()
			end
		end,
		AButtonDown = function()
			Noble.transition(ExampleScene, 1, Noble.TransitionType.DIP_TO_WHITE)
		end
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

  for i = 1,8 do
    self:addSprite(dicesprites[i])
  end
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

  for i = 1,8 do
  	self:removeSprite(dicesprites[i])
  end
end
