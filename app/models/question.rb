# require_relative '../controllers/question'
# require_relative '../controllers/static'


class Question < ActiveRecord::Base
	has_many :answers
	has_many :question_votes
	belongs_to :user
	# def current_user
	# 	return unless session[:user_id]
 	#   @current_user ||= User.find(session[:user_id])
	# end

	def arrange
		
	end



end


