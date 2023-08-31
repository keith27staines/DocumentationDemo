//
//  Player.swift
//  DocumentationTestTests
//
//  Created by Keith Staines on 31/08/2023.
//

/// Players are the staff members of the club who actually take to the field
public struct Player {
    public var staffId: UUID
    
    /// Returns `true` if this player is officially responsible for shouting at other players when they make  mistakes, otherwise false
    public var isCaptain: Bool
    
    /// The name of the player as displayed on their shirt
    public var shirtName: String
    
    /// The number of the player as displayed on their shirt
    public var shirtNumber: Int
    
    /// The player's usual starting position on the field
    public var position: PlayerPosition
    
    /// Describes the position a player normally assumes on the field
    public enum PlayerPosition: Equatable {
        public enum Lane {
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
    public func hash(into hasher: inout Hasher) {
        hasher.combine(staffId)
    }
}


