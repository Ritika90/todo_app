class TodosController < ApplicationController

    def index
        @todo_items= Todo.where(:user_id => current_user.id)
        @new_todo= Todo.new
    end

    def delete
        Todo.last.delete
        flash[:success] = "Todo deleted successfully"
        redirect_to todos_index_path
    end

    def add
        todo= Todo.create(todo_params)
        if !todo.valid?
            flash[:error] = todo.errors.full_messages.join("<br>").html_safe
        else
            flash[:success] = "Todo added successfully"
        end
        redirect_to todos_index_path
    end

    def complete
      debugger
        params[:todos_checkbox].each do |todo_id|
        t = Todo.find_by_id(todo_id)
        if t.completed == true
            t.update_attribute(:completed, false)
        else
            t.update_attribute(:completed, true)
        end
      end
      redirect_to todos_index_path
    end

    def complete_all
        Todo.all.map{ |obj|  obj.id }.each do |todo_id|
           t = Todo.find_by_id(todo_id)
           t.update_attribute(:completed, true)
         end
      redirect_to todos_index_path
    end

    def reset_all
        Todo.all.map{ |obj|  obj.id }.each do |todo_id|
           t = Todo.find_by_id(todo_id)
            t.update_attribute(:completed, false)
            end
        redirect_to todos_index_path
    end

    def todo_params
        params.require(:todo).permit(:completed, :todo_item, :user_id)
    end
end
