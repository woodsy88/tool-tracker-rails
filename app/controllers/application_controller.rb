class ApplicationController < ActionController::Base

  def current_user
    super || OpenStruct.new(full_name: 'Guest')
  end
end
