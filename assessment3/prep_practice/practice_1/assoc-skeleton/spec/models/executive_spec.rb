# == Schema Information
#
# Table name: executives
#
#  id         :bigint           not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'rails_helper'

RSpec.describe Executive, type: :model do
  subject(:larry) { Executive.first }
  
  let(:goog_board) do
    goog_id = Company.find_by_name("Google").id
    Board.find_by_company_id(goog_id)  
  end
  
  it "has a membership" do
    expect(larry.memberships.first.board_id).to eq(goog_board.id)
  end

  it "is on a board" do
    expect(larry.boards.first).to eq(goog_board)
  end
end
