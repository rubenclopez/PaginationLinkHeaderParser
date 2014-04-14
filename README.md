PaginationLinkHeaderParser
==========================

This simple class will help you parse the pagination links stored in the headers of most modern APIs

# Example

```
links_header_string = '<https://api.github.com/user/repos?page=4&per_page=100>; rel="next", <https://api.github.com/user/repos?page=50&per_page=100>; rel="last", <https://api.github.com/user/repos?page=1&per_page=100>; rel="first", <https://api.github.com/user/repos?page=2&per_page=100>; rel="prev"'

links = LinkHeader.parse(links_header_string)

p links.to_h
=> {"next"=>"4", "last"=>"5", "first"=>"1", "prev"=>"2"}

links[:next] or links["next"]
=> "4"
```
