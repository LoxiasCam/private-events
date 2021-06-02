class UsersController < ApplicationController
  
  private

  def sign_up_params
    params.require(:user).permit(:email, :password, :password_confirmation)
  end

  def acount_update_params
    params.require(:user).permit(:email, :password, :password_confirmation, :current_password)
  end
end
