class Post < ApplicationRecord
  has_many :replies, class_name: "Post",
                     foreign_key: :thread_id

  belongs_to :thread, class_name: "Post"
  belongs_to :board

  scope :threads, -> { where("id = thread_id") }

  mount_uploader :picture, PictureUploader
  validates :text, presence: true
  validates :title, presence: true, if: :thread?
  validates_presence_of :picture, if: :thread?

  before_destroy :delete_picture_from_cloud_and_replies

  def thread?
    id == thread_id
  end

  def delete_picture_from_cloud_and_replies
    if id = self.picture.file.public_id
      Cloudinary::Uploader.destroy(id)
    end
    if self.thread?
      self.replies.where.not("id = thread_id").each do |r|
        r.destroy
      end
    end
  end

end
