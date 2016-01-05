require_relative '../controllers/answer'

class Answer < ActiveRecord::Base
	belongs_to :question
	belongs_to :user
end