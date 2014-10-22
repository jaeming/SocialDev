module ApplicationHelper
end

  def markdown(text)
    sanitize Kramdown::Document.new(text).to_html
  end

def my_name
  p "Benji Dalton"
end

