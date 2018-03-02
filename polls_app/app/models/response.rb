# == Schema Information
#
# Table name: responses
#
#  id               :integer          not null, primary key
#  user_id          :integer          not null
#  question_id      :integer          not null
#  answer_choice_id :integer          not null
#

class Response < ApplicationRecord
  validate :respondent_already_answered

  belongs_to :answer_choice,
    class_name: :AnswerChoice,
    primary_key: :id,
    foreign_key: :answer_choice_id

  belongs_to :respondant,
    class_name: :User,
    primary_key: :id,
    foreign_key: :user_id

  has_one :question,
    through: :answer_choice,
    source: :question

  def author_own_poll?
    self.question.poll.author_id == self.id
  end

  def sibling_responses
    current_question = self.question
    current_question.responses.where.not('responses.id = ?', self.id)

  end

  def respondent_already_answered?
    siblings_ids = self.sibling_responses.pluck(:user_id)
    current_user_id = self.user_id

    siblings_ids.each do |sib|
      return true if sib == current_user_id
    end

    false
  end

  private
  def respondent_already_answered
    if respondent_already_answered?
      errors[:base] << 'can\'t answer again'
    end
  end
end
