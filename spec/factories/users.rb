# == Schema Information
#
# Table name: users
#
#  id                     :integer          not null, primary key
#  email                  :string           default(""), not null
#  name                   :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  reset_password_token   :string
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  sign_in_count          :integer          default(0), not null
#  current_sign_in_at     :datetime
#  last_sign_in_at        :datetime
#  current_sign_in_ip     :inet
#  last_sign_in_ip        :inet
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#

FactoryBot.define do
  factory :user do
    email 'user@user.pl'
    password '123123'

    factory :user1 do
      email 'user@user.pl'
      password '123123'

    end
    factory :other_user do
      email 'other@user.pl'
      password '123123'

    end
    factory :other2_user do
      email 'other2@user.pl'
      password '123123'
    end
  end
end
