app = module.exports = require('derby').createApp 'component-examples', __filename
app.serverUse module, 'derby-stylus'
app.loadViews __dirname
app.loadStyles __dirname

app.use require 'l-progress/example'
app.use require 'l-upload/example'
app.use require 'd-lorem/example'
# add more components here...
 
app.get '/', ->
  componentNames = []
  for viewName of app.views.nameMap
    match = /^([ld]-.+)-example$/.exec viewName
    componentNames.push match[1] if match
  componentNames.sort (a,b) ->
    return a.localeCompare(b)
  @model.set '_page.componentNames', componentNames
  @render 'home'
 
app.get '/:component', ->
  @render @params.component + '-example'
 
app.on 'ready', (page) ->
  # For debugging purposes only
  window.MODEL = page.model
  window.APP = app


# =========================

# for the l-upload example
app.post '/upload', ({req, res}) ->
  # you would need to use connect middleware to parse files 
  # for this to actually work
  res.send({response: "uploaded!"})