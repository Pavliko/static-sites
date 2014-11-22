module.exports =
  haml:
    tasks: ['haml', 'replace', 'staticGenerate']
  views:
    files: ['views/*.haml']
    tasks: ['haml', 'ngtemplates']
    options:
      livereload: true
