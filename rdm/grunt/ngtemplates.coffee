module.exports =
  rdmApp:
    cwd: '<%= yeoman.app %>'
    src: 'views/**.html',
    dest: '.tmp/scripts/templates.js'
    options:
      htmlmin:
        collapseWhitespace: true
        collapseBooleanAttributes: true
