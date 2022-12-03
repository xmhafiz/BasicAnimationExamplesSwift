//
//  BoxView.swift
//  BasicAnimationExample
//
//  Created by Mohd Hafiz on 03/12/2022.
//

import UIKit

struct Constant {
    static let boxSize = CGSize(width: 120, height: 120)
    static let spacing: CGFloat = 16
}

class BoxView: UIView {
    static let size = CGSize(width: 120, height: 120)
    
    private lazy var label: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.textAlignment = .center
        return label
    }()
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setup() {
        addSubview(label)
        label.fillSuperview()
        // using sugar function to set box size constraints
        let size = Constant.boxSize
        label.setSize(width: size.width, height: size.height)
    }

    func setTitle(_ text: String) {
        label.text = text
    }

    func darkTitle() {
        label.textColor = .black
    }
}
