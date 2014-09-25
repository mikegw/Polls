class Response < ActiveRecord::Base
  validates :user_id, presence: true
  validates :answer_choice_id, presence: true
  validate :respondent_has_not_already_answered_question

  belongs_to :respondent,
  class_name: "User",
  foreign_key: :user_id,
  primary_key: :id

  belongs_to :answer_choice,
  class_name: "AnswerChoice",
  foreign_key: :answer_choice_id,
  primary_key: :id

  has_one :question, through: :answer_choice, source: :question

  def sibling_responses
    self.question.responses.where.not(id: self.id)
    # if self.id.nil?
    #   self.question.responses
    # else
    #   self.question.responses.where("responses.id != #{self.id}")
    # end
  end


  private

  def respondent_has_not_already_answered_question
    unless sibling_responses.where(user_id: self.user_id).empty?
      errors[:user_id] << "#{self.respondent.user_name} has already answered this question"
    end
  end
end