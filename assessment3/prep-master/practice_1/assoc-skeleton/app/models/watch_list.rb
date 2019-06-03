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

class WatchList < ApplicationRecord
    has_many :watch_list_items,
    foreign_key: :watch_list_id,
    class_name: 'WatchListItem'

    belongs_to :user,
    foreign_key: :user_id,
    class_name: 'User'

end
