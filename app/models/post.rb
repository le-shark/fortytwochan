class Post < ApplicationRecord
  has_many :replies, class_name: "Post",
                     foreign_key: :thread_id

  belongs_to :thread, class_name: "Post"
  belongs_to :board

  scope :threads, -> { where("id = thread_id") }

  def thread?
    id == thread_id
  end
end
