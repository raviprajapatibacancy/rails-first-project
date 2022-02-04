class Blog < ApplicationRecord
    belongs_to :category
    has_and_belongs_to_many :tags
    mount_uploader :attachment, AttachmentUploader
    has_one_attached :attachment
    validates :title,  presence: true, length: { maximum: 50 }
    validates :tags,  presence: { message: 'field is required'}
    validates :attachment,  presence: { message: 'field is required'}
end
