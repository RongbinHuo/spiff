class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  def google_oauth2
    @user = User.from_omniauth(request.env["omniauth.auth"])

    if @user.persisted?
      puts "aaaaaaaa login #{@user.inspect}"
      flash[:notice] = I18n.t "devise.omniauth_callbacks.success", :kind => "Google"
      # sign_in_and_redirect @user, :event => :authentication
      redirect_back_or_default root_url @user, :event => :authentication
    else
      session["devise.google_data"] = request.env["omniauth.auth"].except(:extra) #Removing extra as it can overflow some session stores
      redirect_to root_path, alert: @user.errors.full_messages.join("\n")
    end
  end
end
