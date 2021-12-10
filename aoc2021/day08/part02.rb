module AoC2021
  module Day08
    class Part02 < ::Puzzle
      def execute
        outputs = input.map do |digit_group|
          segment_number = {
            1 => '',
            2 => '',
            3 => '',
            4 => '',
            5 => '',
            6 => '',
            7 => '',
            8 => '',
            9 => '',
            0 => ''
          }

          numbers, result = digit_group.split('|').map(&:split)

          # array_pos  = segment_number
          # numbers[0] = 1
          # numbers[1] = 7
          # numbers[2] = 4
          # numbers[3..8] = ?
          # numbers[9] = 8
          numbers.sort! { |a, b| a.length <=> b.length }

          segment_number[1] = numbers[0]
          segment_number[7] = numbers[1]
          segment_number[4] = numbers[2]
          segment_number[8] = numbers[9]

          segment_number[6] = numbers[6..9].find do |segment|
                                !(segment.include?(segment_number[1].split('')[0]) && segment.include?(segment_number[1].split('')[1]))
                              end

          c_segment = segment_number[8].split('') - segment_number[6].split('')

          segment_number[5] = numbers[3..5].find do |segment|
                                !(segment.include?(c_segment[0]))
                              end

          segment_number[3] = numbers[3..5].find do |segment|
                                segment != segment_number[5] && (segment.include?(segment_number[1].split('')[0]) && segment.include?(segment_number[1].split('')[1]))
                              end
          
          segment_number[2] = numbers[3..5].find do |segment|
                                segment != segment_number[5] && segment != segment_number[3]
                              end

          segment_number[9] = numbers[6..9].find do |segment|
                                segment != segment_number[6] && (segment_number[5].split('').sort & segment.split('').sort) == segment_number[5].split('').sort  
                              end
          
          segment_number[0] = (numbers - segment_number.values.reject(&:empty?))[0]

          result_numbers = segment_number.map { |k,v| [k, v.split('').sort.join('')]}.to_h.invert

          result.map do |new_number|
            result_numbers[new_number.split('').sort.join('')].to_s
          end
        end

        @answer = outputs.map(&:join).map(&:to_i).sum
      end
    end
  end
end