class AuthenticationsController < ApplicationController

  load_resource :user, except: [:create]
  load_resource through: :user, except: [:create]
  authorize_resource through: :current_user, except: [:create]

  before_filter :authenticate_user!, except: [:create]

  skip_authorization_check only: [:create]

  def index
    @authentications = @user.authentications
  end

  def create
    omniauth = request.env['omniauth.auth']
    authentication = Authentication.find_by_provider_and_uid omniauth[:provider], omniauth[:uid] 
    if authentication
      flash[:notice] = "Signed in successfully"
      sign_in_and_redirect :user, authentication.user
    elsif current_user
      current_user.authentications.create! provider: omniauth[:provider], uid: omniauth[:uid]
      redirect_to authentications_path, notice: "Authentication is successfull"
    else
      user = User.new
      user.apply_omniauth omniauth
      if user.save
        flash[:notice] = "Signed in successfully"
        sign_in_and_redirect :user, user
      else
        session[:omniauth] = omniauth.except 'extra'
        redirect_to new_user_registration_path
      end
    end
  end

  def destroy
    @authentication.destroy
    redirect_to authentications_path 
  end

end
