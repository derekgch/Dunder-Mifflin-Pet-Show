class Employee < ApplicationRecord
  belongs_to :dog

  validates :alias, uniqueness: true, :allow => { :if => :alias_is_none }
  validates :title, uniqueness: true

  def name
    self.first_name + " " + self.last_name
  end
  private

  def alias_is_none
    self.alias == "none"
  end


end
