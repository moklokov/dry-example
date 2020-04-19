# frozen_string_literal: true

DryExample::Application.boot(:persistence) do |app|
  start do
    config = app['db.config']
    config.auto_registration(app.root + 'lib/dry_example')
    register('container', ROM.container(config))
  end
end
