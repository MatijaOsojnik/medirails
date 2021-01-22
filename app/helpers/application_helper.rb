module ApplicationHelper
  def display_session_links
    capture do
      # if user_signed_in?
      #   concat link_to "Uredi profil", edit_user_registration_path, class: 'btn btn-sm btn-outline-secondary'
      #   concat " "
      #   concat link_to "Odjava", destroy_user_session_path, method: :delete, class: 'btn btn-sm btn-outline-secondary mx-2'
      # else
        concat link_to "Sign in", new_user_session_path, class: 'btn btn-light mr-4'
        concat " "
        concat link_to "Get started", new_user_registration_path, class: 'btn btn-dark'
        concat " "
      # end
    end
  end
    def get_time_of_day(hour)
    if (hour >= 0 and hour <= 12)
      return "Good morning"
    elsif (hour >= 12 and hour <= 18)
      return "Good afternoon"
    elsif (hour >= 18 and hour <= 24)
      return "Good evening"
    end
  end

  def show_read_time(content)
    result = (content.scan(/[\w-]+/).size.to_f / 256)
    if (result < 1)
      return 1
    else 
      return result.round
    end
  end
end