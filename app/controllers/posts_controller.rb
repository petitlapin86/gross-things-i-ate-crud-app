class PostsController < ApplicationController

  # Create
get '/posts/new' do
  @user = User.find(session[:user_id])
  @posts = Post.all
  erb :'/posts/new'
end

post '/posts' do
  if blank_params?("post")
    flash[:new_error] = "One or more fields were left empty. Please fill in all fields."
    redirect to '/posts/new'
  else
    flash[:new_success] = "Your Post has been added to the list."
    @post = Post.create(params[:post])
    redirect to "/posts/#{@post.slug}"
  end
end

# Read
get '/posts' do
  @posts = Post.all
  erb :'/posts/index'
end

end
