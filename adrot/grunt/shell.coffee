module.exports =
  shotgun_start:
    command: 'cd app/backend && bundle install && bundle exec shotgun config.ru -p3099'
    options:
      async: true
