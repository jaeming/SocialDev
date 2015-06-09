module ApplicationHelper
  def markdown(text)
    sanitize Kramdown::Document.new(text).to_html
  end
end