require_relative "../test_helper"

class GreetingTest < FeatureTest
  def test_user_can_see_the_greeting
    visit "/"
    within ("#greeting") do
      assert page.has_content?("What do you have to do today?")
    end
  end
end
