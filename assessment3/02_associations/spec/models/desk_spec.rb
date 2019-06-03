# == Schema Information
#
# Table name: desks
#
#  id         :integer          not null, primary key
#  model      :string
#  owner_id   :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'rails_helper'

RSpec.describe Desk, type: :model do
  it 'is owned by a senator' do
    elizabeth = Senator.find_by(lname: 'Warren')
    desk = Desk.find_by(owner_id: elizabeth.id)

    expect(desk.owner).to eq(elizabeth)
  end
end
