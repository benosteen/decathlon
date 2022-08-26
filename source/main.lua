import 'libraries/noble/Noble'

import 'utilities/Utilities'

import 'scenes/TitleScene'
import 'scenes/OneHundredMetres'

import 'diceobjs/Dice'
import 'diceobjs/DiceHand'

Noble.Settings.setup({
	Difficulty = "Medium"
})

Noble.GameData.setup({
	Score = 0
})

Noble.showFPS = true

dicesprites = {Dice(-100, 0, 1), }

for i = 1,8 do
	dicesprites[i] = Dice(-100, 0, 1)
end

Noble.new(TitleScene, 1.5, Noble.TransitionType.CROSS_DISSOLVE)
