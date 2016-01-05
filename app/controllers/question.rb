require_relative '../models/question'
require 'byebug'

get '/questions' do
	@questions = Question.all
	erb :"static/question"
end

get '/questions/:question_id' do
	@question = Question.find(params[:question_id])
	erb :"static/question"
end

get '/questions/new' do

end

get '/questions/:id/edit' do

end

post '/questions' do
	question = Question.create(question: params[:search], user_id: session[:user_id])
	redirect to "/questions/#{question.id}"
end

# put 'questions/:id' do

# end

post '/questions/:question_id' do
	@question = Question.find(params[:question_id])
	@question.delete
	redirect to "/"
end




# get '/users/:user_id/questions/:question_id' do
# 	@user = User.find(params[:id])
# 	@questions = @user.questions
# 	redirect to '/users/:id'
# end



