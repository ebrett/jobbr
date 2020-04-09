require 'jobbr/logger'
module Jobbr
  class Engine < ::Rails::Engine
    isolate_namespace Jobbr
    initializer "jobbr.assets.precompile" do |app|
      app.config.assets.precompile += %w( application.js application.css )
    end
    initializer 'jobbr.action_controller' do |app|
      ActiveSupport.on_load :action_controller do
        helper Jobbr::ApplicationHelper
      end
    end

  end
end