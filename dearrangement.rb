#declare method to de arrange elements
def derangements_of_array(nums)
  return [nums] if nums.length == 1

  all_derangements = []
  nums.each_with_index do |current_num, index|
    remaining_nums = nums[0...index] + nums[(index+1)..-1]
    derangements_of_array(remaining_nums).each do |sub_derangement|
      all_derangements << [current_num] + sub_derangement unless sub_derangement[0] == current_num
    end
  end

  all_derangements
end

#find ith dearangement number
def find_ith_derangement_with_sort(n, i)
  nums = (1..n).to_a
  all_derangements = derangements_of_array(nums)
  sorted_derangements = all_derangements.sort
  sorted_ith_derangement = sorted_derangements[i - 1]
  sorted_ith_derangement.join
end

# Test cases
puts find_ith_derangement_with_sort(2, 1) # Output: 21
puts find_ith_derangement_with_sort(3, 2) # Output: 312
puts find_ith_derangement_with_sort(4, 5) # Output: 3412
