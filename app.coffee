# Import file "v2A"
sketch = Framer.Importer.load("imported/v2A@1x", scale: 1)

#set up indext page to scroll
scroll_index = ScrollComponent.wrap(sketch.scroll_indext)
scroll_index.width= 1440
scroll_index.height= 900
scroll_index.superLayer = sketch.Navigation
scroll_index.centerX()
scroll_index.scrollHorizontal = false

#set up detail page to scroll
scroll = ScrollComponent.wrap(sketch.scroll)
scroll.scrollHorizontal = false
scroll.width= 1440
scroll.height= 900

#bring the navigation to the front
sketch.Navigation1.superLayer = sketch.Screen
sketch.Navigation1.bringToFront()
sketch.Navigation1.centerX()

#inport all the gifs
imagaA = new Layer
	width: 473
	height: 411
	image: "images/imagaA.gif"
	superLayer: sketch.cellphone
	x: -400
	y: -90
	z: -1

imageB = new Layer
	width: 473
	height: 411
	image: "images/imageB.gif"
	superLayer: sketch.fanny_pack
	x: 500
	y: -100
	
duck_treats_animate = new Layer
	width: 500
	height: 368
	image: "images/duck-treats-animate-b.gif"
	superLayer:sketch.treat
	x:-500
	y:-90
	z: -1

sign_up_box = new Layer
	width: 641
	height: 472
	scale: 0.9
	image: "images/sign-up-box.gif"
	superLayer: sketch.fetch_the_box
	x:-580
	y:-220
	z:-1
#inport video
video = new VideoLayer
	width: 1920/2
	height: 1080/2
	video: "images/90s Sperber Cut_v01_H264.mp4"
	superLayer: sketch.video_image
	z: -1

#hide the video copy and button when the video is playing
sketch.video_copy.states.stateHide =
		opacity: 0
sketch.video_icon.states.stateHide =
		opacity: 0
sketch.video_ui.states.stateShow = 
	opacity: 1
sketch.video_ui.opacity = 0
				
sketch.video_icon.on Events.Click, ->
	sketch.video_copy.animate "stateHide"
	sketch.video_icon.animate "stateHide"
	sketch.video_ui.animate "stateShow"
	video.player.play()

#set up the video player
video.on Events.Click, ->
	if video.player.paused == true
		video.player.play()
	else
		video.player.pause()

#define states for the hero and the rest of page
sketch.hero.states.stateHide= 
	scale: 0.5
	opacity: 0

sketch.hero.states.stateShow= 
	scale: 1
	opacity: 1

sketch.send_load.states.stateHide= 
	y: 80
	opacity: 0

sketch.send_load.states.stateShow= 
	opacity: 1
	y: 0


#set up hero and the rest of the page initial state
sketch.hero.stateSwitch("stateHide") 
sketch.send_load.stateSwitch("stateHide")	

animate_in_detail_page = ->
	sketch.hero.animate "stateShow",
		curve: Spring(damping: 0.6)
		time: 0.6		
	sketch.send_load.animate "stateShow",
		time: 0.4
		delay: 0.6	
		
#when click on view more, load detail page. 	
sketch.Theme_2.on Events.Click, ->
	scroll_index.opacity= 0
	scroll_index.sendToBack()
	scroll.bringToFront()
	animate_in_detail_page()
	
#set up hovers for the themes cards
sketch.throwback.on Events.MouseOver, ->
	sketch.throwback.animate
		properties:
			opacity: 0

sketch.throwback.on Events.MouseOut, ->
	sketch.throwback.animate
		properties:
			opacity: 1
	
sketch.bento.on Events.MouseOver, ->
	sketch.bento.animate
		properties:
			opacity: 0

sketch.bento.on Events.MouseOut, ->
	sketch.bento.animate
		properties:
			opacity: 1

sketch.pugly.on Events.MouseOver, ->
	sketch.pugly.animate
		properties:
			opacity: 0

sketch.pugly.on Events.MouseOut, ->
	sketch.pugly.animate
		properties:
			opacity: 1

#below are all animateion to load in the indext page			
#animation to load in the hero copy
sketch.Group_3_Copy.states.title_hide = 
	opacity: 0
	y: 240
	
sketch.Group_3_Copy.states.title_show = 
	opacity: 1
	y: 210

sketch.Group_3_Copy.stateSwitch("title_hide")

load_in_hero_copy = 
	sketch.Group_3_Copy.animate "title_show",
		time: 0.5
		delay: 0.7
		


#animate load in the dinos
sketch.dino1.states.hide =
	opacity: 0
	y: 75
	x: -4
sketch.dino1.states.show =
	opacity: 1
	y: 52
	x: -4
sketch.dino1.stateSwitch("hide")

load_in_dino1 = 
	sketch.dino1.animate "show",
		time: 0.4
		delay: 1
#--------
sketch.dino2.states.hide =
	opacity: 0
	y: 349
	x: 467
sketch.dino2.states.show =
	opacity: 1
	x: 495
	y: 339
sketch.dino2.stateSwitch("hide")

load_in_dino2 = 
	sketch.dino2.animate "show",
		time: 0.4
		delay: 1.1
#--------
sketch.dino3.states.hide =
	opacity: 0
	y: 266
	x: 890
sketch.dino3.states.show =
	opacity: 1
	y: 245
	x: 852
sketch.dino3.stateSwitch("hide")

load_in_dino3 = 
	sketch.dino3.animate "show",
		time: 0.4
		delay: 1.3
		
#---------
sketch.dino4.states.hide =
	opacity: 0
	y: 130
	x: 1002
sketch.dino4.states.show =
	opacity: 1
	y: 112
	x: 984
sketch.dino4.stateSwitch("hide")

load_in_dino4 = 
	sketch.dino4.animate "show",
		time: 0.4
		delay: 1.1
		
load_in_hero_copy.start()						
load_in_dino1.start()
load_in_dino2.start()
load_in_dino3.start()
load_in_dino4.start()
