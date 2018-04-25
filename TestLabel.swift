//
//  TestView.swift
//  Multicast-Delegate-Example
//
//  Created by Andrew on 4/25/18.
//  Copyright © 2018 Andrew Nordahl. All rights reserved.
//

import UIKit

class TestLabel: UILabel {
    let semaphore = DispatchSemaphore(value: 1)
    override func awakeFromNib() {
        super.awakeFromNib()
        (UIApplication.shared.delegate as! AppDelegate).multicastDelegatorObject.addDelegate(self)
    }
}

extension TestLabel: MulticastDelegate {
    func eventHappened() {
        semaphore.wait()
        let initialLabel = self.text
        text = "  Delegate message received  "
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.0, execute: {
            self.text = initialLabel
            self.semaphore.signal()
        })
    }
}
