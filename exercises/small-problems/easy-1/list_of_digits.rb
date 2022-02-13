def digit_list(list)
  p list.to_s.split("").map(&:to_i)
end

puts digit_list(12345)
puts digit_list(7)
puts digit_list(375290)
puts digit_list(444)
