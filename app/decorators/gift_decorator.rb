class GiftDecorator < Draper::Decorator
  delegate_all

  def formatted_price
    "%.2f €" % price.to_f
  end

  def formatted_participants
    offers&.map(&:user)&.map(&:name)&.join(", ")
  end

  def formatted_buyers
    buyers&.map(&:name)&.join(", ")
  end

  def formatted_description
    description.capitalize
  end

  def formatted_status
    case status
    when "available"
      return "Disponible"
    when "selected"
      return "Quelqu'un participe"
    when "paid"
      return "Payé"
    when "partially_paid"
      return "Partiellement payé"
    when "gifted"
      return "Offert"
    end
  end
end
