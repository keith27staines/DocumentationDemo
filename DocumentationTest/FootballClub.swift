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
public struct FootballClub {

    /// The official name of the club, e.g "Nottingham Forest FC"
    public var name: String
    
    ///  The nickname of the club as most used by fans, e.g, "Forest"
    public var nickname: String
    
    /// Every fan's favourite place to be on a Saturday afternoon
    public var homeGround: String
    
    /// Returns all the people who work at the club
    public var staff = Set<StaffMember>()
    
    /// Returns the subset of members of staff who play for the club.
    ///
    /// See  ``Player``
    public var players: Set<Player> {
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
    ///
    /// The manager is "Da boss!"
    public var manager: StaffMember? {
        staff.first { staff in staff.role == .manager }
    }
    
    /// Returns the club's trainer, if the role is filled, otherwise nil.
    ///
    /// The trainer  is the ``StaffMember`` who trains the players.
    public var trainer: StaffMember? {
        staff.first { staff in staff.role == .trainer }
    }
    
    /// Returns the club's physio, if the role is filled, otherwise `nil`.
    ///
    /// The physio is the ``StaffMember`` who helps players recover from injuries
    public var physio: StaffMember? {
        staff.first { staff in staff.role == .physio }
    }
    
    /// Returns the club's captain, if the role is filled, otherwise nil.
    ///
    /// The captian is a ``StaffMember`` member and the ``Player`` who shouts at other players on the field in an aggressive as possible manner.
    public var captain: Player? {
        players.first { player in player.isCaptain }
    }

}
