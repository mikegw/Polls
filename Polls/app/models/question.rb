class Question < ActiveRecord::Base
  validates :text, presence: true
  validates :poll_id, presence: true

  belongs_to :poll,
  class_name: "Poll",
  foreign_key: :poll_id,
  primary_key: :id

  has_many :answer_choices,
  class_name: "AnswerChoice",
  foreign_key: :question_id,
  primary_key: :id

  has_many :responses, through: :answer_choices, source: :responses

  # def results
#     answer = {}
#     ac = answer_choices.includes(:responses)
#
#     ac.each do |answer_choice|
#       answer[answer_choice.text] = answer_choice.responses.length
#     end
#     answer
#   end

  def results
    a = {}
    answer_choices.select("answer_choices.*, COUNT(responses.id) AS responses_count")
    .joins("LEFT OUTER JOIN responses ON answer_choices.id = responses.answer_choice_id")
    .group("answer_choices.id")
    .each do |answer_choice|
      a[answer_choice.text] = answer_choice.responses_count
    end
    a
  end

end