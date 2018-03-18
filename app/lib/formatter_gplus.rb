class Formatter_GPlus
  def initialize(html)
    @html = html.dup
  end

  def formatted
    result = @html

    strike_through(result)
    result
  end

  def strike_through(text)
    text.gsub!(/- ([^-]*) -/) { %(<s>#{text}</s>) }
  end
end