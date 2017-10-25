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

FactoryBot.define do
  factory :rent do
    user nil
    book nil
    return_date '2017-10-25'
    return? false
  end
end