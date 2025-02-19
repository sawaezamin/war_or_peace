require './lib/card'
require './lib/deck'


RSpec.describe Deck do

  describe '#initialize' do

    it 'is an instance of deck' do
      card1 = Card.new(:diamond, "Queen", 12)
      card2 = Card.new(:spade, "3", 3)
      card3 = Card.new(:heart, "Ace", 14)
      cards = [card1, card2, card3]

      deck = Deck.new(cards)
      expect(deck).to be_an_instance_of(Deck)
    end

    it 'is a deck of cards' do
      card1 = Card.new(:diamond, "Queen", 12)
      card2 = Card.new(:spade, "3", 3)
      card3 = Card.new(:heart, "Ace", 14)
      cards = [card1, card2, card3]

      deck = Deck.new(cards)
      expect(deck.cards).to eq(cards)
    end

    it 'cards have different ranks' do
      card1 = Card.new(:diamond, "Queen", 12)
      card2 = Card.new(:spade, "3", 3)
      card3 = Card.new(:heart, "Ace", 14)
      cards = [card1, card2, card3]

      deck = Deck.new(cards)
      expect(deck.rank_of_card_at(0)).to eq(12)
      expect(deck.rank_of_card_at(2)).to eq(14)
    end

    it 'has high ranked cards' do
      card1 = Card.new(:diamond, "Queen", 12)
      card2 = Card.new(:spade, "3", 3)
      card3 = Card.new(:heart, "Ace", 14)
      cards = [card1, card2, card3]

      deck = Deck.new(cards)
      expect(deck.high_ranking_cards).to eq([card1, card3])
    end

    it 'has a high ranking percentage' do
      card1 = Card.new(:diamond, "Queen", 12)
      card2 = Card.new(:spade, "3", 3)
      card3 = Card.new(:heart, "Ace", 14)
      cards = [card1, card2, card3]

      deck = Deck.new(cards)
      expect(deck.percent_high_ranking).to eq(66.67)
    end

    it 'can remove cards' do
      card1 = Card.new(:diamond, "Queen", 12)
      card2 = Card.new(:spade, "3", 3)
      card3 = Card.new(:heart, "Ace", 14)
      cards = [card1, card2, card3]

      deck = Deck.new(cards)
      deck.remove_card
      expect(deck.remove_card).to eq(card1)
      expect(deck.cards).to eq([card2, card3])
    end

    it 'can add cards' do
      card2 = Card.new(:spade, "3", 3)
      card3 = Card.new(:heart, "Ace", 14)
      cards = [card2, card3]

      card4 = Card.new(:club, '5', 5)

      deck = Deck.new(cards)
      deck.add_card(card4)
      expect(deck.cards).to eq([card2, card3, card4])
    end
  end
end
