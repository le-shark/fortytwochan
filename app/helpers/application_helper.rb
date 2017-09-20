module ApplicationHelper
  def page_title(title = '')
    if !title.empty?
      "#{title} - 42chan"
    else
      "42chan"
    end
  end
end
