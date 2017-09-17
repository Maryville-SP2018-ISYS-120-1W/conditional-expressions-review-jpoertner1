import Darwin

public class DeckOfCards {
    let test = "butter"
    var deck = [Card]()
    
    public init() {
        fillDeck()
        shuffleDeck()
    }
    
    private func fillDeck() {
        let suitLabels = ["♠️", "♥️", "♣️", "♦️"]
        
        for suitValue in 1...4 {
            let isRedCard = suitValue % 2 == 0
            
            for cardValue in 2...14 {
                let cardLabel:String
                
                switch cardValue {
                case 11:
                    cardLabel = "J"
                case 12:
                    cardLabel = "Q"
                case 13:
                    cardLabel = "K"
                case 14:
                    cardLabel = "A"
                default:
                    cardLabel = String( cardValue)
                }
                
                deck.append( Card( cardValue: cardValue, cardLabel: cardLabel, suitValue: suitValue, suitLabel: suitLabels[suitValue - 1], isRedCard: isRedCard))
            }
        }
    }
    
    private func shuffleDeck( numberOfTimes:Int = 1000) {
        for _ in 1...numberOfTimes {
            let randomCardIndex = arc4random_uniform(52)
            let randomCard = deck.remove(at: Int(randomCardIndex))
            deck.append( randomCard )
        }
    }
    
    public func printDeck() {
        for card in deck {
            print( card )
        }
    }
    
    public func drawTopCard() -> Card {
        return deck.remove(at: 0)
    }
    
    public func isDeckEmpty() -> Bool {
        return deck.count == 0
    }
    
}
