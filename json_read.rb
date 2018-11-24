require 'test/unit'
require 'selenium-webdriver'
require 'json'

class MyTest < Test::Unit::TestCase


  def setup
    @file = File.read( "sel.json")
    @data_hash = JSON.parse(@file)
    @driver=Selenium::WebDriver.for :chrome

    @driver.manage.window.maximize

    @driver.navigate.to @data_hash['URL']
  end

  def test_search



    #Typing the Selenium in Google search
    @driver.find_element(:name, "q").send_keys @data_hash['SearchWord']

    #Clicking the search button
    @driver.find_element(:name, "q").send_key :return


    #Clicking the search button
    @driver.find_element(:xpath, "//*[@id='rso']/div[1]/div/div[1]/div/div/div[1]/a/h3").click


    #Asserting whether the registration success message is diaplyed
    puts @driver.title


  end

  def teardown
    @driver.quit
  end



end