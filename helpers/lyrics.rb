# For printing strings without surrounding quotes

class LyricStr
  def initialize(str)
    @str = str.to_s
  end

  def inspect()
    # Override inspect to return the string as-is (without adding quotes)
    @str
  end

  def to_s()
    @str
  end
end

def lyrics(*strs)
  puts LyricStr.new(strs.join " ")
end
