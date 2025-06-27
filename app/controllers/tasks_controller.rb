class TasksController < ApplicationController
  before_action :set_user  

  #create task
  def create
    @task= @user.tasks.build(create_task_params)
    if @task.save
      flash[:success]= "create tasks successfully"
      redirect_to user_path(@user)
    else
      flash.now[:error]= " Failed to create task "
    end
  end

  #edit task
  def edit
    @task= Task.find(params[:id])
  end

  #update

  def update
    @task= Task.find(params[:id])
    if @task.update(update_task_params)
      flash[:success]= "successfully updated"
      redirect_to user_path(@user)
    else
      flash.now[:error]="Failed to update"
    end
  end
  #Delete Task
  def destroy
    @task= Task.find(params[:id])
    if @task.destroy
      flash[:success]= "Task deleted !"
      redirect_to user_path(@user)
    else
      flash[:success]="Failed to delete task !"
    end
  end

  private
  def set_user
    @user= User.find(params[:user_id])
  end

  def create_task_params
    params[:status]= "pending"
    params.permit(:title,:description)
  end

  def update_task_params
    params.require(:task).permit(:title,:description,:status)
  end
end