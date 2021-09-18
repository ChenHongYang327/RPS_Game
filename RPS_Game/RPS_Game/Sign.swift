

import Foundation

enum Sign: String {
    case rock = "👊", paper = "✋️", scissors = "✌️" ,error
    
    
    func compare(computerSign: Sign) -> GameState{
        
        if self == computerSign {
            return GameState.draw
        }
        
        switch self {
        case .scissors:
            if computerSign == .rock{
                return GameState.lose
            }
            
        case .rock:
            if computerSign == .paper{
                return GameState.lose
            }
            
        case .paper:
            if computerSign == .scissors {
                return GameState.lose
            }
            
        case .error:
            return GameState.draw
        }
        
        return GameState.win
    }
}
