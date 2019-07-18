class Topics::ToolsController < ApplicationController
  before_action :set_tool, only: [:edit, :show, :update, :destroy] 
  before_action :set_topic, except: [:new, :create]
 
    def index
      @tools = @topic.tools
    end

    def new
    end

    def show   
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

    def edit    
    end

    def destroy
        @tool.destroy
        respond_to do |format|
            format.html { redirect_to tools_url, notice: 'tool was successfully destroyed.' }
        end        
    end

    def update
        respond_to do |format|
            if @tool.update(tool_params)
                format.html { redirect_to (tools_path) }
              else
                format.html { render :edit }
            end  
        end           
    end

private

    def set_tool
        @tool = Tool.find(params[:id])
    end

    def set_topic
        @topic = Topic.friendly.find(params[:topic_id])
    end

    def tool_params
        params.require(:tool).permit(:title, 
                                    :description, 
                                    :topic_id,
                                    # :body, 
                                    # :position,
                                    # :date_text,
                                    # skill_ids: []
                                    )
    end  

end