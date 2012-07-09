module ApplicationHelper

  def markdown string 
    RDiscount.new(string).to_html.html_safe
  end

  def title page_title
    content_for(:title){page_title}
  end

  def log_path
    user_signed_in? ? link_to("Sign out", destroy_user_session_path, method: :delete) : link_to("Sign in", new_user_session_path)
  end

  def icon_style font_size = 16
  	{style: "font-size: #{font_size}px;"}
  end

end
