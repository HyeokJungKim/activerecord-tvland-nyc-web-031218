require 'pry'
class Actor < ActiveRecord::Base
  has_many :characters
  has_many :shows, through: :characters

  def full_name
    return "#{self.first_name} #{self.last_name}"
  end

  def list_roles

    arr = self.characters.map do |character|
      character.name
    end

    i = 0
    self.characters.each do |character|
        arr[i] += " -  + #{character.show.name}"
        i += 1
    end
    return arr
  end

end
