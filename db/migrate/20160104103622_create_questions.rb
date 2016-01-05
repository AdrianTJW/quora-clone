class CreateQuestions < ActiveRecord::Migration
	def change
		create_table :questions do |t|
			t.integer :user_id
			t.string :question
			t.timestamp null: false
		end
	end
end
