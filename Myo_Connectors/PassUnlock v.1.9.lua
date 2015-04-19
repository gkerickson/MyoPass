scriptId = 'com.thalmic.examples.outputeverything'
scriptTitle = "Code v.9"
scriptDetailsUrl = "" -- We don't have this until it's submitted to the Myo Market


function onPeriodic(pose,edge)
-- 	if(pitch>3*3.1415/8 and pitch<5*3.14/8) then
--     	myo.debug("Pitch")
--     end
--     if(roll>=(-3.14/8) and roll<=1*3.14/8) then
--     	myo.debug("roll")
    roll=myo.getRoll()
    pitch = myo.getPitch()
    yaw=myo.getYaw()

  if(pitch>-3.14/4 and pitch<3.14/4) then
    if(pose=="fist" and edge=="on") then
      myo.debug("pose")
      myo.keyboard("left_win","down")
      myo.keyboard("tab","press")
      myo.keyboard("tab","press")
    end
  end
  myo.keyboard("left_win","up")
end



function onForegroundWindowChange(app, title)
    myo.debug("onForegroundWindowChange: " .. app .. ", " .. title)
    if (app=="Myo Connect.exe") then
    	myo.unlock("timed")
    	myo.debug("locking policy = hold")
      return true
	else
		myo.unlock("timed")
		myo.debug("locking plocy = timed")
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

function onPoseEdge(pose, edge)
    myo.debug("onPoseEdge: " .. pose .. ", " .. edge)
    
    roll=myo.getRoll()
    pitch = myo.getPitch()
    yaw=myo.getYaw()


   		if(pitch>7*3.1415/16 and pitch<9*3.14/16) then
    		if (pose=="waveIn") then
    	myo.debug("Unlocked!")
        myo.keyboard("q","press")
        myo.keyboard("w","press")
        myo.keyboard("o","press")
        myo.keyboard("p","press")
        myo.keyboard("return","press")
    		end
    	
   		end
      if(pitch>-3.14/4 and pitch<3.14/4) then
   		 if(pose=="waveOut" and edge=="on") then
          myo.keyboard("tab","press")
        elseif(pose=="waveIn" and edge=="on") then
          myo.keyboard("tab","press","shift")
          
        end
   		end
   		
   		if pose=="fist" and edge=="on" then
   			--myo.keyboard("left_alt","press","tab")
   		end
      if(pitch>-3*3.14/8 and pitch < -3.14/8) then
   		 if(pose=="fingersSpread" and edge=="on") then
   			  myo.keyboard("f11","press")
        end



   		end
end

function activeAppName()

    return ""
end

function onActiveChange(isActive)
    myo.debug("onActiveChange")
end