class Formatter_GPlus
  STRIKETHROUGH = /- ([^-]*) -/

  def initialize(html)
    @html = html.dup
  end

  def format()
    result = @html

    strike_through(result)
    return result
  end

  def strike_through(html)
    return html.gsub!(/- ([^-]*) -/) { %(<s>$1</s>) }
  end
end