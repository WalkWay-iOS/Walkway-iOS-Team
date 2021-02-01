//
//  Extensions+UIScrollView.swift
//  Walkway_iOS
//
//  Created by SHIN YOON AH on 2021/01/26.
//

import Foundation
import UIKit

public enum ScrollDirection {
    case top
    case center
    case bottom
}

public extension UIScrollView {
    func scroll(to direction: ScrollDirection) {
        DispatchQueue.main.async {
            switch direction {
            case .top:
                self.scrollToTop()
            case .center:
                self.scrollToCenter()
            case .bottom:
                self.scrollToBottom()
            }
        }
    }

    private func scrollToTop() {
        let topOffset = CGPoint(x: 0, y: (contentSize.height - bounds.size.height) / 3)
        setContentOffset(topOffset, animated: true)
    }

    private func scrollToCenter() {
        let centerOffset = CGPoint(x: 0, y: (contentSize.height - bounds.size.height) / 1.5)
        setContentOffset(centerOffset, animated: true)
    }

    private func scrollToBottom() {
        let bottomOffset = CGPoint(x: 0, y: contentSize.height - bounds.size.height + contentInset.bottom)
        if(bottomOffset.y > 0) {
            setContentOffset(bottomOffset, animated: true)
        }
    }
}
