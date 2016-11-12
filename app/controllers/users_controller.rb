class UsersController < ApplicationController
  def show
    puts params
    @id = params[:id]
    @user = User.find(@id)
    @message = "this is here"
    @kids = Kid.all
    @kid = Kid.new(kid_params)

end

private

def kid_params
  params.permit(:name, :age, :gender, :hobbies, :user_id)
end
end
