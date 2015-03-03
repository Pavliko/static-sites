module.exports = (grunt) ->
  ngViews:
    files: grunt.file.expandMapping([
      'app/views/**/*.haml'
    ],
    '',
      rename: (base, path) -> path.replace(/\.haml$/, '')
    )
