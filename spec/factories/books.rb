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

FactoryBot.define do
  factory :book do
    name 'Name'
    author 'author'
    category 'category'
    description 'description MyText with description min 25 characters'

    factory :other_book do
      name 'name_other'
      author 'author_other'
      category 'category_other'
      description 'description MyText with description min 25 characters_other'
    end

    factory :invalid_book do
      name nil
      author nil
      category 'MyString'
      description 'MyText with description min 25 characters'
    end

    factory :deleted_book do
      name nil
      author nil
      category 'MyString'
      description 'MyText with description min 25 characters'
      deleted_at '2017-10-26 18:18:57 +0200'
    end
  end
end
