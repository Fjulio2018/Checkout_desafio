# frozen_string_literal: true

require_relative "helper.rb"


# ## PageObjets Definitions
# World(UI::Pages)

## Helpers Definitions
World(Helper)
## faker
Faker::Config.locale = "pt-BR"

## Cucumber Definitions
Before do |feature|
  ## tags da feature
  $feature_tag_names = feature.source_tag_names

  unless $feature_tag_names.any? { |tag| ["@file", "@api", "@bd"].include? tag }

    ## configure the chosen browser
    Capybara.configure do |config|
      config.default_driver = :selenium
      config.javascript_driver = :selenium
      #config.app_host = CONFIG["url"]
      config.default_max_wait_time = 30 ## seconds
      # config.run_server = false
    end

  
    ## maximize browser
    Capybara.current_session.driver.browser.manage.window.maximize
  end

end

Before do |scenario|
  $scenario_name = scenario.name.gsub(/\s+/, "_").tr("/", "_")
end

After do |scenario|
  ## take screenshot
  unless $feature_tag_names.any? { |tag| ["@file", "@api", "@bd"].include? tag }
    if scenario.failed?
      take_screenshot($scenario_name.downcase!, "failed")
    elsif scenario.passed?
      take_screenshot($scenario_name.downcase!, "passed")
    else
      take_screenshot($scenario_name.downcase!, "login")
    end
    ## kills instance
    Capybara.current_session.driver.quit
    puts "driver finalizado com sucesso"

    Capybara.reset_sessions!
  end
end
