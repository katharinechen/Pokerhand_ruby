require ('rspec')
require ('poker_hand')

describe ('poker_hand') do

  it ("should return high card") do
    poker_hand(['KH', 'JS', '10C', '6H','3D']).should(eq('High Card'))
  end

  it ("should return flush when all types are Hearts") do
    poker_hand(['KH', 'JH', '10H', '6H','3H']).should(eq('Flush'))
  end

  it ("should return flush when all types are Diamonds") do
    poker_hand(['KD', 'JD', '10D', '6D','3D']).should(eq('Flush'))
  end

  it ("should return three of a kind if only three values are the same") do
    poker_hand(['KH', 'KD', 'KS', '6D','3D']).should(eq('Three of a Kind'))
  end

  it ("should return four of a kind if only four values are the same") do
    poker_hand(['KH', 'KD', 'KS', 'KC','3D']).should(eq('Four of a Kind'))
  end

  it ("should return identify two cards of a matching rank, and three unrelated side cards as one pair") do
    poker_hand(['KH', 'KS', '8D', '6C', '7H']).should(eq('One Pair'))
  end

  it ("should return two cards of a matching rank, another two cards of a different matching rank, and one side card as two pair") do
    poker_hand(['KH', 'KS', '8D', '8C', '6H']).should(eq('Two Pair'))
  end

  it ("should return five cards in sequence as straight") do
    poker_hand(['1H', '2S', '3D', '4C', '5H']).should(eq('Straight'))
  end

end
