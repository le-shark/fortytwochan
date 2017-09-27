class Post < ApplicationRecord
  has_many :replies, class_name: "Post",
                     foreign_key: :thread_id

  belongs_to :thread, class_name: "Post"
  belongs_to :board

  scope :threads, -> { where("id = thread_id") }

  has_attached_file :picture, storage: :imgur
  validates_attachment_content_type :picture, content_type: /\Aimage\/.*\z/

  validates :text, presence: true
  validates :picture, attachment_presence: true, if: :thread?
  validates :title, presence: true, if: :thread?

  def thread?
    id == thread_id
  end

end
