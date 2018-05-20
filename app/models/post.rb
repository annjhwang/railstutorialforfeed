class Post < ApplicationRecord
  after_create :notify_pusher, on: :create
  has_many :likes

  def notify_pusher
    Pusher.trigger('feed', 'new-post', self.as_json(include: :likes))
  end
end
