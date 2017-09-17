import Foundation

public struct Card : CustomStringConvertible{
    public let cardValue:Int
    public let cardLabel:String
    public let suitValue:Int
    public let suitLabel:String
    public let isRedCard:Bool
    
    public var description:String {
        return cardLabel + suitLabel
    }
}
