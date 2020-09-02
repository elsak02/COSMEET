module ApplicationHelper
  def scroll_chatroom?
    controller_name == 'matches' && action_name == 'chatroom'
  end
end
