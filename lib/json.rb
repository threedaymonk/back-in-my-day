class JSON
  def self.load(str)
    new(str).parse_next
  end

  def initialize(str)
    @str = str
    @pos = 0
  end

  def parse_next
    skip_space
    case current
    when "{"
      advance
      parse_object
    when "["
      advance
      parse_array
    when '"'
      parse_string
    when /\d/
      parse_number
    else
      error "expected a data type"
    end
  end

  def error(message)
    raise "unexpected token at position #{@pos}: #{message}\n#{@str[@pos, 20]}"
  end

  def current
    @str[@pos, 1]
  end

  def advance
    @pos += 1
  end

  def space?(char)
    char =~ /[ \t\n\r]/
  end

  def skip_space
    while space?(current)
      advance
    end
  end

  def parse_string
    str = ""
    advance
    loop do
      if current == '"'
        advance
        return str
      else
        str << current
        advance
      end
    end
  end

  def parse_number
    str = ""
    while current =~ /[\d\.]/
      str << current
      advance
    end
    str.to_f
  end

  def parse_object
    obj = {}

    loop do
      skip_space
      case current
      when "}"
        advance
        return obj
      when '"'
        key = parse_string
        skip_space
        expect ":"
        skip_space
        value = parse_next
        obj[key] = value
        skip_space
        advance if current == ","
      else
        error "expected next key or end of object"
      end
    end
  end

  def parse_array
    ary = []

    loop do
      skip_space
      case current
      when "]"
        advance
        return ary
      when ","
        advance
      else
        ary << parse_next
      end
    end
  end

  def expect(*chars)
    chars.each do |char|
      if current == char
        advance
        return
      end
    end
    error "expected one of #{chars.join(", ")}"
  end
end
