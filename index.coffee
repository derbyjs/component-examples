app = module.exports = require('derby').createApp 'component-examples', __filename
app.serverUse module, 'derby-stylus'
app.loadViews __dirname
app.loadStyles __dirname

app.use require 'l-progress/example'
app.use require 'l-upload/example'
# add more components here...
app.use require 'd-lorem/example'
app.use(require('d-datepicker/example'));
app.use(require('d-share/example'));
app.use(require('d-material'));

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
  