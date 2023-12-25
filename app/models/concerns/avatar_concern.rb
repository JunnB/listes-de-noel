module AvatarConcern
  extend ActiveSupport::Concern
  included do
    has_one_attached :avatar do |attachable|
      attachable.variant :thumb, resize_to_limit: [150, 150]
    end
  end

  def avatar_url(scope = nil)
    if avatar.attached?
      scope ? avatar.variant(scope) : avatar
    else
      "https://cdn.vectorstock.com/i/preview-1x/29/09/avatar-m-vector-37332909.jpg"
    end
  end
end
