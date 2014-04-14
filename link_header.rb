class LinkHeader
  attr_accessor :links

  def self.parse(link_string)
    links = link_string.split(', ').map(&:strip)

    attr_pair = links.map { |link| link.match(/page=(\d).*rel=\"(.*)\"/)[1..-1].reverse }

    new(attr_pair)
  end

  def initialize(attr_pair)
    @links =  []
    @links += attr_pair
  end

  def <<(link)
    links << link
  end

  def to_h
    Hash[links]
  end

  def [](rel)
    to_h[rel.to_s]
  end
end
