module CacheBust
  def cache_bust(url)
    path, fragment = url.split('#', 2)
    busted = "#{path}?v=#{@context.registers[:site].time.to_i}"
    fragment ? "#{busted}##{fragment}" : busted
  end
end

Liquid::Template.register_filter(CacheBust)
