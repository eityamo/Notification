module ApplicationHelper
  def full_title(page_title = '')
    base_title = 'とどけ、反抗期'

    page_title.empty? ? base_title : page_title + " | " + base_title
  end
  
  def full_url(path)
    domain = if Rails.env.development?
                     'http://0.0.0.0:3000/'
                   else
                     'https://hankouki.herokuapp.com/'
                   end
    "#{domain}#{path}"
  end
end
