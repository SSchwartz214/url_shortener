class Url < ApplicationRecord
  validates_presence_of :original
  after_create :generate_short
  
  def generate_short
      self.short = self.id.to_s(36)

      self.save
  end
end