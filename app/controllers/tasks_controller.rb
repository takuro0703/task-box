class TasksController < ApplicationController
  before_action :set_group

  def index
    @task = Task.new
    @tasks = @group.tasks.includes(:user)
  end

  def new
    @task = Task.new
  end

  def create
    # Task.create(task_params)
    @task = @group.tasks.new(task_params)
    if @task.save
      redirect_to group_tasks_path(@group) 
    else
      puts "ダメです"
    end
  end

  def edit
    @task = Task.find(params[:id])
  end

  def update
    # @task = Task.find(params[:id])
    # task.update(task_params)
    @task = Task.find(params[:id])
    @tasks = @group.tasks.includes(:user)
    if @task.update(task_params)
      redirect_to group_tasks_path(@group)
    else
      puts "ダメです"
    end
    # def show
  #   user =User.find(params[:id])
  #   @name = user.name
  #   @messages = user.messages
  # end
  # def edit
  #   @message = Message.find(params[:id])
  # end

  # def update
  #   # @message = Message.find(params[:id])
  #   # message.update(message_params)
      # message = Message.new
      # messages = @group.message.includes(:user)
      # messages.update(message_params)
  #   @message = @group.messages.find(params[:id])
  #   if @message.update
  #     redirect_to group_messages_path(@group) 
  #   else
  #     puts "ダメです"
  #   end
  # end
    # @task = @group.tasks.find(params[:id])
    # if @task.update
    #   redirect_to group_tasks_path(@group) 
    # else
    #   puts "ダメです"
    # end
  end

  private
  def task_params
    params.require(:task).permit(:todo).merge(user_id: current_user.id)
  end

  def set_group
    @group = Group.find(params[:group_id])
  end
end
