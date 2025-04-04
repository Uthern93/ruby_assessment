class Blog < ApplicationRecord

  belongs_to :user
  has_many :comments, dependent: :destroy

  has_rich_text :content
  has_one_attached :image_url

  validates :title, presence: true
  validates :content, presence: true

  scope :active, -> { where(deleted_at: nil) }

  def soft_delete
    update(deleted_at: Time.current)
  end

  def deleted?
    deleted_at.present?
  end

end
