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

# Example

links_header_string = '<https://api.github.com/user/repos?page=4&per_page=100>; rel="next", <https://api.github.com/user/repos?page=50&per_page=100>; rel="last", <https://api.github.com/user/repos?page=1&per_page=100>; rel="first", <https://api.github.com/user/repos?page=2&per_page=100>; rel="prev"'

links = LinkHeader.parse(links_header_string)

p links.to_h
