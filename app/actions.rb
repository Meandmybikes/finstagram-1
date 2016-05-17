def humanized_time_ago(minute_num)
  if minute_num >= 60
    "#{minute_num / 60} hours ago"
  else
    "#{minute_num} minutes ago"
  end
end

post '/signup' do

  email      = params[:email]
  avatar_url = params[:avatar_url]
  username   = params[:username]
  password   = params[:password]

    user = User.new({ email: email, avatar_url: avatar_url, username: username, password: password })
  if 
    user.save

    escape_html user.inspect

  else
    erb(:signup)
  end
end


get '/' do
  @posts = Post.order(created_at: :desc)
  erb(:index)
end

get '/signup' do  
  @user = User.new   
  erb(:signup)       
end