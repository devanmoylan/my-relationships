# frozen_string_literal: true

module ApplicationHelper
  def bootstrap_class_for(flash_type)
    {
      success: "alert-success",
      error: "alert-danger",
      alert: "alert-warning",
      notice: "alert-info"
    }.stringify_keys[flash_type.to_s] || flash_type.to_s
  end

  def avatar(object, size = 40)
    if object.avatar.attached?
      object.avatar.variant(resize: "#{size}x#{size}!")
    else
      gravatar_image_url(object.id.to_s, size: size)
    end
  end

  def date_field_min_and_max
    {
      min: Date.new(1900, 01, 01),
      max: Date.today
    }
  end
end
