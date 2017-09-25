class Post < ApplicationRecord
  has_many :replies, class_name: "Post",
                     foreign_key: :thread_id

  belongs_to :thread, class_name: "Post"
  belongs_to :board

  scope :threads, -> { where("id = thread_id") }

  mount_uploaders :pictures, PictureUploader
  serialize :pictures, JSON

  validates :text, presence: true
  validates :pictures, presence: true, if: :thread?
  validates :title, presence: true, if: :thread?

  def thread?
    id == thread_id
  end

end
