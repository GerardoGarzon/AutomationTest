require "selenium-webdriver"
require 'colorize'

class SeleniumPage
  def initialize(browser)
    browser = browser.to_sym
    dir_home = Etc.getpwuid.dir
    path_driver = dir_home.to_s + "/Documents/AutomationTest/driver/chromedriver"
    Selenium::WebDriver::Chrome::Service.driver_path = path_driver

    capabilities = Selenium::WebDriver::Remote::Capabilities.chrome(accept_insecure_certs: true)

    @@driver = Selenium::WebDriver.for browser, desired_capabilities: capabilities
    @@driver.manage.delete_all_cookies
  end

  class << self
    def open_url(url)
      raise "URL can not be null" if url.nil?
      raise "Provide a valid URL" unless url.is_a? String

      @@driver.navigate.to url
    end

    def element_visible(element)
      raise "Element can not be null" if element.nil?

      wait = Selenium::WebDriver::Wait.new(:timeout => 10)
      found = wait.until { @@driver.find_element(element[:sel], element[:loc]) }
      found.nil? ? puts("Element #{element[:loc]} not found".upcase.red) : puts("Element #{element[:loc]} found".upcase.green)
      found.nil? ? false : true
    end

    def send_keys(value, element)
      raise "Element can not be null" if element.nil?
      if element_visible(element)
        puts("Sending value #{value} to element".upcase)
        element_keys = @@driver.find_element(element[:sel], element[:loc])
        element_keys.send_keys(value)
      end
    end

    def click_element(element)
      raise "Element can not be null" if element.nil?
      if element_visible(element)
        element_click = @@driver.find_element(element[:sel], element[:loc])
        element_click.click
      end
    end

    def get_text(element)
      raise "Element can not be null" if element.nil?
      if element_visible(element)
        element_click = @@driver.find_element(element[:sel], element[:loc])
        element_click.text
      end
    end

    def compare_text(expected_text, element)
      raise "Element can not be null" if element.nil?
      if element_visible(element)
        element_text = get_text(element)
        puts "#{expected_text} | #{element_text}"
        if element_text == expected_text
          puts "Text correct".upcase.green
        else
          puts "Text incorrect".upcase.red
        end
      end
    end

    def verify_hash_elements(hash)
      hash.each do |element, value|
        element_visible(value)
      end
    end

    def get_element(element)
      raise "Element can not be null" if element.nil?
      if element_visible(element)
        @@driver.find_element(element[:sel], element[:loc])
      end
    end
  end
end
