//
//  ViewController.swift
//  BasicAnimationExample
//
//  Created by Mohd Hafiz on 16/11/2022.
//

import UIKit

class ViewController: UIViewController {
    enum AnimationTypes: String, CaseIterable {
        case movement
        case resizing
        case fading
        case rotation
        case bouncing
    }
    let cellIdentifier = "Cell"
    lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(
            UITableViewCell.self,
            forCellReuseIdentifier: cellIdentifier
        )
        tableView.rowHeight = 54
        return tableView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Basic Animations"
        view.addSubview(tableView)
        tableView.fillSuperview()
    }
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return AnimationTypes.allCases.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let title = AnimationTypes.allCases[indexPath.row]
        let cell = UITableViewCell(style: .default, reuseIdentifier: cellIdentifier)
        cell.accessoryType = .disclosureIndicator
        cell.textLabel?.text = title.rawValue.capitalized
        return cell
    }
}

