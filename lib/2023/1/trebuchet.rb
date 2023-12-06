
class Trebuchet
  def initialize(file_path)
    @file_path = file_path
  end

  def calibrations
    File.readlines(file_path, chomp: true)
  end

  def extracted_values
    calibrations.map { |value| value.scan(/\d/) }
  end

  def calibration_values
    extracted_values.map { |value| [value.first, value.last].join.to_i }
  end

  def result
    calibration_values.sum
  end

  private

  attr_reader :file_path
end

puts Trebuchet.new(ARGV[0]).result if __FILE__ == $0 && ARGV[0]
