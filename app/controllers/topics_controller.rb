class TopicsController < ApplicationController
  before_action :set_topic, except: [:new, :create, :index]

  def index
    @topics = Topic.all
  end

  def show
  end

  def new
    @topic = Topic.new
  end

  def create
    @topic = Topic.new(topic_params)
    
    if @topic.save
      redirect_to topic_path(@topic), notice:  'Topic was succesfully created.'
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @topic.update(topic_params)
      redirect_to topic_path(@topic), notice: 'Your Topic was successfully created'
    else
      render :edit, notice: 'There was an errir processing your request'
    end
  end

  private

  def set_topic
    @topic = Topic.friendly.find(params[:id])
  end

  def topic_params
    params.require(:topic).permit(:title)
  end
end
