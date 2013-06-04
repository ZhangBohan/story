#encoding: utf-8

class Event < ActiveRecord::Base
  attr_accessible :description, :effect_at, :img_url, :name, :repeat, :visible

  validates :name, :description, :img_url, :repeat, :effect_at, :presence => true

  def pass?
    Date::today >= self.effect_at
  end

  def not_pass?
    not pass?
  end

  def day_left
    today = Date::today
    delta = -1
    if not_pass?
      delta = self.effect_at - today
    else
      if self.repeat == 'YEAR'
        repeat_date = Date.new(today.year, self.effect_at.month, self.effect_at.day)
        delta = repeat_date - today
      elsif self.repeat == 'MONTH'
        repeat_date = Date.new(today.year, today.month, self.effect_at.day)
        delta = repeat_date - today
      end
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
