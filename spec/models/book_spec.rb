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
#

require 'rails_helper'

RSpec.describe Book, type: :model do
  describe "database columns" do
    it {should have_db_column(:id) }
    it {should have_db_column(:name) }
    it {should have_db_column(:author) }
    it {should have_db_column(:category) }
    it {should have_db_column(:description) }
    it {should have_db_column(:created_at) }
    it {should have_db_column(:updated_at) }
  end

  describe "validations" do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:author) }
    it { should validate_length_of(:name).is_at_least(1).is_at_most(255) }
    it { should validate_length_of(:author).is_at_least(1).is_at_most(255) }
    it { should validate_length_of(:category).is_at_least(1).is_at_most(255) }
    it { should validate_length_of(:description).is_at_least(25).is_at_most(6000) }

  end
end
