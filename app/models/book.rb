# frozen_string_literal: true
# == Schema Information
#
# Table name: books
#
#  id          :integer          not null, primary key
#  name        :string           not null
#  author      :string           not null
#  category    :string           default("")
#  description :text             default("")
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  deleted_at  :datetime
#

class Book < ApplicationRecord
  validates :name, :author, presence: true
  validates :name, :author, :category, length: { in: 1..255 }
  validates :description, length: { in: 25..6000 }

  has_many :rents

  def rented?
    rents.present? && any_book_rented?
  end

  def any_book_rented?
    rents.each do |rent|
      return true unless rent.return?
    end
    false
  end
end
