require 'httparty'

module UsernameCheck
  SITES = {
    :twitter => 'twitter.com/',
    :github => 'github.com/',
    :flickr => 'flickr.com/photos/',
    :lastfm => 'last.fm/user/',
    :blogspot => '%s.blogspot.com',
    '%s.com' => ['%s.com', :whois],
    '%s.net' => ['%s.net', :whois],
    '%s.org' => ['%s.org', :whois],
    :delicious => 'delicious.com/',
    :friendfeed => 'friendfeed.com/',
    "friendfeed room" => 'friendfeed.com/rooms/',
    :hulu => 'hulu.com/profiles/',
    :disqus => 'disqus.com/people/',
    :linkedin => ['www.linkedin.com/in/', :match, 'contact settings'],
    :stumbleupon => ['stumbleupon.com/stumbler/', :not_match, 'no such username']
  }
  
  def self.check_all(name)
    SITES.inject({}) do |memo, site_and_options|
      site, address, condition, *args = site_and_options.flatten
      condition ||= :is_200
      rendered_address = 
        if address.include?('%s')
          address % name
        else
          address + name
        end
        
      memo[site.to_s % name] = send(condition, rendered_address, *args)
      memo
    end
  end

  def self.get(address)
    puts "getting #{address}"
    HTTParty.get("http://#{address}")
  end
  
  def self.is_200(address)
    begin
      get(address).code.to_i == 200
    rescue
    end
  end
  
  def self.match(address, regexp)
    !!(get(address).body =~ regexify(regexp))
  end

  def self.not_match(address, regexp)
    !(get(address).body =~ regexify(regexp))
  end

  def self.regexify(regexp)
    if regexp.is_a?(Regexp)
      regexp
    else
      Regexp.new(regexp, true)
    end
  end
  
  def self.whois(domain)
    # FIXME: seems to be broken on .org
    `whois #{domain.inspect} | head -n 10 | grep "No match for" || echo 1`.chomp == '1'
  end
end