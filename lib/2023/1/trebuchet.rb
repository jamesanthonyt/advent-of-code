
class Trebuchet
  NUMBERS = {
    'one' => 1,
    'two' => 2,
    'three' => 3,
    'four' => 4,
    'five' => 5,
    'six' => 6,
    'seven' => 7,
    'eight' => 8,
    'nine' => 9,
  }

  def initialize(file_path)
    @file_path = file_path
  end

  def calibrations
    File.readlines(file_path, chomp: true)
  end

  def extracted_values
    regex = Regexp.new(NUMBERS.keys.join('|') + '|\d')
    calibrations.map { |value| value.scan(regex) }
  end

  def values_as_integers
    extracted_values.map { |numbers| numbers.map { |number| NUMBERS[number] || number.to_i } }
  end

  def calibration_values
    values_as_integers.map { |value| [value.first, value.last].join.to_i }
  end

  def result
    calibration_values.sum
  end

  private

  attr_reader :file_path
end

puts Trebuchet.new(ARGV[0]).result if __FILE__ == $0 && ARGV[0]
