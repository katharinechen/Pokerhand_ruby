def straight_check(valueArray)

  status = true

  straightSort = valueArray.map do |value|
    if value == 'K'
      value = 13
    elsif value == 'Q'
      value = 12
    elsif value == 'J'
       value = 11
    elsif value == 'A'
       value = 14
     else
      value.to_i
    end
  end

  straightSort = straightSort.sort


  for i in 0..4
    if (straightSort[i].to_i) == straightSort[(i - 1)]
      status = false
    end
  end

  # index = 1
  # straightSort.each do |value|
  #   if value + 1 == straightSort[index]
  #     index = index+1
  #   else
  #     status = false
  #   end
  # end

  return status

end

puts straight_check([7,8,9,10,11])
puts straight_check([7,7,8,8,10])

def poker_hand(cards)

  valueArray = []
  typeArray = []
  countTypes = { "H" => 0, "S" => 0, "C" => 0, "D" => 0}
  valueTypes = { '2' => 0, '3' => 0, '4' => 0, '5' => 0,
                 '6' => 0, '7' => 0, '8' => 0, '9' => 0,
                 '10' => 0, 'J' => 0, 'Q' => 0, 'K' => 0,
                 'A' => 0 }

  cardsArray = cards.each { |x|
    valueArray << x[0..-2]
    typeArray << x[-1]
  }

  typeArray.each do |types|
    countTypes.each do | key, value |
      if types == key
        countTypes[key] = countTypes[key] + 1
      end
    end
  end

  valueArray.each do |value|
    valueTypes.each do |key, type|
      if value == key
        valueTypes[key] = valueTypes[key] + 1
      end
    end
  end

  case
  when countTypes.has_value?(5)
    return "Flush"
  when valueTypes.has_value?(4)
    return "Four of a Kind"
  when straight_check(Array)
    return "Straight"
  when valueTypes.has_value?(3)
    return "Three of a Kind"
  when valueTypes.has_value?(2)
    valueTypes.delete(valueTypes.key(2))
    if valueTypes.has_value?(2)
      return "Two Pair"
    else
      return "One Pair"
    end
  else
    return "High Card"
  end

end


puts poker_hand(['KH', 'KS', '8D', '8C', '6H'])



