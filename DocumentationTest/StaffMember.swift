//
//  StaffMember.swift
//  DocumentationTestTests
//
//  Created by Keith Staines on 31/08/2023.
//

import Foundation

/// A model representing salaried members of the club (as opposed to fans who pay to be a member of the club)
///
///  Players, trainers, physios  and all club officials, including the manager, are members of staff, but fans are not.
public struct StaffMember: Identifiable {
    
    /// The unique identifier of the staff member
    public let id: UUID
    
    /// The registered full name of person
    public var name: String
    
    /// The person's nickname as used by fans
    public var nickname: String
    
    /// Date the person joined the club
    public var joiningDate: Date
    
    /// The ``Role`` of the person in the club
    public var role: Role
    
    /// Describes the role a member of team can have
    public enum Role: Equatable {
        /// "Da boss",  thinks he runs the show
        case manager
        
        /// The dude who really runs the show
        case trainer
        
        /// If you've got an injury, this dude will make it hurt more
        case physio
        
        /// Players are the overpaid and entitfled dudes who kick innocent round objects
        case player(Player)
    }
}

///  Add hashable conformance to StaffMember so they can be contained in a set
extension StaffMember: Hashable {
    public func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
}
