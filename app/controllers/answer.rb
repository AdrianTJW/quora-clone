require_relative '../models/answer'
require 'byebug'

get '/answers' do
	@questions = Question.all
	erb :"static/answer"
end

get '/answers/:answer_id' do
	@answer = Answer.find(params[:answer_id])
	@question = @answer.question
	erb :"static/question"
end

get '/answers/new' do

end

get '/answers/:id/edit' do
	
end

post '/question/:id/answers' do
	@question = Question.find(params[:id])
	@answer = @question.answers.create(answer: params[:answer], user_id: session[:user_id])
	redirect to "/answers/#{@answer.id}"
end

delete '/answers/:id' do
	@answer = Answer.find(params[:id])
	@answer.destroy
	@question = @answer.question
	erb :"static/question"
end



# get '/users/:user_id/questions/:question_id' do
# 	@user = User.find(params[:id])
# 	@questions = @user.questions
# 	redirect to '/users/:id'
# end
