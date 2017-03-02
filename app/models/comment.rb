class Comment < ApplicationRecord
    belongs_to :song
    belongs_to :user

    # accepts_nested_attributes_for :user, reject_if: :all_blank


    # def total_comments
    #   @total_comments = @user.comments.count
    # end





end
