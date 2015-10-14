require_relative "../test_helper"

class CreateTaskTest < FeatureTest

  def test_user_can_create_a_task
    visit "/tasks/new"

    assert_equal "/tasks/new" , current_path

    fill_in 'task[title]', with: 'Feature Test'
    fill_in 'task[description]', with: 'Using Capybara'
    click_button "Submit"

    assert_equal "/tasks", current_path
    assert page.has_content?("Feature Test")
    assert page.has_css?("#id1")
  end

end
