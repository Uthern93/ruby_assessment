class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :blog

  scope :active, -> { where(deleted_at: nil) }

  def soft_delete
    update(deleted_at: Time.current)
  end

  def deleted?
    deleted_at.present?
  end
end
