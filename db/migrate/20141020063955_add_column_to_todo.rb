class AddColumnToTodo < ActiveRecord::Migration
  def change
    add_column :todos, :user_id, :integer
  end
end
