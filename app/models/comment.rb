class Comment < ApplicationRecord
  belongs_to :commentable, polymorphic: true
  validates :body, presence: true

  after_create :increment_comments_count
  after_destroy :decrement_comments_count

  private

  def increment_comments_count
    if commentable_type == "Photo"
      commentable.increment!(:comments_count)

    end
  end

  def decrement_comments_count
    if commentable_type == "Photo"
      commentable.decrement!(:comments_count)
    end
  end
end
