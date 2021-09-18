
import Foundation

enum GameState {
    case win, lose, draw
    
    
    var state: String {
        switch self {
        case .win:
            return NSLocalizedString("won", comment: "")
        case .lose:
            return NSLocalizedString("lost", comment: "")
        case .draw:
            return NSLocalizedString("draw", comment: "")
        }
    }
    
}

