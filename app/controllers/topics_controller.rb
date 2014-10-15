class TopicsController < ApplicationController
  def index
    @topics = Topic.all
    authorize @topics
  end

  def new
    @topics = Topic.new
    authorize @topics
  end

  def show
    @topics = Topic.find(params[:id])
    authorize @topics
  end

  def edit
    @topic = Topic.find(params[:id])
    authorize @topics
  end


  def create
    @topic = Topic.new(params.require(:topic).permit(:name, :description, :public))
    authorize @topic
    if @topic.save
      redirect_to @topic, notice: "Topic was saved successfully."
    else
      flash[:error] = "error creating topic. Try again."
      render :new
    end
  end

  def update
    @topic = Topic.find(params[:id])
    authorize @topics
    if @topic.update_attributes(params.require(:topic).permit(:name, :description, :public))
      redirect_to @topic
    else
      flash[:error] = "Error saving topic. Try again."
      render :edit
    end
  end
end
