//
//  Player.swift
//  DocumentationTestTests
//
//  Created by Keith Staines on 31/08/2023.
//

/// Players are the staff members of the club who actually take to the field
struct Player {
    var staffId: UUID
    
    /// The player responsible for shouting at other players when they make a mistake
    var isCaptain: Bool
    
    /// The name of the player as displayed on their shirt
    var shirtName: String
    
    /// The number of the player as displayed on their shirt
    var shirtNumber: Int
    
    /// The player's usual starting position on the field
    var position: PlayerPosition
    
    /// Describes the position a player normally assumes on the field
    enum PlayerPosition: Equatable {
        enum Lane {
            case centre
            case left
            case right
        }
        /// Person with the big gloves who gets blamed for every goal conceded
        case goalkeeper
        
        /// Tall intimidating dude - don't mess
        case centreBack(Lane)
        
        /// Fast, tricksy dude
        case wingBack(Lane)
        
        /// Slow but tough - usually holding midfielders comit a lot of fouls
        case holdingMidfield(Lane)
        
        /// Usually very lazy and highly skilful
        case attackingMidfield(Lane)
        
        /// Forwards  take all the credit for everything
        case forward(Lane)
    }
}

/// Add hashable confirmance to Player to allow them to be contained in a Set
extension Player: Hashable {
    func hash(into hasher: inout Hasher) {
        hasher.combine(staffId)
    }
}


