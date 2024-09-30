require_relative "boot"

require "rails/all"

Bundler.require(*Rails.groups)

module DevTechLogApp
  class Application < Rails::Application
    config.load_defaults 7.2
    config.autoload_lib(ignore: %w[assets tasks])
     config.generators do |g|
      g.assets false
      g.helper     false
      g.test_framework :rspec,
        fixtures: false, # テストDBにレコードを作るfixtureの作成をスキッ(FactoryBotを使用するため)
        view_specs: false, # ビューファイル用のスペックを作成しない
        helper_specs: false, # ヘルパーファイル用のスペックを作成しない
        routing_specs: false # routes.rb用のスペックファイル作成しない
    end
  end
end
