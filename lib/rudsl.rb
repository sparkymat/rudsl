require "rudsl/version"

module Rudsl
  Nodes = %w(a abbr acronym address applet area article aside audio b base basefont bdi bdo big blockquote body br button canvas caption center cite code col colgroup datalist dd del details dfn dialog dir div dl dt em embed fieldset figcaption figure font footer form frame frameset h1 h2 h3 h4 h5 h6 head header hr html i iframe img input ins kbd keygen label legend li link main map mark menu menuitem meta meter nav noframes noscript object ol optgroup option output p param pre progress q rp rt ruby s samp script section select small source span strike strong style sub summary sup table tbody td textarea tfoot th thead time title tr track tt u ul var video wbr)

  Nodes.each do |n|
    module_eval do 
      define_method(n) do |*attributes, &block|
        node = Node.new(n)
        attrs = attributes.last.is_a?(Hash) ? attributes.last : {}
        text = attributes.first.is_a?(String) ? attributes.first : nil
        node.text = text
        node.attributes = attrs

        @_node_stack ||= []

        if !@_node_stack.last.nil?
          @_node_stack.last.children << node
        end

        if !block.nil?
          @_node_stack << node 
          block.call
          @_node_stack.pop
        end

        node
      end
    end
  end

  class Node
    attr_accessor :node_type
    attr_accessor :attributes
    attr_accessor :children
    attr_accessor :text

    def initialize(node_type)
      @node_type = node_type
      @attributes = {}
      @children = []
      @text = nil
    end

    def to_s
      "<#{@node_type}#{@attributes.to_a.count == 0 ? "" : " "}#{@attributes.to_a.map{|e| "#{e[0]}=\"#{e[1].is_a?(Array) ? e[1].join(" ") : e[1]}\""}.join(" ")}>" + @text.to_s + @children.map(&:to_s).join("") + "</#{@node_type}>"
    end

    def removeClass(classToRemove)
      if !attributes[:class].nil?
        attributes[:class].delete(classToRemove)
      end
    end

    def addClass(classToAdd)
      if attributes[:class].is_a?(String) || attributes[:class].is_a?(Symbol)
        attributes[:class] = [attributes[:class].to_s]
      end
      attributes[:class] ||= []
      attributes[:class] << classToAdd.to_s
      attributes[:class].uniq!
    end
  end
end
