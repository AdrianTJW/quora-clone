require_relative '../models/answer_vote'
require 'byebug'

post '/answer/:id/answervotes' do 
	@answer = Answer.find(params[:id])
	@answervoted = AnswerVote.where(answer_id: @answer.id, user_id: session[:user_id], vote: "true")
	if @answervoted.any?
		@answervoted.each {|q| q.delete}
	else
		@answervote = @answer.answer_votes.create(user_id: session[:user_id], vote: true)
	end
	@question = Question.find(params[:@question_id])
	erb :"static/question"
end

post '/answer/:id/answervotes1' do 
	@answer = Answer.find(params[:id])
	@answervoted = AnswerVote.where(answer_id: @answer.id, user_id: session[:user_id], vote: "false")
	if @answervoted.any?
		@answervoted.each {|q| q.delete}
	else
		@answervote = @answer.answer_votes.create(user_id: session[:user_id], vote: false)
	end
	@question = Question.find(params[:@question_id])
	erb :"static/question"
end