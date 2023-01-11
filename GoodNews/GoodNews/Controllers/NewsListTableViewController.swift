//
//  ViewController.swift
//  GoodNews
//
//  Created by YEONGJIN JANG on 2023/01/10.
//

import UIKit

class NewsListTableViewController: UITableViewController {

    private var articleListViewModel: ArticleListViewModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }

    private func setup() {
        self.navigationController?.navigationBar.prefersLargeTitles = true
        
        let url = URL(string: "https://newsapi.org/v2/top-headlines?country=us&apiKey=0c4d4b75321642f78aa273d2c23d021c")!
    
        let service = DefaultWebService()
        service.getArticles(url: url) { result in
            switch result {
            case .success(let articles):
                self.articleListViewModel = ArticleListViewModel(articles: articles)
            case .failure(_):
                print("error")
            }
            
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
        
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        self.articleListViewModel == nil ? 0 : articleListViewModel.numberOfSections
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        self.articleListViewModel.numberOfRowsInSection(section)
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: ArticleTableViewCell.reuseIdentifier, for: indexPath) as? ArticleTableViewCell else {
            fatalError("ArticleTableViewCell not found")
        }
        let articleVM = self.articleListViewModel.articleAtIndex(indexPath.row)
        cell.fill(articleVM)
        return cell
    }
}

