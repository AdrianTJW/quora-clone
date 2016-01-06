require_relative '../models/user'

get '/login' do
  erb :"static/index"
end

get '/error' do
	erb :"static/error"
end

get '/' do
	erb :"static/mainpage"
end

get '/users/:user_id' do
	@user = User.find(session[:user_id])

	erb :"static/user"
end

post '/users/:user_id/questions' do
	@user = User.find(session[:user_id])
	@questions = @user.questions
	erb :"static/user"
end

post '/users/:user_id/answers' do
	@user = User.find(session[:user_id])
	@answers = @user.answers
	erb :"static/user"
end

post '/signup' do
	# user = User.new(fullname: params[:fullname], email: params[:email], password: params[:password])
	@user = User.new(params[:user])
  # @user.password = params[:password]
  # byebug
	if @user.save
		session[:user_id] = @user.id
		redirect to '/'
	else
		redirect to '/error'
	end
end

# Alternative signup
# post '/signup' do 
#     user = User.new(full_name: params[:fullname], email: params[:email], password: params[:password])
#     user.save
#     	redirect to '/'
#     else 
#     	redirect to '/error'
#     end     
# end

post '/login' do
	@user = User.find_by(email: params[:user][:email])
	# byebug
	if @user && @user.authenticate(params[:user][:password])
    session[:user_id] = @user.id
    redirect to '/'
  else
    redirect to '/error'
  end
end

# post '/login' do
#     @user = User.find_by_email(params[:email])
#     if BCrypt::Password.new(@user.encrypted_password) == params['password']
#         # OR if@user.authenticate(params[:password])
#         #use .new to create a new instance of the encrypted_password, then we compare with the value and use the function ==. 
#         #change from string to BCrypt object, then we can use BCrypt method on it. 
#     session[:user_id] = @user.id
#     redirect to '/users/:id'
#     else 
#     redirect to '/error'
#     end     
# end

post '/logout' do
	session[:user_id] = ""
	redirect to '/login'
end


