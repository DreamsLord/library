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

require 'rails_helper'

RSpec.describe Rent, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
