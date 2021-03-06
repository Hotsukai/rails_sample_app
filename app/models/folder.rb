# frozen_string_literal: true

class Folder < ApplicationRecord
  belongs_to :user

  has_many :hold_relationships, class_name: 'FolderSpotRelationship', foreign_key: :folder_id, dependent: :destroy
  has_many :spots, through: :hold_relationships, source: :spot

  default_scope -> { order(created_at: :desc) } # DBから取得したときの並び順
  validates :user_id, presence: true
  validates :name, presence: true, length: { maximum: 50 }
  validates :description, length: { maximum: 255 }
  has_one_attached :image
end
