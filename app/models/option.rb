# == Schema Information
#
# Table name: options
#
#  id          :integer          not null, primary key
#  content     :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  question_id :integer          not null
#
# Indexes
#
#  index_options_on_question_id  (question_id)
#
# Foreign Keys
#
#  question_id  (question_id => questions.id)
#
class Option < ApplicationRecord
  belongs_to :question
  validates :content, presence: true
end
