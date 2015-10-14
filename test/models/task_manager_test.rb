require_relative "../test_helper.rb"

class TaskManagerTest < Minitest::Test
  def setup
    TaskManager.create({:title        => "this is a title",
                        :description  => "this is a description"})
    TaskManager.create({:title        => "this is a 2nd title",
                        :description  => "this is a 2nd description"})
    TaskManager.create({:title        => "this is a 3rd title",
                        :description  => "this is a 3rd description"})
  end

  def test_task_is_created
    task = TaskManager.find(1)

    assert_equal 1, task.id
    assert_equal "this is a title", task.title
    assert_equal "this is a description", task.description
  end

  def test_update
    data = { :title => "new title", :description => "new description"}
    TaskManager.update(1, data)
    task = TaskManager.find(1)

    assert_equal 1, task.id
    assert_equal "new title", task.title
    assert_equal "new description", task.description
  end

  def test_delete
    TaskManager.delete(2)
    all_tasks = TaskManager.all
    ids = all_tasks.map { |task| task.id }
    titles = all_tasks.map { |task| task.title }
    descriptions = all_tasks.map { |task| task.description }

    assert_equal [1,3], ids
    assert_equal ["this is a title", "this is a 3rd title"], titles
    assert_equal ["this is a description", "this is a 3rd description"], descriptions
end

  def test_all
    all_tasks = TaskManager.all
    ids = all_tasks.map { |task| task.id }
    titles = all_tasks.map { |task| task.title }
    descriptions = all_tasks.map { |task| task.description }

    assert_equal [1,2,3], ids
    assert_equal ["this is a title", "this is a 2nd title", "this is a 3rd title"], titles
    assert_equal ["this is a description", "this is a 2nd description", "this is a 3rd description"], descriptions
  end

  def test_find
    task = TaskManager.find(2)

    assert_equal 2, task.id
    assert_equal "this is a 2nd title", task.title
    assert_equal "this is a 2nd description", task.description
  end

end
