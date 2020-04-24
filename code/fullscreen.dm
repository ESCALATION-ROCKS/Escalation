client
	var
		fullscreen = 0
	verb
		fullscreen()
			set hidden = 1
			fullscreen = !fullscreen
			if(fullscreen)

				winset(src, "mainwindow", "is-maximized=false;can-resize=false;titlebar=false;menu=false")
				winset(src, "mainwindow", "is-maximized=true")
			else
				winset(src, "mainwindow", "is-maximized=false;can-resize=true;titlebar=true;menu=menu")
