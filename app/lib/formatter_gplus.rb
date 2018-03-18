require 'redcarpet'
require 'redcarpet/render_strip'

class Formatter_GPlus
  def initialize(html)
    @html = html.dup
  end

  def formatted
    decoration_renderer = DecorationRenderer.new()
    decorated = Redcarpet::Markdown.new(decoration_renderer)

    rendered = decorated.render(@html)
    rendered
  end

  def encode(html)
    HTMLEntities.new.encode(html)
  end



  class DecorationRenderer < Redcarpet::Render::HTML
    def strikethrough(text)
      %(<s>#{encode(text)}</s>)
      # text.gsub!(/- ([^-]*) -/) { %(<s>#{text}</s>) }
    end
  end
end