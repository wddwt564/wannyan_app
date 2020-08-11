class Comment < ApplicationRecord
      belongs_to :room               #roomsテーブルとのアソシエーション
      belongs_to :user, optional: true   #usersテーブルとのアソシエーション
end
