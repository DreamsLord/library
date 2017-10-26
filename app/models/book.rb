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

  scope :without_destroyed, -> { where(deleted_at: nil) }
  has_many :rents

  # We hide books which had been rented becouse
  # we want to have history rent
  def delete
    can_be_destoryed? ? self.destroy : self.hide_book
  end

  def hide_book
    update(deleted_at: Time.now)
  end

  def can_be_destoryed?
    !rents.present?
  end

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
