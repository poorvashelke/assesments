# == Schema Information
#
# Table name: users
#
#  id         :bigint           not null, primary key
#  username   :string
#  password   :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class User < ApplicationRecord
    has_many :watch_lists,
    foreign_key: :user_id,
    class_name: :WatchList

    has_many :watch_list_items,
    through: :watch_lists,
    source: :watch_list_items

    has_many :watched_companies,
    through: :watch_list_items,
    source: :company
end
