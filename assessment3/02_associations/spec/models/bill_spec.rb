# == Schema Information
#
# Table name: bills
#
#  id         :integer          not null, primary key
#  title      :string
#  author_id  :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'rails_helper'

RSpec.describe Bill, type: :model do
  subject(:bag_ban) { Bill.find_by(title: 'Ban plastic bags.') }

  it 'is authored by a senator' do
    expect(bag_ban.author.lname).to eq('Feinstein')
  end

  it 'is sponsored by a party (based on its author)' do
    expect(bag_ban.sponsoring_party.name).to eq('Democratic Party')
  end

  it 'has endorsing senators' do
    expect(bag_ban.endorsing_senators.pluck(:lname)).
      to match_array(%w(Boxer McConnell Reid))
  end
end
