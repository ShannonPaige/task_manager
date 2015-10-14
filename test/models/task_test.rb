require_relative "../test_helper.rb"

class TaskTest < Minitest::Test
  def test_attributes_are_assigned_correctly
    task = Task.new({ "id"          => "1",
                      "title"       => "task title",
                      "description" => "do it"})

    assert_equal "1", task.id
    assert_equal "task title", task.title
    assert_equal "do it", task.description                 
  end
end
