class ToolsController < ApplicationController
  before_action :set_tool, only: [:edit, :show, :update, :destroy] 
 
 #petergate - authetication for different user roles at controller level
 access all: [:show, :index], user: {except: [:destroy, :new, :create, :update, :edit, :sort]}, site_admin: :all

    def index
        @tools = Tool.all
    end

    def new
        @tool = Tool.new
    end

    def show
        
    end

    def create
        @tool = Tool.new(tool_params)
        respond_to do  |format|
            if @tool.save
                format.html {redirect_to(tools_path)}
            else
                format.html { render 'new' }
            end
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
        @tool = tool.find(params[:id])
    end

    def tool_params
        params.require(:tool).permit(:title, 
                                    :description, 
                                    # :body, 
                                    # :position,
                                    # :date_text,
                                    # skill_ids: []
                                    )
    end  

end