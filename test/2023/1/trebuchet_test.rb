require 'test_helper'
require '2023/1/trebuchet'

class TrebuchetTest < Minitest::Test
  def test_trebuchet_returns_correct_sum_for_numericals
    dummy_file = create_dummy_file(file_contents_1)

    assert_equal 142, Trebuchet.new(dummy_file.path).result
  end
  def test_trebuchet_returns_correct_sum_for_alphabeticals
    dummy_file = create_dummy_file(file_contents_2)

    assert_equal 281, Trebuchet.new(dummy_file.path).result
  end

  private

  def create_dummy_file(content)
    file = Tempfile.new('dummy_file')
    file.puts content
    file.rewind
    file
  end

  def file_contents_1
    <<~TXT_STRING
      1abc2
      pqr3stu8vwx
      a1b2c3d4e5f
      treb7uchet
    TXT_STRING
  end

  def file_contents_2
    <<~TXT_STRING
      two1nine
      eightwothree
      abcone2threexyz
      xtwone3four
      4nineeightseven2
      zoneight234
      7pqrstsixteen
    TXT_STRING
  end
end