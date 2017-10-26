# frozen_string_literal: true

# == Schema Information
#
# Table name: rents
#
#  id          :integer          not null, primary key
#  user_id     :integer          not null
#  book_id     :integer          not null
#  return_date :date             not null
#  return?     :boolean          default(FALSE), not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Rent < ApplicationRecord
  belongs_to :user
  belongs_to :book
  validates :user_id, :book_id, :return_date, presence: true
  validate :book_can_be_rent_only_by_one_person_at_this_same_time, on: :create

  def book_can_be_rent_only_by_one_person_at_this_same_time
    if Rent.where(book_id: book, return?: false).exists?
      errors.add(:book_id, "can't be twice rent in the same time")
    end
  end
end
