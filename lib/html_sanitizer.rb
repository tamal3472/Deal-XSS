require "nokogiri"

class HtmlSanitizer
  def self.custom_sanitize(html)
    doc = Nokogiri::HTML::DocumentFragment.parse(html)

    allowed_tags = %w[p br b i em strong u a img div]
    allowed_attributes = {
      "a" => %w[href title target rel],
      "img" => %w[src alt title width height]
    }

    doc.traverse do |node|
      if node.element?
        unless allowed_tags.include?(node.name)
          node.remove
          next
        end

        node.attribute_nodes.each do |attr|
          unless allowed_attributes.fetch(node.name, []).include?(attr.name)
            node.remove_attribute(attr.name)
          end

          if [ "href", "src" ].include?(attr.name)
            if attr.value =~ /\A\s*javascript:/i
              node.remove_attribute(attr.name)
            end
          end
        end
      end
    end

    doc.to_html
  end
end
