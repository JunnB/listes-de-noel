class UserDecorator < Draper::Decorator
  delegate_all

  def avatar_tag(options: {})
    return h.image_tag(user.avatar_url(options[:scope] || :thumb), class: "w-8 h-8 rounded-full #{options[:class]}")
  end
end
