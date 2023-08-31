//
//  Team.swift
//  DocumentationTestTests
//
//  Created by Keith Staines on 31/08/2023.
//

import Foundation

/// A model representing a football club
///
/// FootballClubs compete against other clubs in football competitions.
struct FootballClub {

    /// The official name of the club, e.g "Nottingham Forest FC"
    var name: String
    
    ///  The nickname of the club as most used by fans, e.g, "Forest"
    var nickname: String
    
    /// Every fan's favourite place to be on a Saturday afternoon
    var homeGround: String
    
    /// Returns all the people who work at the club
    var staff = Set<StaffMember>()
    
    /// Returns the subset of staff who are ``Player``s
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

    /// Returns the club's manager, if the role is filled, otherwise nil
    var manager: StaffMember? {
        staff.first { staff in staff.role == .manager }
    }
    
    /// Returns the club's trainer, if the role is filled, is the ``Staff`` member who trains the players, otherwise nil
    var trainer: StaffMember? {
        staff.first { staff in staff.role == .trainer }
    }
    
    /// Returns the club's physio, if the role is filled, is the ``Staff``member who helps players recover from injuries, otherwise nil
    var physio: StaffMember? {
        staff.first { staff in staff.role == .physio }
    }
    
    /// Returns the club's captain, if the role is filled, is the ``Staff`` member and ``Player`` who shouts at other players on the field in an aggressive as possible manner,, otherwise nil
    var captain: Player? {
        players.first { player in player.isCaptain }
    }

}
