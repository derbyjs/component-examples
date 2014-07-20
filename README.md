component-examples
==================

listing of community built derby examples

```
coffee server.coffee
```
direct your browser to `http://localhost:3330`

# Add your component
Make sure you component has an `example.coffee` and `example.html`.
Make a pull request with the following changes:  
Add your component to the package.json, add
```js
app.use require 'yourcomponent/example'
```
to index.coffee

If you have styles for your component you can require it in the main `index.styl`
```css
@require './node_modules/yourcomponent/style.css'
```