require './lib/card'
require './lib/deck'
require './lib/player'

RSpec.describe Player do
  describe "Initialize" do
    it "Instance of player" do
      card1 = Card.new(:diamond, "Queen", 12)
      card2 = Card.new(:spade, "3", 3)
      card3 = Card.new(:heart, "Ace", 14)
      cards = [card1, card2, card3]

      deck = Deck.new(cards)
      player = Player.new("Clarisa", deck)
      expect(player).to be_an_instance_of(Player)
    end

    it "Player Name" do
      card1 = Card.new(:diamond, "Queen", 12)
      card2 = Card.new(:spade, "3", 3)
      card3 = Card.new(:heart, "Ace", 14)
      cards = [card1, card2, card3]

      deck = Deck.new(cards)
      player = Player.new("Clarisa", deck)
      expect(player.name)to eq("Clarisa")
    end

    it "Player Deck" do
      card1 = Card.new(:diamond, "Queen", 12)
      card2 = Card.new(:spade, "3", 3)
      card3 = Card.new(:heart, "Ace", 14)
      cards = [card1, card2, card3]

      deck = Deck.new(cards)
      player = Player.new("Clarisa", deck)
      expect(player.deck).to eq(deck)
    end

    it "Did player lose?" do
      card1 = Card.new(:diamond, "Queen", 12)
      card2 = Card.new(:spade, "3", 3)
      card3 = Card.new(:heart, "Ace", 14)
      cards = [card1, card2, card3]

      deck = Deck.new(cards)
      player = Player.new("Clarisa", deck)
      expect(player.has_lost?).to eq(false)
    end

    it "remove a card" do
      card1 = Card.new(:diamond, "Queen", 12)
      card2 = Card.new(:spade, "3", 3)
      card3 = Card.new(:heart, "Ace", 14)
      cards = [card1, card2, card3]

      deck = Deck.new(cards)
      player = Player.new("Clarisa", deck)

      player.deck.remove_card
      expect(player.deck.remove_card).to eq(card1)
      expect(player.has_lost?).to eq(false)
    end

    it "can remove another card" do
      card2 = Card.new(:spade, "3", 3)
      card3 = Card.new(:heart, "Ace", 14)
      cards = [card2, card3]

      deck = Deck.new(cards)
      player = Player.new("Clarisa", deck)

      player.deck.remove_card
      expect(player.deck.remove_card).to eq(card2)
      expect(player.has_lost?).to eq(false)
    end

    it "removing one more card" do
      card3 = Card.new(:heart, "Ace", 14)
      cards = [card3]

      deck = Deck.new(cards)
      player = Player.new("Clarisa", deck)

      player.deck.remove_card
      expect(player.deck.remove_card).to eq(card3)
      expect(player.has_lost?).to eq(true)
      expect(player.deck).to eq([])
    end
  end
end
