# used for saving data

[1, 2, 3, 4, 5].inject {|memo, n| memo + n}

fruits = ['apple', 'banana', 'pear', 'orange']

longest = fruits.inject do |memo, fruit|
  if fruit.length > memo.length
    fruit
  else
    memo
  end
end

puts longest
