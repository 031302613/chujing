function DetectUnityWebPlayerActiveX
			on error resume next
			dim tControl
			dim res
			res = 0
			set tControl = CreateObject("UnityWebPlayer.UnityWebPlayer.1")
			if IsObject(tControl) then
				res = 1
			end if
			DetectUnityWebPlayerActiveX = res
		end function