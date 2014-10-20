class CreateTodos < ActiveRecord::Migration
  def change
    create_table :todos do |t|
      t.string :todo_item
      t.integer :user_id
      t.timestamps
    end
  end
end
