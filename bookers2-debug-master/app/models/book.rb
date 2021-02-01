class Book < ApplicationRecord
	belongs_to :user
	#9 has_many :user=>belongs_to :user

	validates :title, presence: true
	validates :body, presence: true, length: {maximum: 200}
end
