scriptId = 'com.thalmic.examples.outputeverything'
scriptTitle = "Code v2.3"
scriptDetailsUrl = "" -- We don't have this until it's submitted to the Myo Market


function onPeriodic()
-- 	if(pitch>3*3.1415/8 and pitch<5*3.14/8) then
--     	myo.debug("Pitch")
--     end
--     if(roll>=(-3.14/8) and roll<=1*3.14/8) then
--     	myo.debug("roll")
end



function onForegroundWindowChange(app, title)
    --myo.debug("onForegroundWindowChange: " .. app .. ", " .. title)
    if (app=="Myo Connect.exe") then
    	--myo.unlock("timed")
    	--myo.debug("locking policy = timed")
      return true
	else
		--myo.unlock("timed")
		--myo.debug("locking plocy = timed")
    end
    if(app=="sublime_text.exe") then
    	return false
    elseif(app=="chrome.exe") then
    	return true
    end

    if(app=="PassManager.exe") then
    return true
  else

    return false
  end

    --return platform == "Windows" and (app=="cmd.exe")
    
end

function unlocked()
  --myo.debug("Unlocked!")
        myo.keyboard("z","press", "shift")
        myo.keyboard("x","press", "shift")
        myo.keyboard("c","press")
        myo.keyboard("9","press")
        myo.keyboard("8","press")
        myo.keyboard("6","press")
        myo.keyboard("9","press")
        myo.keyboard("y","press","shift")
        myo.keyboard("6","press")
        myo.keyboard("9","press")
        myo.keyboard("u","press")
        myo.keyboard("6","press")
        myo.keyboard("9","press")
        myo.keyboard("b","press")
        myo.keyboard("return","press")
end

function tabforward()
  myo.keyboard("tab","press")
end

function tabbackward()
  myo.keyboard("tab","press","shift")
end

function commandprompt()
  myo.keyboard("n","press")
  myo.keyboard("o","press")
end

function onPoseEdge(pose, edge)
    --myo.debug("onPoseEdge: " .. pose .. ", " .. edge)
    
    roll=myo.getRoll()
    pitch = myo.getPitch()
    yaw=myo.getYaw()


   		if(pitch>7*3.1415/16 and pitch<9*3.14/16) then
    		if (pose=="waveIn") then
    	     unlocked()
    		end
    	end

      if(pitch>-3.14/4 and pitch<3.14/4) then
   		 if(pose=="waveOut" and edge=="on") then
          tabforward()
        elseif(pose=="waveIn" and edge=="on") then
          tabbackward()  
        end
   		end

      if(pitch>-3*3.14/8 and pitch < -3.14/8) then
   		 if(pose=="fingersSpread" and edge=="on") then
   			  commandprompt()
        end
   		end
end

function activeAppName()

    return ""
end

function onActiveChange(isActive)
    --myo.debug("onActiveChange")
end