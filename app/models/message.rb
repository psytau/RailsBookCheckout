class Message < ActiveRecord::Base
  belongs_to :user
  belongs_to :originator, :class_name => 'User'
  belongs_to :book

  def self.follower_message args
    followers = Follower.where('book_id = ?', args[:book_id]).pluck(:user_id)
    followers.each do |follower|
      Message.create({
        user_id: follower,
        originator: args[:by],
        book_id: args[:book_id],
        kind: args[:kind],
        kind_id: args[:kind_id]
      })
    end
  end

end
