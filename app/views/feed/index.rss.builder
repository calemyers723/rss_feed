xml.instruct! :xml, :version => "1.0"
xml.feed xmlns: "http://www.w3.org/2005/Atom", "xmlns:idx" => 'urn:atom-extension:indexing' do
  xml.id "tag:google.com,2005:reader/user/08496812215877632442/state/com.google/alerts/15634174531034742166"
  xml.title "Google Alert - Litecoin"
  xml.description "This is a combined rss feed."

  @reddit_entries.each do |entry|
    xml.entry do
      xml.content Feed.get_reddit_link(entry), type: "html"
      xml.id entry.children[3].text
      xml.title entry.children[6].text, type: "html"
    end
  end

  @google_entries.each do |entry|
    xml.entry do
      xml.id entry.children[1].text
      xml.title CGI.unescapeHTML(entry.children[3].text), type: "html"
      xml.link Feed.get_google_link(entry), href: Feed.get_google_link(entry)
      # xml.content CGI.unescapeHTML(entry.children[11].text), type: "html"
      xml.content CGI.unescapeHTML(entry.children[11].text), type: "html"
    end
  end
end