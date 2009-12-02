			function GetUnity () {
				if (navigator.appVersion.indexOf("MSIE") != -1 && navigator.appVersion.toLowerCase().indexOf("win") != -1)
					return document.getElementById("UnityObject");
				else if (navigator.appVersion.toLowerCase().indexOf("safari") != -1)
					return document.getElementById("UnityObject");
				else
					return document.getElementById("UnityEmbed");
			}
			
			function DetectUnityWebPlayer () {
        		var tInstalled = false;
        		if (navigator.appVersion.indexOf("MSIE") != -1 && navigator.appVersion.toLowerCase().indexOf("win") != -1) {
					tInstalled = DetectUnityWebPlayerActiveX();
        		}
        		else {
            		if (navigator.mimeTypes && navigator.mimeTypes["application/vnd.unity"]) {
                		if (navigator.mimeTypes["application/vnd.unity"].enabledPlugin && navigator.plugins && navigator.plugins["Unity Player"]) {
                 			tInstalled = true;	
            			}
         			}	
        		}
        		return tInstalled;	
    		}
    		
    		function GetInstallerPath () {
    			var tDownloadURL = "";
	   			var hasXpi = navigator.userAgent.toLowerCase().indexOf( "firefox" ) != -1;
	   			
    			// Use standalone installer
    			if (1)
    			{
					if (navigator.platform == "MacIntel")
						tDownloadURL = "http://webplayer.unity3d.com/download_webplayer-2.x/webplayer-i386.dmg";
					else if (navigator.platform == "MacPPC")
						tDownloadURL = "http://webplayer.unity3d.com/download_webplayer-2.x/webplayer-ppc.dmg";
					else if (navigator.platform.toLowerCase().indexOf("win") != -1)
						tDownloadURL = "http://webplayer.unity3d.com/download_webplayer-2.x/UnityWebPlayer.exe";
					return tDownloadURL;
    			}
    			// Use XPI installer
				else
				{
					if (navigator.platform == "MacIntel")
						tDownloadURL = "http://webplayer.unity3d.com/download_webplayer-2.x/UnityWebPlayerOSX.xpi";
					else if (navigator.platform == "MacPPC")
						tDownloadURL = "http://webplayer.unity3d.com/download_webplayer-2.x/UnityWebPlayerOSX.xpi";
					else if (navigator.platform.toLowerCase().indexOf("win") != -1)
						tDownloadURL = "http://webplayer.unity3d.com/download_webplayer-2.x/UnityWebPlayerWin32.xpi";
					return tDownloadURL;
				}    			
    		}
			
			function AutomaticReload () {
				navigator.plugins.refresh();
				if (DetectUnityWebPlayer())
					window.location.reload();

				setTimeout('AutomaticReload()', 500)
			}
