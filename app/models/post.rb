class Post < ApplicationRecord
  has_many :replies, class_name: "Post",
                     foreign_key: :thread_id

  belongs_to :thread, class_name: "Post"
  belongs_to :board

  scope :threads, -> { where("id = thread_id") }

  has_attached_file :picture, {
    url: "/system/:attachment/:hash.:extension",
    hash_secret: "eb696c8538ef93e1ea688b3447432893759c43881683e6bb33b50b1eb1f40691615948ce94396d4da7a4fd55ed4b5315f9c15bb36e91b8e940f40887cdb06de8"
}
  validates_attachment_content_type :picture, content_type: /\Aimage\/.*\z/

  validates :text, presence: true
  validates :picture, attachment_presence: true, if: :thread?
  validates :title, presence: true, if: :thread?

  def thread?
    id == thread_id
  end

end
