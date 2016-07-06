class RegistrationsController < Devise::RegistrationsController

  private

  def sign_in_params
  	params.require(:user).permit(:email, :password)
  end

  def sign_up_params
    params.require(:user).permit(:name, :team, :email, :password, :password_confirmation)
  end

  def account_update_params
    params.require(:user).permit(:name, :team, :email, :password, :password_confirmation, :current_password)
  end
end