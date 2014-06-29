class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  def google_oauth2
    # Get auth info
    auth_info = request.env["omniauth.auth"].info

    # Make sure email is in hungrymachine domain
    # unless auth_info['email'].to_s =~ Techops::LOGIN_EMAIL_REGEXP
    #   return redirect_to(new_user_session_path, :flash => {
    #     :error => "Invalid Google domain for email #{auth_info['email'].to_s}. Please use your hungrymachine.com or letsbonus.net account."
    #   })
    # end

    # Find the user
    if user = User.where(:email => auth_info['email']).first
      # If the user exists, log him in
      flash[:notice] = I18n.t("devise.omniauth_callbacks.success", :kind => "Google")
      sign_in_and_redirect(user, :event => :authentication)
    else
      # Send the user to signup page
      session["devise.google_data"] = auth_info
      redirect_to new_user_registration_url
    end
  end
end
