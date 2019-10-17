class Follow < ApplicationRecord

belongs_to :follower ,foriegn_key: :user_id,class_name: 'User'
belongs_to :following,foriegn_key: :following_id,class_name: 'User'

end
