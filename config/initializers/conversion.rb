Time::DATE_FORMATS.merge!(
    {
        :db => '%Y-%m-%d %H:%M:%S.%L',
        :rfc822 => lambda { |time| time.strftime("%a, %d %b %Y %H:%M:%S.%L #{time.formatted_offset(false)}") }
    }
)

class Time
  def to_ms_zone
    self.utc.strftime('%Y-%m-%d %H:%M:%S.%L %z')
  end

  def to_ms
    self.utc.strftime('%Y-%m-%d %H:%M:%S.%L')
  end

  def get_ms
    (self.usec/1000)
  end

  def self.parse_t s
    self.at(s.to_f).utc
  end

  def self.parse_msec s
    self.at(s.to_i/1000.0).utc
  end

  def to_13digital_f_str
    "#{self.to_i}.#{self.get_ms}"
  end

  def to_13digital_i_str
    "%d%03d" % [self.to_i, self.get_ms]
  end

  def to_13digital_f
    to_13digital_f_str().to_f
  end

  def to_13digital_i
    to_13digital_i_str().to_i
  end
end

