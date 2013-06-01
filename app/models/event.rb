class Event < ActiveRecord::Base
  attr_accessible :description, :effect_at, :img_url, :name, :repeat, :visible

  validates :name, :description, :img_url, :repeat, :visible, :effect_at, :presence => true

  def pass?
    Date::today > self.effect_at
  end

  def not_pass?
    not pass?
  end

  def day_left
    delta = nil
    if not_pass?
      delta = self.effect_at - Date::today
    end

    delta.to_i
  end
end
