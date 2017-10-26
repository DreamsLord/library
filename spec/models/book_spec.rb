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

require 'rails_helper'

RSpec.describe Book, type: :model do
  describe 'database columns' do
    it { is_expected.to have_db_column(:id) }
    it { is_expected.to have_db_column(:name) }
    it { is_expected.to have_db_column(:author) }
    it { is_expected.to have_db_column(:category) }
    it { is_expected.to have_db_column(:description) }
    it { is_expected.to have_db_column(:created_at) }
    it { is_expected.to have_db_column(:updated_at) }
    it { is_expected.to have_db_column(:deleted_at) }
  end

  describe 'validations' do
    it { is_expected.to validate_presence_of(:name) }
    it { is_expected.to validate_presence_of(:author) }
    it {
      is_expected.to validate_length_of(:name)
        .is_at_least(1).is_at_most(255)
    }
    it {
      is_expected.to validate_length_of(:author)
        .is_at_least(1).is_at_most(255)
    }
    it {
      is_expected.to validate_length_of(:category)
        .is_at_least(1).is_at_most(255)
    }
    it {
      is_expected.to validate_length_of(:description)
        .is_at_least(25).is_at_most(6000)
    }
  end
end
