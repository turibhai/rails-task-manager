class TasksController < ApplicationController

    def index
        @tasks = Task.all
    end

    def show
        @task = Task.find(params["id"])
        
    end

    def new
        @task = Task.new
    end

    def create
        @task = Task.new(task_params)
        if @task.save
            redirect_to task_path(@task) #prefix_path
        else
            render 'new', status: :unprocessable_entity # throws a 422 (for Turbo)
        end
    end

    def edit
        @task = Task.find(params["id"])
    end

    def update
        @task = Task.find(params["id"])
        if @task.update(task_params)
            redirect_to task_path(@task)
        else
            render 'new', status: :unprocessable_entity
        end
        
    end

    def destroy
         @task = Task.find(params["id"])
         raise
         @task.destroy
         redirect_to tasks_path, status: :see_other
        
    end

    def task_params
        params.require(:task).permit(:title,:details)
    end
end
