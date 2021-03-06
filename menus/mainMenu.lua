local storyboard = require "storyboard"
local scene = storyboard.newScene()
local widget = require "widget"

local function createButton(buttonLabel, release)
	local button = widget.newButton{
		label = buttonLabel,
		labelColor = { default={255}, over={128} },
		fontSize = 30,
		width = 300,
		height = 100,
		onRelease = release
	}
	return button
end

-- buttons
local newGameButton
local settingsButton
local helpButton

local function newGameButtonRelease()
	storyboard.gotoScene("newGame")
	return true
end

local function settingsButtonRelease()
	storyboard.gotoScene("settings")
	return true
end

local function helpButtonRelease()
	storyboard.gotoScene("help")
	return true
end

function scene:createScene( event )
	local group = self.view

	-- create all items here

	local name = display.newText("geodef", 0, 0, native.systemFont, 50)
	name.x = display.contentWidth * .5
	name.y = display.contentHeight * (1/8)

	newGameButton = createButton("New Game", newGameButtonRelease)
	newGameButton.x = display.contentWidth * .25
	newGameButton.y = display.contentHeight * (3/8)

	settingsButton = createButton("Settings", settingsButtonRelease)
	settingsButton.x = display.contentWidth * .75
	settingsButton.y = display.contentHeight * (3/8)

	helpButton = createButton("Help", helpButtonRelease)
	helpButton.x = display.contentWidth * .25
	helpButton.y = display.contentHeight * (5/8)

	-- insert all objects here
	group:insert(name)
	group:insert(newGameButton)
	group:insert(settingsButton)
	group:insert(helpButton)

end

function scene:enterScene( event )
	local group = self.view
	
end

function scene:exitScene( event )
	local group = self.view
	
end

function scene:destroyScene( event )
	local group = self.view

end

scene:addEventListener("createScene", scene)
scene:addEventListener("enterScene", scene)
scene:addEventListener("exitScene", scene)
scene:addEventListener("destroyScene", scene)

return scene
