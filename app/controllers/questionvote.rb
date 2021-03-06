require_relative '../models/question_vote'

post '/question/:id/questionvotes' do 
	@question = Question.find(params[:id])
	@questionvoted = QuestionVote.where(question_id: @question.id, user_id: session[:user_id], vote: "true")
	if @questionvoted.any?
		@questionvoted.each {|q| q.delete}
	else
		@questionvote = @question.question_votes.create(user_id: session[:user_id], vote: true)
	end
	# @upvote_count = QuestionVote.where(question_id: @question.id, vote: "true").count
 #  @upvote_count.to_json
 	erb :"static/question"
end

post '/question/:id/questionvotes1' do 
	@question = Question.find(params[:id])
	@questionvoted = QuestionVote.where(question_id: @question.id, user_id: session[:user_id], vote: "false")
	if @questionvoted.any?
		@questionvoted.each {|q| q.delete}
	else
		@questionvote = @question.question_votes.create(user_id: session[:user_id], vote: false)
	end
	erb :"static/question"
end