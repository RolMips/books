module UsersHelper
  def user_link the_user
    html = "<a href='/users/#{the_user.id}'>".html_safe
    if the_user.role
      html += the_user.name + " ("+ the_user.role + ")"
    else
      html += the_user.name
    end
    html += "</a>".html_safe
    html
  end
end
