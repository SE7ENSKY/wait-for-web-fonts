wait-for-web-fonts
==================

Detect webfont loaded with JavaScript. Code styred from http://stackoverflow.com/a/11689060

How to use
----------

CoffeeScript
```
waitForWebFonts ['Roboto'], ->
	console.log 'Roboto loaded'
```

JS
```
waitForWebFonts(['Roboto'], function() {
  return console.log('Roboto loaded');
});
```
