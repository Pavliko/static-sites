module.exports =
  coffee:
    files: ['<%= yeoman.app %>/scripts/{,*/}*.cjsx']
    tasks: ['newer:cjsx:dist']
    options:
      livereload: true
