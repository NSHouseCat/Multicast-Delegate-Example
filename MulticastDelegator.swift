//
//  MulticastDelegator.swift
//  MulticastDelegate
//
//  Created by Andrew on 4/24/18.
//  Copyright © 2018 Andrew Nordahl. All rights reserved.
//

import Foundation

class MulticastDelegator {
    private var delegates = [MulticastDelegate]()
    
    func addDelegate(_ delegate: MulticastDelegate) {
        if !delegates.contains(where: { $0 === delegate }) {
            delegates.append(delegate)
        }
    }
    
    func removeDelegate(_ delegate: MulticastDelegate) {
        if let index = delegates.index(where: { $0 === delegate }) {
            delegates.remove(at: index)
        }
    }
    
    func notifyDelegates() {
        for delegate in delegates {
            delegate.eventHappened()
        }
    }
}

protocol MulticastDelegate: AnyObject {
    func eventHappened()
}
