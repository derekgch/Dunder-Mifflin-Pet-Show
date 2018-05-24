class Employee < ApplicationRecord
  belongs_to :dog

  validates :alias, uniqueness: true, unless: :alias_is_none
  validates :title, uniqueness: true

  def name
    self.first_name + " " + self.last_name
  end

  def self.search(search)
   where("last_name LIKE ? OR first_name LIKE ? OR title LIKE ? OR office LIKE ?", "%#{search}%", "%#{search}%", "%#{search}%", "%#{search}%")
  end

  private

  def alias_is_none
    self.alias == "none"
  end


end
