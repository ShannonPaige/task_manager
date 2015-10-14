require_relative "../test_helper.rb"

class TaskManagerTest < Minitest::Test
  def create_tasks(num)
    num.times do |i|
      TaskManager.create({:title        => "this is #{i+1} title",
                          :description  => "this is #{i+1} description"})
    end
  end

  def test_task_is_created
    create_tasks(1)
    task = TaskManager.find(1)

    assert_equal 1, task.id
    assert_equal "this is 1 title", task.title
    assert_equal "this is 1 description", task.description
  end

  def test_task_is_updated
    create_tasks(1)
    data = { :title => "new title", :description => "new description"}
    TaskManager.update(1, data)
    task = TaskManager.find(1)

    assert_equal 1, task.id
    assert_equal "new title", task.title
    assert_equal "new description", task.description
  end

  def test_task_is_deleted
    create_tasks(3)
    TaskManager.delete(2)
    all_tasks = TaskManager.all
    ids = all_tasks.map { |task| task.id }
    titles = all_tasks.map { |task| task.title }
    descriptions = all_tasks.map { |task| task.description }

    assert_equal [1,3], ids
    assert_equal ["this is 1 title", "this is 3 title"], titles
    assert_equal ["this is 1 description", "this is 3 description"], descriptions
end

  def test_all_tasks_are_returned
    create_tasks(3)
    all_tasks = TaskManager.all
    ids = all_tasks.map { |task| task.id }
    titles = all_tasks.map { |task| task.title }
    descriptions = all_tasks.map { |task| task.description }

    assert_equal [1,2,3], ids
    assert_equal ["this is 1 title", "this is 2 title", "this is 3 title"], titles
    assert_equal ["this is 1 description", "this is 2 description", "this is 3 description"], descriptions
  end

  def test_find_a_task_by_id_number
    create_tasks(3)
    task = TaskManager.find(2)

    assert_equal 2, task.id
    assert_equal "this is 2 title", task.title
    assert_equal "this is 2 description", task.description
  end

end
