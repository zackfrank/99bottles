class Bottles
  def verse(num)
    define_vessels(num)
    define_first_half_of_verse(num)
    define_second_half_of_verse(num)
    <<-VERSE
#{@first_half}
#{@second_half}
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

  def define_first_half_of_verse(num)
    if num >= 1
      @first_half = "#{num} #{@vessel1} of beer on the wall, #{num} #{@vessel1} of beer."
    elsif num == 0
      @first_half = "No more #{@vessel1} of beer on the wall, no more #{@vessel1} of beer."
    end
  end

  def define_second_half_of_verse(num)
    if num > 1
      @second_half = "Take one down and pass it around, #{num-1} #{@vessel2} of beer on the wall."
    elsif num == 1
      @second_half = "Take it down and pass it around, no more #{@vessel2} of beer on the wall."
    elsif num == 0
      @second_half = "Go to the store and buy some more, 99 #{@vessel2} of beer on the wall."
    end
  end

  def verses(num1, num2)
    verses_string = ""
    until num1 < num2
      define_vessels(num1)
      define_first_half_of_verse(num1)
      define_second_half_of_verse(num1)
      verses_string << @first_half
      verses_string << "\n"
      verses_string << @second_half
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
    num = 99
    verses_string = ""
    until num < 0
      define_vessels(num)
      define_first_half_of_verse(num)
      define_second_half_of_verse(num)
      verses_string << @first_half
      verses_string << "\n"
      verses_string << @second_half
      if (num - 1) >= 0 
        verses_string << "\n\n"
      end
      num -= 1
    end
    <<-SONG
#{verses_string}
SONG
  end
end