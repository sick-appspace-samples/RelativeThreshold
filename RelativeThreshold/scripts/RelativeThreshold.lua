--Start of Global Scope---------------------------------------------------------

print('AppEngine Version: ' .. Engine.getVersion())

local DELAY = 1500 -- ms between visualization steps for demonstration purpose

-- Creating viewer
local viewer = View.create("viewer2D1")

-- Setup graphical overlay attributes
local regionDecoration = View.PixelRegionDecoration.create()
regionDecoration:setColor(0, 150, 0, 150)

local textDecoration = View.TextDecoration.create()
textDecoration:setColor(0, 0, 255)
textDecoration:setSize(120)
textDecoration:setPosition(50, 150, 0)

--End of Global Scope-----------------------------------------------------------

--Start of Function and Event Scope---------------------------------------------

local function main()
  -- Load background image from resources
  local backgroundIm = Image.load('resources/BackgroundImage.bmp'):toGray()

  -- Show background image
  viewer:clear()
  local imview = viewer:addImage(backgroundIm)
  viewer:addText('BACKGROUND', textDecoration, nil, imview)
  viewer:present()
  Script.sleep(DELAY)

  local filenames = {'resources/plusplus1.bmp', 'resources/plusplus2.bmp'}

  for _, filename in ipairs(filenames) do
    -- Load foreground image
    local foregroundIm = Image.load(filename):toGray()

    -- Show foreground image
    viewer:clear()
    imview = viewer:addImage(foregroundIm)
    viewer:addText('FOREGROUND', textDecoration, nil, imview)
    viewer:present()
    Script.sleep(DELAY)

    -- Threshold using pixel values directly
    local foundRegionFixed = Image.threshold(foregroundIm, 0, 120)
    -- Threshold relative to background image
    local foundRegionRelative = Image.thresholdCompare(foregroundIm, backgroundIm, 20, false)

    -- Show image and thresholded result - direct
    viewer:clear()
    imview = viewer:addImage(foregroundIm)
    viewer:addText('DIRECT', textDecoration, nil, imview)
    viewer:addPixelRegion(foundRegionFixed, regionDecoration, nil, imview)
    viewer:present()
    Script.sleep(DELAY*2)

    -- Show image and thresholded result - compare
    viewer:clear()
    imview = viewer:addImage(foregroundIm)
    viewer:addText('COMPARE', textDecoration, nil, imview)
    viewer:addPixelRegion(foundRegionRelative, regionDecoration, nil, imview)
    viewer:present()
    Script.sleep(DELAY*2)
  end
  print('App finished.')
end
--The following registration is part of the global scope which runs once after startup
--Registration of the 'main' function to the 'Engine.OnStarted' event
Script.register('Engine.OnStarted', main)

--End of Function and Event Scope--------------------------------------------------
