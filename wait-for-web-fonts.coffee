###! wait-for-web-fonts 2.0.0 http://github.com/Se7enSky/wait-for-web-fonts###
###
@name wait-for-web-fonts
@description Detect webfont loaded with JavaScript. Code styred from http://stackoverflow.com/a/11689060
@version 2.0.0
@author Se7enSky studio <info@se7ensky.com>
###

waitForWebFonts = (fonts, callback) ->
		done = ->
			setTimeout =>
				callback()
			, 500

		loadedFonts = 0

		((font) ->
			node = document.createElement("span")
			node.innerHTML = "giItT1WQy@!-/#"
			node.style.position = "fixed"
			node.style.left = "-10000px"
			node.style.top = "-10000px"
			node.style.fontSize = "1000px"
			node.style.fontFamily = "sans-serif"
			node.style.fontVariant = "normal"
			node.style.fontStyle = "normal"
			node.style.fontWeight = "normal"
			node.style.letterSpacing = "0"
			document.body.appendChild node
			width = node.offsetWidth
			node.style.fontFamily = font

			interval = undefined

			checkFont = ->
				# console.log 'checkFont', font
				
				# Compare current width with original width
				if node and node.offsetWidth isnt width
					++loadedFonts
					node.parentNode.removeChild node
					node = null
				
				# If all fonts have been loaded
				if loadedFonts >= fonts.length
					clearInterval interval	if interval
					if loadedFonts is fonts.length
						done()
						true

			interval = setInterval(checkFont, 500) unless checkFont()
		) f for f in fonts


# UMD 
if typeof define is 'function' and define.amd
	define [], waitForWebFonts
else
	window.waitForWebFonts = waitForWebFonts
