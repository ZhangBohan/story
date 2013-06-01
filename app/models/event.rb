#encoding: utf-8

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

  def left_to_s
    str = ''
    if day_left == 0
      str = '就是今天'
    elsif day_left > 0
      str = "还有#{day_left}天"
    end

    str
  end
end
