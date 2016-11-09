class UsersController < ApplicationController
  def show
    puts params
    @id = params[:id]
    @user = User.find(@id)
    @message = "hello user "
  end
end
