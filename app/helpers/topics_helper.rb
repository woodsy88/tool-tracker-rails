module TopicsHelper

  def form_route(source)
    return create_tool_path if source == 'new'
    return topic_tool_path(topic_id: @topic.id, id: @tool.id) if source == 'edit'
  end

  def form_action(source)
    return 'post' if source == 'new'
    return 'put' if source == 'edit'
  end
end
