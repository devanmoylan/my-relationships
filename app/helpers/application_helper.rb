# frozen_string_literal: true

module ApplicationHelper
  def avatar(object, size = 40)
    if object.avatar.attached?
      object.avatar.variant(resize: "#{size}x#{size}!")
    else
      gravatar_image_url(object.id.to_s, size: size)
    end
  end
end
