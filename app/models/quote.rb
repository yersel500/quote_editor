class Quote < ApplicationRecord
  belongs_to :company
  validates :name, presence: true

  scope :ordered, -> { order(id: :desc) }

  broadcasts_to ->(_quote) { 'quotes' }, inserts_by: :prepend
end
