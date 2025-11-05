# == Schema Information
#
# Table name: questions
#
#  id            :integer          not null, primary key
#  content       :string
#  mandatory     :boolean          default(FALSE), not null
#  question_type :integer          default("single_choice"), not null
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  survey_id     :integer          not null
#
# Indexes
#
#  index_questions_on_survey_id  (survey_id)
#
# Foreign Keys
#
#  survey_id  (survey_id => surveys.id)
#
class Question < ApplicationRecord
  belongs_to :survey
  has_many :options, dependent: :destroy
  accepts_nested_attributes_for :options
  validates :content, :question_type, presence: true

  # Integer-backed enum for question types
  # Use an explicit Hash literal wrapped in braces to force a positional Hash argument
  # (avoids Ruby treating the mapping as keyword args and passing 0 args to `enum`).
  # Use two-argument form: attribute name, then mapping hash
  enum :question_type, {
    single_choice: 0,
    multiple_choice: 1,
    text: 2,
    scale: 3,
    yes_no: 4,
    other: 5
  }

end
