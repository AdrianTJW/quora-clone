# require_relative '../controllers/questionvote'

class QuestionVote < ActiveRecord::Base
	belongs_to :question
	belongs_to :user
end