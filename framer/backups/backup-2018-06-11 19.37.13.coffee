{StatusBar} = require "StatusBar"

Screen.backgroundColor = "#FFF"
n = Screen.width/750
StatusBar = new StatusBar
StatusBar.backgroundColor = null
StatusBar.image = "images/Status Bar (White).png"
StatusBar.topbar.backgroundColor = null
StatusBar.pageTitle.text = ""
StatusBar.topbarLeftIcon01.image = "images/icon_close.png"
StatusBar.topbarRightIcon01.image = "images/icon_help.png"


scrolllSound = new Audio("sounds/Collapse.m4a")
TouchSound = new Audio("sounds/Tab1.m4a")
tooltipSound = new Audio("sounds/Tab2.m4a")

# Springs缓动预定义
iOSAppLaunch = "spring(320,40,0)"
iOSKeyboard = "spring(280,33,10)"
iOSSlideView = "spring(220,28,0)"
iOSRetreat = "spring(220,28,0)"
iOSActionSheet = "spring(280,33,10)"

materialAppLaunch = "spring(260,32,16)"
materialKeyboard = "spring(220,35,25)"
materialSlideView = "spring(220,35,25)"
materialRetreat = "spring(160,30,10)"
materialActionSheet = "spring(250,37,20)"

floaty = "spring(160,40,10)"
hello = "spring(400,22,20)"
retreat = "spring(160,30,10)"
pop = "spring(280,13,10)"
bigPop = "spring(370,8,0)"
dramatic = "spring(120,140,0)"
slow = "spring(100,50,0)"
quick = "spring(400,23,6)"
loose = "spring(240,18,28)"

# 为图层新增一个添加隔断色块的属性函数
Layer.prototype.addBlok = (shadowY,color)->
	this.shadowColor = color
	this.shadowY = shadowY


# 期数筛选

PeriodsArr = ["12期","24期","36期"]
PeriodsBtnArr = []

prdBg = new Layer
	width: Screen.width
	backgroundColor: "#FFF"
	height: 120*n
	y: 440*n
# 	shadowColor: "rgba(245,245,245,1)"
# 	shadowX: 0
# 	shadowY: 8	
prdBg.addBlok(8,"#fAfAfA")


for i in [0...PeriodsArr.length]
	btn = new Layer
		parent: prdBg
		x: 220*n*i+56*n
		y: Align.center
		backgroundColor: "transparent"
		width: 184*n
		height: 64*n
		
	btn_bg = new Layer
		parent: btn
		x: 0
		y: 0
		width: 184*n
		height: 64*n
		backgroundColor: "transparent"
		borderRadius: 200
		borderColor: "rgba(130,130,130,0.3)"
		borderWidth: 1
	
	btn_txt = new TextLayer
		parent: btn
		x: Align.center
		y: Align.center
		text:PeriodsArr[i]
		fontSize: 28*n
		fontFamily: "PingFang SC"
		fontWeight: 400
		letterSpacing: 0.0
		lineHeight: 1.125
		textAlign: "center"
		color: "rgba(117,117,117,1)"
	
	
	
	PeriodsBtnArr.push(btn)

	
	PeriodsBtnArr[i].onTouchStart (event, layer) ->
		TouchSound.play()
		for i in [0...PeriodsArr.length]
			PeriodsBtnArr[i].children[0].borderWidth = 1
			PeriodsBtnArr[i].children[0].backgroundColor = "#FFF"
			PeriodsBtnArr[i].children[0].shadowY = 0
			PeriodsBtnArr[i].children[0].shadowBlur = 0
			PeriodsBtnArr[i].children[0].shadowColor = "null"

			PeriodsBtnArr[i].children[1].color = "rgba(117,117,117,1)"
# 		print parseInt(@children[1].text)
		@children[0].borderWidth = 0
		@children[0].backgroundColor = "#ff6361"
		@children[1].color = "#FFF"
		@children[0].shadowY = 4
		@children[0].shadowBlur = 24
		@children[0].shadowColor = "rgba(255,99,97,0.5)"
	# 		this.btn_txt.color = "rgba(117,117,117,1)"	

#intial
PeriodsBtnArr[2].children[0].borderWidth = 0
PeriodsBtnArr[2].children[0].backgroundColor = "#ff6361"
PeriodsBtnArr[2].children[1].color = "#FFF"	
PeriodsBtnArr[2].children[0].shadowY = 4
PeriodsBtnArr[2].children[0].shadowBlur = 24
PeriodsBtnArr[2].children[0].shadowColor = "rgba(255,99,97,0.5)"	


#金额选择
maxNum = 24000
limbCount = maxNum/1000
	
topBg = new Layer
	width: Screen.width
	height: 440*n
	backgroundColor: "#FF6361"
	image: "images/topbg.png"


	
	
num_title = new TextLayer
	x: Align.center
	y: 168*n
	text: "确认借多少(元)"
	fontSize: 32*n
	fontFamily: "PingFang SC"
	fontWeight: 300
	letterSpacing: 0.0
	lineHeight: 1
	textAlign: "center"
	color: "rgba(255,255,255,0.72)"


scroll = new ScrollComponent
	width: Screen.width
	y: 0
	height: 440*n
	scrollHorizontal: true
	scrollVertical: false
scroll.content.draggable.momentum = true
scroll.content.draggable.overdrag = false
prdBg.placeBefore(scroll)

limbArr = []


for i in [0..limbCount]
	limb = new Layer
		parent: scroll.content
		x: 200*n*i
		y: 425*n
		width: 200*n
		height: 18*n
		backgroundColor: null
		image: "images/limbbg.png"
	
	limbNum = new TextLayer
		parent: scroll.content
		x: 200*n*i-32*n
		y: 380*n
		text: 1000*i
		fontSize: 24*n
		fontWeight: 0
		textAlign: "center"
		color: "rgba(255,255,255,0.6)"
	limbArr.push(limb)	
		

limbArr[0].image = "images/limbHead.png"
limbArr[limbCount].visible = false
scroll.contentInset =
   left: 375*n/2-10*n
   right: 375*n/2-10*n
   
pointer = new Layer
	parent: scroll
	backgroundColor: "#FFF"
	x: Align.center
	y: 412*n
	width: 2*n
	height: 32*n   
num = new TextLayer
		x: Align.center
		y: 200*n
		text: "1000"
		fontSize: 112*n
		fontFamily: "DIN Alternate"
		fontWeight: 700
		letterSpacing: 0.0
		textAlign: "center"
		color: "rgba(255,255,255,1)"
		
getNum = null
scroll.content.on Events.DragStart, ->
	scrolllSound.play()
scroll.content.on "change:x", ->
	num.text = 1000-Math.round((scroll.content.x-187*n)/limb.width*10)*100
	num.x = Align.center
	# 如果当前金额大于获取的额度范围则等于最大额度
	if Number(num.text)>maxNum then num.text=maxNum

#initial
numRun = new Animation scroll.content,
    x: -scroll.content.width+375*n+200*n
    options:
      time:0.2
numRun.start()


#列表选择器
optionsArr = ["租房","就业深造","婚庆","旅行","消费购物","自主创业"]
sheetTitleArr = ["选择借款用途","请选择时机资金用途，禁止用于购房，投资及各种非消费场景"]

costRate = "23.88%"


picker = new Layer
	x: 0
	y: 568*n
	backgroundColor: "transparent"
	width: Screen.width
	height: 96*n

pickerBg = new Layer
	parent: picker
	x: 0
	y: 0
	width: Screen.width
	height: 96*n
	backgroundColor: "rgba(255,255,255,1)"

pickerBg.addBlok(8,"#FAFAFA")

elementsarrow = new Layer
	parent: picker
	x: Align.right(-32*n)
	y: Align.center
	width: 32*n
	height: 32*n
	backgroundColor: null
	image: "images/arrow.svg"

pickTitle = new TextLayer
	parent: picker
	x: 40*n
	y: Align.center
	text: "怎么用"
	fontSize: 32*n
	fontFamily: "PingFang SC"
	fontWeight: 800
	textAlign: "left"
	color: "#212121"

pickValue = new TextLayer
	parent: picker
	x: Align.right(-72*n)
	y: Align.center
	text: "请选择"
	fontSize: 28*n
	fontFamily: "PingFang SC"
	fontWeight: 400
	lineHeight: 1
	textAlign: "right"
	color: "rgba(158,158,158,1)"
	
overlay = new Layer
	width: Screen.width
	height:Screen.height
	backgroundColor: "rgba(0,0,0,0.6)"
	z: 4
	opacity: 0
	y: 2
	
overlay.states =
    show:
        opacity: 1
        options:
          time: 0.5
          curve: iOSActionSheet
	
# sheetTitle.addBlok(1,"#F5F5F5")
sheet = new Layer
	parent: overlay
	y: Screen.height
	width: Screen.width
	height: optionsArr.length*97*n+172*n
	backgroundColor: "#EEE"
	z: 4
	opacity: 0
	# 	shadowX: 0

sheetClose = new TextLayer
	parent: sheet
	width: Screen.width
	height: 96*n
	y: Align.bottom
	text: "取消"
	backgroundColor: "#FFF"
	fontSize: 32*n
	fontWeight: 400
	color: "#FF6361"
	lineHeight: 3
	textAlign: "center"


sheet.states =
    show:
        y:Align.bottom
        opacity: 1



#bottom
bottom = new Layer
	x: 0
	y: Align.bottom
	z: 5
	backgroundColor: "transparent"
	width: Screen.width
	height: 252*n

btn = new TextLayer
	text: "确定借款"
	parent: bottom
	x: Align.center
	textAlign: "center"
	color: "#FFF"
	y: 24*n
	backgroundColor: "#FF6361"
	width: 654*n
	height: 88*n
	opacity: 0.3
	fontSize: 36*n
	lineHeight: 2.4
	image: "images/btnBg.png"
	borderRadius: 160*n
	
btnShadow = btn.copy()
btnShadow.parent = btn
btnShadow.blur = 18
btnShadow.x = 0
btnShadow.y = 10*n

mention = new TextLayer
	parent: bottom
	x: Align.center
	y: 124*n
	text: "本人承诺非在校学生"
	fontSize: 22*n
	fontFamily: "PingFang SC"
	fontWeight: 400
	lineHeight: 1.6363636363636365
	textAlign: "left"
	color: "rgba(189,189,189,1)"

tips = new TextLayer
	parent: bottom
	x: Align.center
	y: 166*n
	width: 654*n
	text: "温馨提醒：点击“确认借款”后，你有5小时的冷静期，期间可取消借款，详见帮助中心。"
	fontSize: 22*n
	fontFamily: "PingFang SC"
	fontWeight: 400
	lineHeight: 1.6363636363636365
	textAlign: "left"
	color:"#BDBDBD"


#product detail
proDet = new Layer
	x: 0
	y: picker.y+picker.height+8*n
	backgroundColor: "transparent"
	width: Screen.width
	height: 408*n

list01 = new Layer
	parent: proDet
	x: Align.center
	y: 0
	backgroundColor: "transparent"
	width: Screen.width-80*n
	height: 80*n
list01.addBlok(1,"#eee")


listbg01 = new Layer
	parent: list01
	x: Align.center
	width: Screen.width-80*n
	height: 80*n
	backgroundColor: "rgba(255,255,255,0.01)"

list01_name = new TextLayer
	parent: list01
	x: Align.left
	y: Align.center
	text: "实际到账"
	fontSize: 30*n
	fontFamily: "PingFang SC"
	fontWeight: 600
	letterSpacing: -0.7
	textAlign: "left"
	color: "rgba(80,80,80,1)"

list01_value = new TextLayer
	parent: list01
	x: Align.right
	y: Align.center
	text: maxNum
	fontSize: 32*n
	fontFamily: "PingFang SC"
	fontWeight: 500
	letterSpacing: 0.0
	lineHeight: 1
	textAlign: "right"
	color: "rgba(66,66,66,1)"


# print parseFloat(costRate)
list02 = new Layer
	parent: proDet
	y: list01.y+list01.height+1*n
	x: Align.center
	backgroundColor: "transparent"
	width: Screen.width-80*n
	height: 102*n

listbg02 = new Layer
	parent: list02
	x: Align.center
	width: Screen.width-80*n
	height: 102*n
	backgroundColor: "rgba(255,255,255,0.01)"

list02_Subname = new TextLayer
	parent: list02
	x: Align.left
	y: Align.bottom(-14*n)
	text: "期数越长,费率越低"
	fontSize: 24*n
	fontFamily: "PingFang SC"
	fontWeight: 400
	lineHeight: 1
	textAlign: "left"
	color: "rgba(245,166,35,1)"

list02_name = new TextLayer
	parent: list02
	x: Align.left
	y: Align.center(-16*n)
	text: "年费综合费率"
	fontSize: 30*n
	fontFamily: "PingFang SC"
	fontWeight: 600
	letterSpacing: -0.7
	textAlign: "left"
	color: "rgba(80,80,80,1)"

tooltip = new Layer
	parent: list02
	x: 180*n
	y: Align.center(-18*n)
	width: 44*n
	height: 44*n
	backgroundColor: null
	image: "images/tooltip.svg"
	
toast = new Layer
	parent: tooltip
	width: Screen.width
	height: 56*n
	backgroundColor: null
	x: Align.left(-360*n)
	y: -56*n
	scale: 0.2
	opacity: 0
	originX: 0.56
	options: 
		curve: "spring(500,10,0)"

path = new Layer
	parent: toast
	x: tooltip.midX
	y: Align.bottom
	width: 36
	height: 15*n
	backgroundColor: "transparent"
	opacity: 0.96
	image: "images/Path.svg"

toastContent = new TextLayer
	parent: toast
	x: 20*n
	y: -12*n
	text: "年费率已包含年利率，贷后管理费率"
	width: Screen.width-180
	height: 60*n
	borderRadius: 8*n
	backgroundColor: "rgba(67,62,77,1)"
	fontSize: 28*n
	fontFamily: ".PingFang SC"
	fontWeight: 300
	letterSpacing: 0.0
	lineHeight: 2
	textAlign: "center"
	color: "rgba(255,255,255,1)"
	

toast.states.a =
	x: Align.left(-198*n)
	y: -64*n
	opacity: 0.96
	scale: 1	





tooltip.onTouchStart (event, layer) ->
# 	toast.animate "a",curve:quick ,time: 0.3
	toast.stateCycle(curve:quick ,time: 0.3)
	tooltipSound.play()

list02_value = new TextLayer
	parent: list02
	x: Align.right
	y: Align.center
	text: costRate
	fontSize: 32*n
	fontFamily: "PingFang SC"
	fontWeight: 500
	letterSpacing: 0.0
	lineHeight: 1
	textAlign: "right"
	color: "rgba(66,66,66,1)"

listhead = new Layer
	parent: proDet
	x: 0
	y: list02.y+list02.height
	width: Screen.width
	height: 80*n
	backgroundColor: "#FAFAFA"
# 	shadowColor: "#EEE"
# 	shadowX: 0
# 	shadowY: 1
# 	shadowBlur: 0
# 	shadowSpread: 0

listheadTitle = new TextLayer
	parent: listhead
	x: Align.left(40*n)
	y: Align.center
	text: "月还款额"
	fontSize: 30*n
	fontFamily: "PingFang SC"
	fontWeight: 600
	letterSpacing: -0.6
	textAlign: "left"
	color: "rgba(80,80,80,1)"

godetail = new TextLayer
	parent: listhead
	x: Align.right(-72*n)
	y: Align.center
	text: "产品详情"
	fontSize: 28*n
	fontFamily: "PingFang SC"
	fontWeight: 400
	lineHeight: 1
	textAlign: "right"
	color: "rgba(158,158,158,1)"

elementsarrowCopy = new Layer
	parent: listhead
	x: Align.right(-32*n)
	y: Align.center
	width: 32*n
	height: 32*n
	image: "images/arrow.svg"

list03 = new Layer
	parent: proDet
	y: listhead.y+listhead.height
	x: Align.center
	backgroundColor: "transparent"
	width: Screen.width-80*n
	height: 80*n

list03_value = new TextLayer
	parent: list03
	x: Align.right
	y: Align.center
	text: "2400"
	fontSize: 32*n
	fontFamily: "PingFang SC"
	fontWeight: 500
	letterSpacing: 0.0
	lineHeight: 1
	textAlign: "right"
	color: "rgba(66,66,66,1)"

list03_name = new TextLayer
	parent: list03
	x: Align.left
	y: Align.center
	text: "第1-6期"
	fontSize: 30*n
	fontFamily: "PingFang SC"
	fontWeight: 400
	letterSpacing: -0.7
	textAlign: "left"
	color: "rgba(80,80,80,1)"
list03.addBlok(1,"#EEE")

list04 = new Layer
	parent: proDet
	y: list03.y+list03.height
	x: Align.center
	backgroundColor: "transparent"
	width: Screen.width-80*n
	height: 80*n

list04_value = new TextLayer
	parent: list04
	x: Align.right
	y: Align.center
	text: "1200"
	fontSize: 32*n
	fontFamily: "PingFang SC"
	fontWeight: 500
	letterSpacing: 0.0
	lineHeight: 1
	textAlign: "right"
	color: "rgba(66,66,66,1)"

list04_name = new TextLayer
	parent: list04
	x: Align.left
	y: Align.center
	text: "第7-36期"
	fontSize: 30*n
	fontFamily: "PingFang SC"
	fontWeight: 400
	letterSpacing: -0.7
	textAlign: "left"
	color: "rgba(80,80,80,1)"
# list04.addBlok(1,"#EEE")




optionLayersArr = []
	
for i in [0...optionsArr.length]
	optionLayer = new TextLayer
		parent: sheet
		width: Screen.width
		height: 96*n
		y: 97*n*i+65*n+64*n
		fontSize: 32*n
		fontWeight: 400
		color: "#212121"
		text: optionsArr[i]
		lineHeight: 3
		backgroundColor: "#FFF"
		textAlign: "center"
		z: 5
		opacity: 0
	optionLayersArr.push(optionLayer)
	optionLayer.states =
		show:
			y: 97*n*i+65*n
			opacity: 1
			options:
				time:0.5
				delay:0.16*i+0.3
				curve: iOSActionSheet
					
				
	optionLayer.onTouchStart (event, layer) ->
		for i in [0...optionsArr.length]
			optionLayersArr[i].color = "#212121"
			optionLayersArr[i].image = null
			
		@.brightness = 96
		@.color = "#FF6361"
		@.image = "images/options_sel.png"
# 		for i in [0...optionsArr.length]
# 			optionLayersArr[i].animate "default",curve: iOSActionSheet,time: 0.2,delay:0.08*i+0.2
		overlay.animate "default",curve: iOSActionSheet,time: 0.5,delay: 0.4
		sheet.animate "default",curve: iOSActionSheet,time: 0.5,delay: 0.4
		pickValue.text = @text
		pickValue.x = Align.right(-64*n)
		btn.opacity = 1
		TouchSound.play()
		
			
	optionLayer.onTouchEnd (event, layer) ->
		@.brightness = 100
	optionLayer.onTouchMove (event, layer) ->
		@.brightness = 100	

		
sheetTitle = new TextLayer
	parent: sheet
	width: Screen.width
	height: 64*n
	fontSize: 28*n
	text: sheetTitleArr[0]
	color: "#757575"
	lineHeight: 2.2
	backgroundColor: "#FFF"
	fontWeight: 300
	textAlign: "center"
	z: 5
		
# 	optionLayer.addBlok(1,"#F5F5F5")	
	optionLayer.placeBehind(sheetTitle)
	
	
listhead.onTouchStart (event, layer) ->
	@.brightness = 96		
listhead.onTouchEnd (event, layer) ->
	@.brightness = 100
listhead.onTouchMove (event, layer) ->
	@.brightness = 100	
		
picker.onTouchStart (event, layer) ->
	@.brightness = 96		
picker.onTouchEnd (event, layer) ->
	@.brightness = 100
	overlay.animate "show",curve: iOSActionSheet,time: 0.5
	sheet.animate "show",curve: iOSActionSheet,time: 0.5
	for i in [0...optionsArr.length]
		optionLayersArr[i].animate "show",curve: iOSActionSheet,time: 0.2,delay:0.08*i+0.04	
picker.onTouchMove (event, layer) ->
	@.brightness = 100
	
		
sheetClose.onTouchStart (event, layer) ->
	@.brightness = 96
	overlay.animate "default",curve: iOSActionSheet,time: 0.5
	sheet.animate "default",curve: iOSActionSheet,time: 0.5
# 	for i in [0...optionsArr.length]
# 		optionLayersArr[i].animate "default",curve: iOSActionSheet,time: 0.2,delay:0.08*i+0.04
sheetClose.onTouchEnd (event, layer) ->
	@.brightness = 100
sheetClose.onTouchMove (event, layer) ->
	@.brightness = 100			

PeriodsNum = 36
# 	num.text = 1000-Math.round((scroll.content.x-187*n)/limb.width*10)*100
# 	num.x = Align.center
# 	# 如果当前金额大于获取的额度范围则等于最大额度
# 	if Number(num.text)>maxNum then num.text=maxNum
for i in [0...PeriodsArr.length]
	PeriodsBtnArr[i].onTouchStart (event, layer) ->
		PeriodsNum = parseInt(@children[1].text)
# 		print PeriodsNum

# list03_value.text = ((num.text/36+num.text*[parseFloat(costRate)*0.01])/4).toFixed(2)
# list04_value.text = ((num.text/36)).toFixed(2)

		
scroll.content.on "change:x", ->
	list01_value.text = num.text
	list01_value.x = Align.right
	list03_value.text = (((num.text/PeriodsNum)*(1+[parseFloat(costRate)*0.01]))/6).toFixed(2)
	list03_value.x = Align.right
	list04_value.text = ((num.text/PeriodsNum)).toFixed(2)
	list04_value.x = Align.right

# 	list02_value.text = (parseFloat(costRate)*(1/num.text).toFixed(2)+"%"
	list02_value.text = (23.88-(num.text*0.0001)+1/PeriodsNum).toFixed(2)+"%"
	list02_value.x = Align.right
	
	
PeriodsBtnArr[0].onTouchStart (event, layer) ->
	print 23.88-(num.text*0.0001)+1/PeriodsNum
	list02_value.text = (23.88-(num.text*0.0001)+1/PeriodsNum).toFixed(2)+"%"
	list02_value.x = Align.right
	list03_name.text = "第1-5期"
	list04_name.text = "第6-12期"
	list02_value.text = ((1/num.text+1/PeriodsNum)*1000+parseFloat(costRate)).toFixed(2)+"%"
	list02_value.x = Align.right
	list03_value.x = Align.right
	list04_value.x = Align.right
	
PeriodsBtnArr[1].onTouchStart (event, layer) ->
	print 23.88-(num.text*0.0001)+1/PeriodsNum
	list02_value.text = (23.88-(num.text*0.0001)+1/PeriodsNum).toFixed(2)+"%"
	list02_value.x = Align.right
	list03_name.text = "第1-5期"
	list04_name.text = "第6-24期"
	list02_value.text = ((1/num.text+1/PeriodsNum)*1000+parseFloat(costRate)).toFixed(2)+"%"
	list02_value.x = Align.right
	list03_value.x = Align.right
	list04_value.x = Align.right
	
PeriodsBtnArr[2].onTouchStart (event, layer) ->
	print 23.88-(num.text*0.0001)+1/PeriodsNum
	list02_value.text = (23.88-(num.text*0.0001)+1/PeriodsNum).toFixed(2)+"%"
	list02_value.x = Align.right
	list03_name.text = "第1-6期"
	list04_name.text = "第7-36期"
	list02_value.text = ((1/num.text+1/PeriodsNum)*1000+parseFloat(costRate)).toFixed(2)+"%"
	list02_value.x = Align.right
	list03_value.x = Align.right
	list04_value.x = Align.right		






