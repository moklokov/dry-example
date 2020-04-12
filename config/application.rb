# frozen_string_literal: true

require_relative 'boot'

require 'dry/system/container'

module DryExample
  class Application < Dry::System::Container # rubocop:disable Style/Documentation
    configure do |config|
      config.root = File.expand_path('..', __dir__)
      config.default_namespace = 'dry_example'

      # config.auto_register = 'lib'
    end

    # load_paths!('lib')
  end
end
