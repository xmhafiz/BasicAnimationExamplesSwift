//
//  BottomButtonView.swift
//  BasicAnimationExample
//
//  Created by Mohd Hafiz on 03/12/2022.
//

import UIKit

class BottomButtonView: UIStackView {
    lazy var playButton: UIButton = {
        let button = UIButton()
        button.setTitle("Play", for: .normal)
        button.backgroundColor = .systemTeal
        button.setTitleColor(.white, for: .normal)
        return button
    }()
    
    lazy var resetButton: UIButton = {
        let button = UIButton()
        button.setTitle("Reset", for: .normal)
        button.backgroundColor = .gray
        button.setTitleColor(.white, for: .normal)
        return button
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setup() {
        axis = .horizontal
        playButton.setSize(height: 50)
        resetButton.setSize(height: 50)
        distribution = .fillEqually
        addArrangedSubview(playButton)
        addArrangedSubview(resetButton)
    }
}
