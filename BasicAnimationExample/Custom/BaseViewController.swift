//
//  BaseViewController.swift
//  BasicAnimationExample
//
//  Created by Mohd Hafiz on 03/12/2022.
//

import UIKit

class BaseViewController: UIViewController {
    lazy var contentView = UIView()
    lazy var bottomButtonView = BottomButtonView()

    private lazy var stackView: UIStackView = {
        let view = UIStackView()
        view.axis = .vertical
        return view
    }()
    
    var handlePlayAction: (() -> Void)? = nil
    var handleResetAction: (() -> Void)? = nil

    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        setupAction()
    }

    private func setupView() {
        view.backgroundColor = .systemBackground
        view.addSubview(stackView)
        stackView.fillSuperview(isSafeArea: true)

        stackView.addArrangedSubview(contentView)
        stackView.addArrangedSubview(bottomButtonView)
    
        contentView.backgroundColor = .lightGray.withAlphaComponent(0.1)
    }
    
    private func setupAction() {
        bottomButtonView.playButton.addTarget(self, action: #selector(didTapPlay), for: .touchUpInside)
        bottomButtonView.resetButton.addTarget(self, action: #selector(didTapReset), for: .touchUpInside)
    }

    @objc private func didTapPlay() {
        handlePlayAction?()
    }

    @objc private func didTapReset() {
        handleResetAction?()
    }
}
