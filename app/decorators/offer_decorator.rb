class OfferDecorator < Draper::Decorator
  delegate_all

  STATUS_DESCRIPTIONS = {
    "money_send_to_buyers" => "Argent envoyé à l'acheter",
    "paid" => "Paiement effectué",
    "payment_due" => "Reste à payer"
  }.freeze

  def formatted_status_collection
    STATUS_DESCRIPTIONS.map { |k, v| [v, k] }
  end

  def formatted_status
    STATUS_DESCRIPTIONS[status]
  end

  def formatted_is_buyer
    is_buyer ? "Oui" : "Non"
  end
end
