require_relative "../test_helper"

class EditTaskTest < FeatureTest

  def test_user_can_edit_a_task
    create_tasks(1)
    visit "/tasks/1/edit"

    assert_equal "/tasks/1/edit" , current_path

    fill_in 'task[title]', with: 'New Title'
    fill_in 'task[description]', with: 'New Description'
    click_button "Submit"

    assert_equal "/tasks", current_path
    assert page.has_content?("New Title")
    assert page.has_css?("#id1")

    click_link "New Title"

    assert_equal "/tasks/1", current_path
    assert page.has_content?("New Title")
    assert page.has_content?("New Description")
  end
end
