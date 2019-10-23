# frozen_string_literal: true

require "bunny"
require "capybara"
require "capybara/cucumber"
require "capybara/rspec"
require "chunky_png"
require "faker"
require "cpf_faker"
require "httparty"
require "pry"
require "rspec"
require "rspec/expectations"
require "selenium-proxy"
require "selenium-webdriver"
require "site_prism"
require "watir"
require "webdrivers"

RSpec.configure do |config|
  config.include Capybara::DSL
  config.include Capybara::RSpecMatchers
end


BROWSER = ENV["BROWSER"]
ENVIRONMENT_TYPE = ENV["ENVIRONMENT_TYPE"]

Capybara.register_driver :selenium do |app|
  # puts "Proxy: #{CONFIG["proxy"]["ip"]}:#{CONFIG["proxy"]["porta"]}"

  Capybara.ignore_hidden_elements = true

  client = Selenium::WebDriver::Remote::Http::Default.new
  client.read_timeout = 120
  client.open_timeout = 45

  if BROWSER.eql?("chrome")
    MOBILE = false
    capabilities = Selenium::WebDriver::Remote::Capabilities.chrome(
      chromeOptions: {
        args: ["--start-maximized", "--no-sandbox"],
      },
      # proxy: proxy_chrome,
    )
    Capybara::Selenium::Driver.new(app, browser: :chrome,
                                        desired_capabilities: capabilities,
                                        http_client: client)
  elsif BROWSER.eql?("chrome_headless")
    MOBILE = false
    capabilities = Selenium::WebDriver::Remote::Capabilities.chrome(
      chromeOptions: {
        args: ["--no-sandbox", "--headless", "--disable-dev-shm-usage", "--disable-gpu",
               "--disable-extensions", "--window-size=1080,1524", "--v=1"],
      },
      loggingPrefs: {
        browser: "ALL",
      },
      # proxy: proxy_chrome,
    )
    Capybara::Selenium::Driver.new(app, browser: :chrome,
                                        desired_capabilities: capabilities,
                                        http_client: client)
  elsif BROWSER.eql?("chrome_mobile")
    MOBILE = true
    DEVICE = ENV["DEVICE"].dup.tr!("_", " ") if ENV["DEVICE"]
    mobile_emulation = { "deviceName" => DEVICE }
    puts "Device: " + DEVICE
    Capybara::Selenium::Driver.new(app, mobile_options(mobile_emulation))
  elsif BROWSER.eql?("edge")
    MOBILE = false
    capabilities = Selenium::WebDriver::Remote::Capabilities.edge(
      browser_name: "MicrosoftEdge",
      platform: "WINDOWS",
      javascript_enabled: true,
      ignoreProtectedModeSettings: true,
      css_selectors_enabled: true,
    )
    Capybara::Selenium::Driver.new(app, browser: :edge,
                                        desired_capabilities: capabilities)
    # Selenium::WebDriver.for(:edge)
  elsif BROWSER.eql?("firefox")
    MOBILE = false
    options = Selenium::WebDriver::Firefox::Options.new(
      profile: profile_firefox,
    )
    Capybara::Selenium::Driver.new(app, browser: :firefox,
                                        http_client: client,
                                        marionette: true,
                                        options: options)
  elsif BROWSER.eql?("firefox_headless")
    MOBILE = false
    options = Selenium::WebDriver::Firefox::Options.new(
      profile: profile_firefox,
      args: ["-headless"],
    )
    Capybara::Selenium::Driver.new(app, browser: :firefox,
                                        http_client: client,
                                        marionette: true,
                                        options: options)
  end
end
