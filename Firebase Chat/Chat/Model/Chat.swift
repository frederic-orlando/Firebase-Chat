//
//  Chat.swift
//  Firebase Chat
//
//  Created by Frederic Orlando on 16/06/20.
//  Copyright © 2020 Frederic Orlando. All rights reserved.
//

import Foundation
import UIKit

struct Chat {
    
    var users: [String]
    
    var dictionary: [String: Any] {
        return [
            "users": users
        ]
    }
}

extension Chat {
    
    init?(dictionary: [String:Any]) {
        guard let chatUsers = dictionary["users"] as? [String] else {return nil}
        self.init(users: chatUsers)
    }
    
}
