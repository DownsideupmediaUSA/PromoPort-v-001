class Comment < ApplicationRecord

    belongs_to :user
    belongs_to :song


    accepts_nested_attributes_for :user, reject_if: :all_blank
end
