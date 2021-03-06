# frozen_string_literal: true

module ApplicationHelper
  include ActionView::Helpers::DateHelper

  def age_helper(birthday)
    return nil if birthday.nil?

    ((Date.today - birthday) / 365.25).to_i
  end

  def avatar(object, size = 40)
    if object.avatar.attached?
      object.avatar.variant(resize: "#{size}x#{size}!")
    else
      gravatar_image_url(object.id.to_s, size: size)
    end
  end

  def bootstrap_class_for(flash_type)
    {
      success: 'alert-success',
      error: 'alert-danger',
      alert: 'alert-warning',
      notice: 'alert-info'
    }.stringify_keys[flash_type.to_s] || flash_type.to_s
  end

  def distance_of_time_in_words_to_now_helper(datetime)
    if datetime.future?
      distance_of_time_in_words_to_now(datetime) + " from now"
    else
      distance_of_time_in_words_to_now(datetime) + " ago"
    end

  end

  def row_color(date)
    if date.today?
      'table-danger'
    elsif (Date.today..7.days.from_now).include?(date)
      'table-warning'
    end
  end
end
