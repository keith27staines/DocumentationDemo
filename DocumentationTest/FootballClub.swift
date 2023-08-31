//
//  Team.swift
//  DocumentationTestTests
//
//  Created by Keith Staines on 31/08/2023.
//

import Foundation

/// FootballClubs compete against other clubs in football competitions.
struct FootballClub {

    /// The official name of the club, e.g "Nottingham Forest FC"
    var name: String
    
    ///  The nickname of the club as most used by fans, e.g, "Forest"
    var nickname: String
    
    /// Every fan's favourite place to be on a Saturday afternoon
    var homeGround: String
    
    /// All the people who work at the club
    var staff = Set<StaffMember>()
    
    /// The subset of staff who play for the club
    var players: Set<Player> {
        Set<Player>(
            staff.compactMap { staff in
                switch staff.role {
                case .player(let player):
                    return player
                default:
                    return nil
                }
            }
        )
    }

    /// The club's manager, if the role is filled, otherwise nil
    var manager: StaffMember? {
        staff.first { staff in staff.role == .manager }
    }
    
    /// The club's trainer, if the role is filled, otherwise nil
    var trainer: StaffMember? {
        staff.first { staff in staff.role == .trainer }
    }
    
    /// The club's physio, if the role is filled, otherwise nil
    var physio: StaffMember? {
        staff.first { staff in staff.role == .physio }
    }
    
    /// The club's captain, if the role is filled, otherwise nil
    var captain: Player? {
        players.first { player in player.isCaptain }
    }

}
