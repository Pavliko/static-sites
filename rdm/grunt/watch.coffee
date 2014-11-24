module.exports =
  haml:
    files: ['<%= yeoman.app %>/**/*.haml', '!<%= yeoman.app %>/views/*.haml']
    tasks: ['haml', 'replace', 'staticGenerate']
  views:
    files: ['<%= yeoman.app %>/views/*.haml']
    tasks: ['haml', 'ngtemplates']
    options:
      livereload: true
