module ApplicationHelper

  def markdown(text)
    sanitize Kramdown::Document.new(text).to_html
  end

end

def my_name
  p "Benji Dalton"
end

