//
//  ActionSheetViewModel.swift
//  TwitterClone
//
//  Created by Apurva Deshmukh on 6/24/20.
//  Copyright © 2020 Apurva Deshmukh. All rights reserved.
//

import Foundation

enum ActionSheetOptions {
    case follow(User)
    case unfollow(User)
    case report
    case delete
    
    var description: String {
        switch self {
        case .follow(let user): return "Follow @\(user.username)"
        case .unfollow(let user): return "Unfollow @\(user.username)"
        case .report: return "Report Tweet"
        case .delete: return "Delete Tweet"
        }
    }
}

struct ActionSheetViewModel {
    
    // MARK: - Properties
    
    private let user: User
    
    var options: [ActionSheetOptions] {
        var results = [ActionSheetOptions]()
        
        if user.isCurrentUser {
            results.append(.delete)
        } else {
            let followOption: ActionSheetOptions = user.isFollowed ? .unfollow(user) : .follow(user)
            results.append(followOption)
            results.append(.report)
        }
        
        return results
    }
    
    // MARK: - Lifecycle
    
    init(user: User) {
        self.user = user
    }
}
