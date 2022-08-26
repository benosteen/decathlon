TitleScene = {}
class("TitleScene").extends(NobleScene)

TitleScene.baseColor = Graphics.kColorWhite

local background
local logo
local menu
local sequence

local difficultyValues = {"Rare", "Medium", "Well Done"}

function TitleScene:init()
	TitleScene.super.init(self)


	background = Graphics.image.new("assets/images/title")
	logo = Graphics.image.new("libraries/noble/assets/images/NobleRobotLogo")


	menu = Noble.Menu.new(false, Noble.Text.ALIGN_LEFT, false, Graphics.kColorWhite, 4,6,0, Noble.Text.FONT_SMALL)

	menu:addItem("Play Game", function() Noble.transition(OneHundredMetres, 1, Noble.TransitionType.DIP_TO_BLACK) end)
	-- menu:addItem(
	-- 	"Difficulty",
	-- 	function()
	-- 		local oldValue = Noble.Settings.get("Difficulty")
	-- 		local newValue = math.ringInt(table.indexOfElement(difficultyValues, oldValue)+1, 1, 3)
	-- 		Noble.Settings.set("Difficulty", difficultyValues[newValue])
	-- 		menu:setItemDisplayName("Difficulty", "Difficulty: " .. difficultyValues[newValue])
	-- 	end,
	-- 	nil,
	-- 	"Difficulty: " .. Noble.Settings.get("Difficulty")
	-- )

	local crankTick = 0

	TitleScene.inputHandler = {
		upButtonDown = function()
			menu:selectPrevious()
		end,
		downButtonDown = function()
			menu:selectNext()
		end,
		cranked = function(change, acceleratedChange)
			crankTick = crankTick + change
			if (crankTick > 30) then
				crankTick = 0
				menu:selectNext()
			elseif (crankTick < -30) then
				crankTick = 0
				menu:selectPrevious()
			end
		end,
		AButtonDown = function()
			menu:click()
		end
	}

end

function TitleScene:enter()
	TitleScene.super.enter(self)

	sequence = Sequence.new():from(0):to(100, 1.5, Ease.outBounce)
	sequence:start();

end

function TitleScene:start()
	TitleScene.super.start(self)

	menu:activate()
	Noble.Input.setCrankIndicatorStatus(true)

end

function TitleScene:drawBackground()
	TitleScene.super.drawBackground(self)

	background:draw(0, 0)
end

function TitleScene:update()
	TitleScene.super.update(self)

	Graphics.setColor(Graphics.kColorBlack)
	Graphics.setDitherPattern(0.2, Graphics.image.kDitherTypeScreen)
	Graphics.fillRoundRect(5, 10, menu.width + 15, 35, 15)
	menu:draw(15, 20)

end

function TitleScene:exit()
	TitleScene.super.exit(self)

	Noble.Input.setCrankIndicatorStatus(false)
	sequence = Sequence.new():from(100):to(240, 0.25, Ease.inSine)
	sequence:start();

end

function TitleScene:finish()
	TitleScene.super.finish(self)
end
