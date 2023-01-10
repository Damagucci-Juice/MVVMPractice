//
//  ViewController.swift
//  GoodNews
//
//  Created by YEONGJIN JANG on 2023/01/10.
//

import UIKit

class NewsListTableViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }

    private func setup() {
        self.navigationController?.navigationBar.prefersLargeTitles = true
    }
}

