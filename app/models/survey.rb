class Survey < ActiveRecord::Base
  has_many :questions
  accepts_nested_attributes_for :questions, :reject_if => :all_blank
  has_many :answers, through: :questions
end
