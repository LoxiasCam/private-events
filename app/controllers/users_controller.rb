class UsersController < ApplicationController
  @user = User.find(params[:id])
end
