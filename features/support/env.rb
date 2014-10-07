require 'capybara/cucumber'
require 'site_prism'
require 'selenium-webdriver'
require 'capybara'
require 'cucumber'
require 'fileutils'

#initialize a new Driver
Capybara.register_driver :iphone do |app|
  caps = {
      :deviceName => 'iPhone Simulator',
      :browserName => 'Safari',
      :platformName => 'iOS',
      :versionNumber => '7.1'
  }

  Capybara::Selenium::Driver.new(app, {:browser => :remote, :url => 'http://localhost:4723/wd/hub/', :desired_capabilities => caps})
end

Capybara.default_driver = :iphone
Capybara.app_host = 'https://www.sabergrills.com'


#Take ScreenShots on Failure
dir_path = Dir.pwd
time = Time.now.strftime('%Y_%m_%d_%Y_%H_%M_%S_')
new_dir_path = dir_path + '/screenshots/' + time

unless Dir.exist?(new_dir_path)
  FileUtils::mkdir_p(new_dir_path)
  puts "=========Directory is created at #{new_dir_path}"
else
  puts "=========Directory exists at #{new_dir_path}"
end

#Run after each scenario
After do |scenario|
  #Check, scenario is failed?
  if(scenario.failed?)
    name_of_scenario = time + scenario.name.gsub(/\s+/, "_").gsub("/","_")
    puts "Name of snapshot is #{name_of_scenario}"
    file_path = File.expand_path(new_dir_path)+'/'+name_of_scenario +'.png'
    sleep 1
    page.driver.browser.save_screenshot file_path
    embed("#{file_path}", "image/png", "SCREENSHOT")
  end
end