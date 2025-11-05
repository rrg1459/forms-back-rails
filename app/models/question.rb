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
