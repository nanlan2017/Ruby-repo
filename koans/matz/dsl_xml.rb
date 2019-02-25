class XML
  def initialize(out)
    @out = out
  end

  def content(text)
    @out << text.to_s
    nil
  end

  def comment(text)
    @out << "<!-- #{text} -->"
  end

  def tag(tagname, attributes = {}, &block)
    @out << "<#{tagname}"
    attributes.each {|attr, value| @out << " #{attr}='#{value}' "}

    if block_given?
      # this block has content
      @out << '>'
      content = yield
      if content
        @out << content.to_s
      end
      @out << "</#{tagname}>" # close the tag
    else
      @out << '/>'
    end

    nil
  end

  # 一个找不到的method名，会被当做tag name
  alias method_missing tag

  def self.generate(out,&block)
    XML.new(out).instance_eval(&block)
  end

end