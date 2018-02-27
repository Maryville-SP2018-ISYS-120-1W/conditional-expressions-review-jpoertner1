// Initializing Points to 0
var firstPlayerPoints = 0
var secondPlayerPoints = 0

// Function that takes the two player's cards and decides what to do and how to assign points
func takeTurn( firstPlayerCard:Card, secondPlayerCard:Card ) {
   
/* --- 1. WRITE YOUR GAME CONDITIONS BELOW HERE --- */

    
    // Available properties of a Card instance can be accessed with the . operator, and they are
    //   - cardValue: Int from 2 to 14, where 14 is an Ace because it has highest value
    //      firstPlayerCard.cardValue
    //   - cardLabel: String of the number of leter you would see on the card like "K", which has cardValue of 13
    //   - suitValue: Int from 1 to 4, indicating a suit
    //   - suitLabel: String emoji for the suit: diamond, hearts, clubs or spades. Using Ctrl + Command + Space
    //      you can bring up the emoji entry, then compare the suitLabel to the emoji in a string like this:
    //      firstPlayerCard.suitLabel == "♣️"
    //   - isRedCard: Boolean that is true if the card is red (i.e., a heart or a diamond)
    //      firstPlayerCard.isRedCard
    
    
    if firstPlayerCard.cardValue > secondPlayerCard.cardValue  {
        firstPlayerPoints += 5
        print( "Player 1 had a \(firstPlayerCard)" )
    } else if secondPlayerCard.cardValue > firstPlayerCard.cardValue {
        secondPlayerPoints += 5
        print( "Player 2 had a \(secondPlayerCard)" )
    } else if firstPlayerCard.cardValue % 2 != 0 && firstPlayerCard.isRedCard {
        firstPlayerPoints += 20
        print( "Player 1 had a \(firstPlayerCard)" )
    } else if secondPlayerCard.cardValue >= 11 && !secondPlayerCard.isRedCard{
        secondPlayerPoints += 20
        print( "Player 2 had a \(secondPlayerCard)" )
    } else if firstPlayerCard.cardValue == 10 && secondPlayerCard.suitLabel == "♥️"{
        secondPlayerPoints += firstPlayerPoints / 2
        firstPlayerPoints -= firstPlayerPoints / 2
        print( "Player 1 had a \(firstPlayerCard)" )
        print( "Player 2 had a \(secondPlayerCard)" )
    } else if firstPlayerCard.cardValue == secondPlayerCard.cardValue {
        firstPlayerPoints -= 10
        secondPlayerPoints -= 10
        print( "Player 1 had a \(firstPlayerCard)" )
        print( "Player 2 had a \(secondPlayerCard)" )
    }
    
    
    
    
/* --- END YOUR GAME CONDITIONS --- */
    
}

// Function that starts and plays the game
func playGame() {
    // Initialize a deck of cards
    let deck = DeckOfCards()

    // While there are still cards in the deck
    while !deck.isDeckEmpty() {
        // Draw the top two cards for the player, and take a turn
        takeTurn( firstPlayerCard: deck.drawTopCard(), secondPlayerCard: deck.drawTopCard() )
    }
    
/* --- 2. WRITE YOUR WHO WON LOGIC BELOW HERE --- */
    
    
    
    print( "Player 1 Score: \(firstPlayerPoints)")
    print( "Player 2 Score: \(secondPlayerPoints)")
    
    if firstPlayerPoints > secondPlayerPoints {
        print( "The winner is:  Player 1")
    }else if firstPlayerPoints < secondPlayerPoints {
        print( "The winner is:  Player 2")
    }else {
        print( "It is a tie")
    }
    

    
    
    /* --- END YOUR WHO WON LOGIC --- */
}

// Call playGame to start the game running
playGame()






