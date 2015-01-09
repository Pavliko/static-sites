module.exports =
  dist:
    files: [
        expand: true
        dot: true
        cwd: '<%= yeoman.app %>'
        dest: '<%= yeoman.dist %>'
        src: [
          '*.{ico,png,txt}'
          '.htaccess'
          '*.html'
          'views/{,*/}*.html'
          'images/{,*/}*.{webp}'
          'fonts/{,*/}*'
        ]
    ,
        expand: true
        cwd: '.tmp/images'
        dest: '<%= yeoman.dist %>/images'
        src: ['generated/*']
    ,
        expand: true
        cwd: 'app/bower_components/bootstrap-sass-official/assets'
        src: 'fonts/{,*/}*'
        dest: '<%= yeoman.dist %>'
    ]
  styles:
    expand: true
    cwd: '<%= yeoman.app %>/styles'
    dest: '.tmp/styles/'
    src: '{,*/}*.css'
