class Topics::ToolsController < ApplicationController
  before_action :set_topic, except: [:new, :create]
  before_action :set_tool, only: [:show, :edit, :update, :destroy] 
  before_action :authenticate_user!, except: [:index, :show]
 
    def index
      @tools = @topic.tools
    end

    def new
    end

    def create
      tool = Tool.new(tool_params)
      tool.user_id = current_user.id

      if tool.save
          redirect_to topic_tool_path(topic_id: tool.topic_id, id: tool), notice: 'Your tool was successfully published.'
      else
          render :new
      end      
    end

    def show   
    end    

    def edit 
      if @tool.user_id != current_user.id
        redirect_to topic_tool_path(topic_id: @tool.topic_id, id: @tool), notice: 'you are not authorized'
      end
    end

    def destroy
      @tool.destroy
      respond_to do |format|
          format.html { redirect_to tools_url, notice: 'tool was successfully destroyed.' }
      end        
    end

    def update
      @tool = @topic.tools.find(params[:id])

      if @tool.update(tool_params)
          redirect_to topic_tool_path(topic_id: @tool.topic_id, id: @tool), notice: 'Your tool was successfully updated.'
      else
          render :edit, notice: 'There was an error processing your request!'
      end        
    end

private

    def set_topic
      @topic = Topic.friendly.find(params[:topic_id])
    end

    def set_tool
      @tool = @topic.tools.find(params[:id])
    end    

    def tool_params
      params.require(:tool).permit(:title, 
                                  :description, 
                                  :topic_id,
                                  )
    end  

end