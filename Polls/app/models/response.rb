class Response < ActiveRecord::Base
  validates :user_id, presence: true
  validates :answer_choice_id, presence: true
  #validate :respondent_has_not_already_answered_question
  validate :no_rigging

  belongs_to :respondent,
  class_name: "User",
  foreign_key: :user_id,
  primary_key: :id

  belongs_to :answer_choice,
  class_name: "AnswerChoice",
  foreign_key: :answer_choice_id,
  primary_key: :id

  has_one :question, through: :answer_choice, source: :question
  has_one :poll, through: :question, source: :poll
  #has_one :poll_author, through: :poll, source: :author

  def sibling_responses
    self.question.responses.where.not(id: self.id)
    # if self.id.nil?
    #   self.question.responses
    # else
    #   self.question.responses.where("responses.id != #{self.id}")
    # end
  end

  def poll
    self.question.poll
  end

  private

  def respondent_has_not_already_answered_question
    unless sibling_responses.where(user_id: self.user_id).empty?
      errors[:user_id] << "#{self.respondent.user_name} has already answered this question"
    end
  end

  def no_rigging
    if self.poll.author_id == self.user_id
      errors[:user_id] << "#{self.respondent.user_name} wrote the poll! Stop trying to rig it!"
    end
  end

end