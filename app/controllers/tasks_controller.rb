class TasksController < ApplicationController
  before_action :set_task, only: [:show, :edit, :update, :destroy]
  before_action :set_project, only: [:show, :edit,:new,:create, :update, :destroy]

  def show
    @task=@project.tasks.find(params[:id])
  end

  def new
    @task = @project.tasks.build
    respond_to do |format|
      format.html 
    end
  end

  def edit
    @task = @project.tasks.find(params[:id])
  end

  def create
    @task= @project.tasks.create(task_params)
    #@task.project_id=@project_id

    respond_to do |format|
      if @task.save
        format.html {redirect_to project_url(@task.project_id), notice: "Task was creted succesfully!"}
        format.json {render :show, status: :created, location: @task}
      else
        format.html {render :new}
        format.json {render json: @task.errors, status: :unprocessable_entity}
      end
    end
  end

  def update
    @task = @project.tasks.find(params[:id])
    respond_to do |format|
      if @task.update(task_params)
        format.html {redirect_to project_url(@task.project_id), notice: "Task was updated succesfully!"}
        format.json {render :show, status: :created, location: @task}
      else
        format.html {render :edit}
        format.json {render json: @task.errors, status: :unprocessable_entity}
      end 
    end
  end

  def destroy
    task=project.tasks.find(:project_id)
    @task.destroy
    respond_to dask.new(task_params) do |format|
      format.html {redirect_to Project_url(@task.project_id), notice: "Task was deleted succesfully!"}
      format.json {head :no_content}
    end
  end


  private

  def set_task
    task=Task.find(params[:id])
  end

  def set_project
    @project=Project.find(params[:project_id])
  end

  def task_params
    params.require(:task).permit(:title,:desciption,:project_id,:complted,:task_file)
  end
end
