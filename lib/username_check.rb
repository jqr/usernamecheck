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
    :stumbleupon => ['stumbleupon.com/stumbler/', :not_match, 'no such username'],
    :soundcloud => 'soundcloud.com/',
  }
  
  def self.check_all(name)
    memo_mutex = Mutex.new
    memo = {}
    threads = []
    SITES.each do |site_and_options|
      threads << Thread.new do
        site, address, condition, *args = site_and_options.flatten
        condition ||= :is_200
        rendered_address = 
          if address.include?('%s')
            address % name
          else
            address + name
          end
      
      
        service = site.to_s % name
        in_use = send(condition, rendered_address, *args)
        memo_mutex.synchronize do
          yield(service, in_use) if block_given?
          memo[service] = in_use
        end
      end
    end
    threads.each { |t| t.join }
    memo
  end

  def self.get(address)
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