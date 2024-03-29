# == Schema Information
#
# Table name: parties
#
#  id              :integer          not null, primary key
#  name            :string
#  color           :string
#  ideology_id     :integer
#  party_leader_id :integer
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

require 'rails_helper'

RSpec.describe Party, type: :model do
  subject(:democrats) { Party.find_by(name: 'Democratic Party') }

  it 'has a guiding ideology' do
    expect(democrats.ideology.name).to eq('Liberalism')
  end

  it 'has a party leader' do
    expect(democrats.party_leader.lname).to eq('Reid')
  end

  it 'has senator members' do
    expect(democrats.senators.pluck(:lname)).
      to match_array(%w(Boxer Feinstein Reid Warren))
  end
end
