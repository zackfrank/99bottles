class Bottles
  def verse(num)
    define_vessels(num)
    <<-VERSE
#{first_half(num)}
#{second_half(num)}
VERSE
  end

  def define_vessels(num)
    @vessel1 = "bottles"
    @vessel2 = "bottles"
    if num == 2
      @vessel2 = "bottle"
    elsif num == 1
      @vessel1 = "bottle"
    end
  end

  def first_half(num)
    if num >= 1
      "#{num} #{@vessel1} of beer on the wall, #{num} #{@vessel1} of beer."
    elsif num == 0
      "No more #{@vessel1} of beer on the wall, no more #{@vessel1} of beer."
    end
  end

  def second_half(num)
    if num > 1
      "Take one down and pass it around, #{num-1} #{@vessel2} of beer on the wall."
    elsif num == 1
      "Take it down and pass it around, no more #{@vessel2} of beer on the wall."
    elsif num == 0
      "Go to the store and buy some more, 99 #{@vessel2} of beer on the wall."
    end
  end

  def verses(num1, num2)
    verses_string = ""
    until num1 < num2
      define_vessels(num1)
      verses_string << first_half(num1)
      verses_string << "\n"
      verses_string << second_half(num1)
      if (num1 - 1) >= num2 
        verses_string << "\n\n"
      end
      num1 -= 1
    end
    <<-VERSES
#{verses_string}
VERSES
  end

  def song
    verses(99, 0)
  end
end