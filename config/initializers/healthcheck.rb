# frozen_string_literal: true

Healthcheck.configure do |config|
  config.success = 200
  config.error = 503
  config.verbose = false
  config.route = '/healthcheck'
  config.method = :get

  # -- Custom Response --
  # config.custom = lambda { |controller, checker|
  #   return controller.render(plain: 'Everything is awesome!') unless checker.errored?
  #   controller.verbose? ? controller.verbose_error(checker) : controller.head_error
  # }

  # -- Checks --
  config.add_check :database,     -> { ActiveRecord::Base.connection.execute('select * from users limit 1') }
  config.add_check :migrations,   -> { ActiveRecord::Migration.check_pending! }
  # config.add_check :cache,        -> { Rails.cache.read('some_key') }
  config.add_check :environments, -> { Dotenv.require_keys('HEALTH', 'CHECKER') }
  config.verbose = true
end
