module ApplicationHelper
  def page_title(page_title = '')
    base_title = 'とどけ、反抗期'

    page_title.empty? ? base_title : page_title + " | " + base_title
  end
end
