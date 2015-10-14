ENV['RACK_ENV'] ||= 'test'

require File.expand_path("../../config/environment", __FILE__)
require 'minitest/autorun'
require 'minitest/pride'
require 'capybara'
require 'tilt/erb'

class Minitest::Test
  def teardown
    TaskManager.delete_all
  end
end

Capybara.app = TaskManagerApp

class FeatureTest < Minitest::Test
  include Capybara::DSL

  def create_tasks(num)
    num.times do |i|
      TaskManager.create({:title        => "this is #{i+1} title",
                          :description  => "this is #{i+1} description"})
    end
  end
end
