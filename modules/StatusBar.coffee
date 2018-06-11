class exports.StatusBar extends Layer
	n = Screen.width/750
	constructor: (@options={}) ->
		_.defaults @options,
			backgroundColor: "#FFF"
			width: Screen.width
			height: 40*n
			opacity: 0.96
			image: "images/Status Bar (White).png"
			z:4
			backgroundBlur = 40
		@topbar = new Layer
			width: Screen.width
			height: 88*n
			backgroundColor: "#FFF"
	
		@pageTitle = new TextLayer
			fontSize:34*n
			fontWeight:800
			color:"#2D2929"
			backgroundColor: null
			textAlign: "center"
			x:Align.center
			width:Screen.width

		@topbarRightIcon01 = new Layer
			width: 32*n
			height:32*n
			backgroundColor: null
			x: Align.right(-32*n)
			image: "images/nav_icon_mess@2x.svg"
			
		@topbarLeftIcon01 = new Layer
			width: 32*n
			height:32*n
			backgroundColor: null
			x: Align.left(32*n)
			image: "images/nav_icon_back@2x.svg"

		super @options
		
		@topbar.parent = @
		@topbar.y = 40*n
		@pageTitle.parent = @topbar
		@topbarRightIcon01.parent = @topbar
		@topbarRightIcon01.y = Align.center()
		@topbarLeftIcon01.parent = @topbar
		@topbarLeftIcon01.y = Align.center()
		@pageTitle.y = Align.center()
		@pageTitle.text = "PageName"
		
	
