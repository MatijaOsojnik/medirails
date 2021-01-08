module ApplicationHelper
  def display_session_links
    capture do
      if user_signed_in?
        concat link_to "Uredi profil", edit_user_registration_path, class: 'btn btn-sm btn-outline-secondary'
        concat " "
        concat link_to "Odjava", destroy_user_session_path, method: :get, class: 'btn btn-sm btn-outline-secondary mx-2'
      else
        concat link_to "Prijava", new_user_session_path, class: 'btn btn-sm btn-outline-secondary'
        concat " "
        concat link_to "Registracija", new_user_registration_path, class: 'btn btn-sm btn-outline-secondary mx-2'
        concat " "
      end
    end
  end
end