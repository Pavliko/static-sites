module.exports =
  dist:
    options:
      patterns: [
          json:
            URL: '<abbr title="Единый указатель ресурсов (англ. Uniform Resource Locator, URL) — единообразный локатор (определитель местонахождения) ресурса. Ранее назывался Universal Resource Locator — универсальный указатель ресурса. URL служит стандартизированным способом записи адреса ресурса в сети Интернет." class="initialism">URL</abbr>'
            WEB: '<abbr title="Веб или вэб (англ. web — паутина) — интернет-пространство" class="initialism">WEB</abbr>'


      ]
    files: [
        expand: true
        flatten: true
        src: ['app/contents/*.html']
        dest: 'app/contents/'
    ]
