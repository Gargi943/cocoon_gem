class Author < ApplicationRecord
	has_many :books, inverse_of: :author, dependent: :delete_all
	accepts_nested_attributes_for :books, reject_if: :all_blank, allow_destroy: true
	validates :name, presence: true

end
