class Reservation < ApplicationRecord
  enum status: {Waiting: 0, Approved: 1, Declined: 2}

  belongs_to :user
  belongs_to :activity

  scope :current_week_revenue, -> (user) {
    joins(:activity)
    .where('activities.user_id = ? AND reservations.updated_at >= ? AND reservations.status = ?', user.id, 1.week.ago, 1)
    .order(updated_at: :asc)
  }

  def receipt
    Receipts::Receipt.new(
      id: id,
      subheading: "Receipt for #{activity.name}",
      product: "#{activity.name}",
      company: {
        name: "BTO Marketing",
        address: "No.1, Bangunan MPLBP\nTeluk Yu\nLangkawi, Kedah 07000",
        email: "buyticketsmarketing@gmail.com",
        logo: Rails.root.join("app/assets/images/receiptlogo/main-logo.png")
      },
      line_items: [
        ["Arrival Date",   arrival.strftime("%e %b %Y")],
        ["Account Billed", "#{user.fullname} (#{user.email})"],
        ["Product",        "#{activity.name}"],
        ["Amount",         "MYR#{total}"],
      ]
    )
  end

end
