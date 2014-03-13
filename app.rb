# Note: the name of this file (app.rb) is irrelevant.

# Require config/environment.rb
require ::File.expand_path('../config/environment',  __FILE__)

set :app_file, __FILE__

get '/' do
  posts = Post.order(:created_at).all
  erb :index, :locals => {:posts => posts}
end

get '/reverse' do
  posts = Post.reverse_order(:created_at).all
  erb :index, :locals => {:posts => posts}
end


post '/posts' do
  if Post.empty?
    puts "DON'T GIVE ME AN EMPTY POST, SCUMBAG!!!"
    redirect to('/')
  else
  Post.create(:body => params[:body])
  redirect to('/')
end
end

get '/todo' do
  erb :todo
end

post '/posts/:id/upvote' do
  post = Post.where(:id => params[:id]).first
  post.votes = post.votes + 1
  post.save
  redirect to('/')
end

post '/posts/:id/downvote' do
  post = Post.where(:id => params[:id]).first
  post.votes = post.votes - 1
  post.save
  redirect to('/')
end

post "/posts/:id/delete" do
  post = Post.where(:id => params[:id])
  post.delete
  redirect to('/')
end