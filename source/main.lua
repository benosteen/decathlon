import 'libraries/noble/Noble'

import 'utilities/Utilities'

import 'scenes/ExampleScene'
import 'scenes/ExampleScene2'
import 'scenes/OneHundredMetres'

import 'diceobjs/Dice'

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

Noble.new(ExampleScene, 1.5, Noble.TransitionType.CROSS_DISSOLVE)
