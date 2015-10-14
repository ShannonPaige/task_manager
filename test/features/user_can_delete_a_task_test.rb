require_relative "../test_helper"

class DeleteTaskTest < FeatureTest

  def test_user_can_delete_a_task
    create_tasks(3)
    visit "/tasks"

    assert_equal "/tasks" , current_path
    assert page.has_content?("this is 2 title")
    assert page.has_css?("#id2")

    within ("#form-id2") do
      click_button "Delete"
    end

    assert_equal "/tasks", current_path
    refute page.has_content?("this is 2 title")
    refute page.has_css?("#id2")
  end
end
