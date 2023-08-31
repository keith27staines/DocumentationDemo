//
//  StaffMember.swift
//  DocumentationTestTests
//
//  Created by Keith Staines on 31/08/2023.
//

import Foundation

/// A paid member of the club (as opposed to a fan who is a paying member of the club)
struct StaffMember: Identifiable {
    
    /// tests for equality of two staff members by checking the staff uuid
    static func == (lhs: StaffMember, rhs: StaffMember) -> Bool {
        lhs.id == rhs.id
    }
    
    /// The unique identifier of the staff member
    let id: UUID
    
    /// The registered full name of person
    var name: String
    
    /// The person's nickname as used by fans
    var nickname: String
    
    /// Date the person joined the club
    var joiningDate: Date
    
    /// The role of the person in the club
    var role: Role
    
    /// Describes the role a member of team can have
    enum Role: Equatable {
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
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
}
