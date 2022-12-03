//
//  MovementWithFrameViewController.swift
//  BasicAnimationExample
//
//  Created by Mohd Hafiz on 16/11/2022.
//

import UIKit

class MovementWithFrameViewController: BaseViewController {
    // MARK: - Constants
    let boxSize = Constant.boxSize
    let duration = 1.0

    // MARK: - UI
    lazy var redBox: BoxView = {
        let box = BoxView()
        box.backgroundColor = .red
        box.frame = CGRect(origin: .zero, size: boxSize)
        box.setTitle("\(box.frame.origin)")
        return box
    }()

    lazy var greenBox: BoxView = {
        let box = BoxView()
        box.backgroundColor = .green
        box.frame = CGRect(origin: greenBoxStartPoint, size: boxSize)
        box.setTitle("\(box.frame.origin)")
        box.darkTitle()
        return box
    }()

    // MARK: - Positions in CGPoint (start and end points)
    var redBoxStartPoint: CGPoint {
        return .zero
    }
    var redBoxEndPoint: CGPoint {
        // move to right (remember to subtract with box width because the (x,y) is at box top left
        let x = contentView.frame.width - boxSize.width
        let y: CGFloat = 0 // keeping the same (vertically not move)
        return CGPoint(x: x, y: y)
    }
    
    var greenBoxStartPoint: CGPoint {
        // get the most right origin of X then minus with box width
        let x = view.frame.width - boxSize.width
        return CGPoint(x: x, y: 0)
    }
    var greenBoxEndPoint: CGPoint {
        // same as starting point
        let x = contentView.frame.width - boxSize.width
        // move down (bottom right)
        let y = contentView.frame.height - boxSize.height
        return CGPoint(x: x, y: y)
    }

    // MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        contentView.addSubview(redBox)
        contentView.addSubview(greenBox)
        
        handlePlayAction = {
            self.moveRedToRight()
            self.moveGreenDown()
        }
        handleResetAction = {
            self.reset()
        }
    }

    func reset() {
        greenBox.frame.origin = greenBoxStartPoint
        redBox.frame.origin = redBoxStartPoint
    
        redBox.setTitle("\(redBox.frame.origin)")
        greenBox.setTitle("\(greenBox.frame.origin)")
    }

    @objc func moveRedToRight() {
        // make it dynamic as possible (no hardcoded)
        // get the most right origin of X then minus with box width
        let x = view.frame.width - boxSize.width
        // perform animation
        UIView.animate(withDuration: duration, delay: 0) {
            self.redBox.frame.origin.x = x
        } completion: { _ in
            // once completed, update the title to current position
            self.redBox.setTitle("\(self.redBox.frame.origin)")
        }
    }

    @objc func moveGreenDown() {
        // the left most point is x = 0
        UIView.animate(withDuration: duration, delay: 0) {
            self.greenBox.frame.origin = self.greenBoxEndPoint
        } completion: { _ in
            // once completed, update the title to current position
            self.greenBox.setTitle("\(self.greenBox.frame.origin)")
        }
    }
}
