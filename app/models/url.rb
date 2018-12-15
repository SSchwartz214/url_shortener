class Url < ApplicationRecord
  validates_presence_of :original

  # LETTERS = [('a'..'z'), ('A'..'Z')].map { |i| i.to_a }.flatten

  # def generate_random_id
  #   if self.random_id
  #     self.random_id = self.random_id
  #   else
  #     self.random_id = (0...8).map { letters[rand(letters.length)] }.join
  #   self.save
  #   end
  # end
end