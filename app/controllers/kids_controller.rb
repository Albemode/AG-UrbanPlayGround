class KidsController < ApplicationController

#----------------------------------------
#GET /posts
#GET /posts.json

def index
  @kids = Kid.all

end
#-----------------------------------
# GET /posts/1
# GET /posts/1.json
def show
  @kid = Kids.find(params[:id])

end
#-------------------------------
# GET /posts/new
def new
@kid = Kid.new
@kids = Kid.all

  #@post = current_user.posts.build
end
#--------------------------
# GET /posts/1/edit
def edit
  @kid = Kid.find(params[:id])
  @user = User.find_by(session[:user_id])

  end
#----------------------------
def update
  @kid = Kid.find(params[:id])




end
#---------------------------
# POST /posts
# POST /posts.json
def create
  @user = User.find_by(session[:user_id])
  @kid = Kid.new(post_kids)

  if @kid.save!
    redirect_to user_path(@user)
  else
    p "FAILED"
    render 'new'
  end
end
#----------------------
private

def post_kids
  params.require(:kid).permit(:name, :age, :gender, :hobbies, :user_id)
end
#--------------------------
def destroy
@kid	= Kid.find(params[:id])
@kid.destroy

  redirect_to '/users/show'
end
#---------------------
# def set_post

# end

end
