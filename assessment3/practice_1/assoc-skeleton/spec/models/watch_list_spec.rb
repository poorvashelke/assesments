# == Schema Information
#
# Table name: watch_lists
#
#  id         :bigint           not null, primary key
#  name       :string
#  user_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'rails_helper'

RSpec.describe WatchList, type: :model do
  subject(:wl) { WatchList.first }

  it "has a user" do
    steve = User.find_by_username("stevej")
    expect(wl.user).to eq(steve)
  end

  it "has a watch list item" do
    goog_id = Company.find_by_name("Google").id
    watch_goog = WatchListItem.find_by_company_id(goog_id)
    expect(wl.watch_list_items.first).to eq(watch_goog)
  end

  describe "validations" do 
    it "require watch list to have a user" do
      is_expected.to validate_presence_of(:user).with_message(/must exist/)
    end
  end
end
