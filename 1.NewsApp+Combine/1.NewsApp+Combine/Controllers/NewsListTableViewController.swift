//
//  NewsListTableViewController.swift
//  1.NewsApp+Combine
//
//  Created by Jeongwan Kim on 2022/07/24.
//

import UIKit

import Combine

class NewsListTableViewController: UITableViewController {
    
    // MARK: Properties
    var newsListVM = NewsListViewModel()
    
    var subscriptions = Set<AnyCancellable>()
        
    // MARK: LifeCycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    
        newsListVM.fetchNews()
        newsListVM.$articles.receive(on: RunLoop.main).sink { [weak self] _ in
            self?.tableView.reloadData()
        }.store(in: &subscriptions)
    }
    
    private func setup() {
        self.navigationController?.navigationBar.prefersLargeTitles = true
    }
}

extension NewsListTableViewController {
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    
    }
}

// UITableViewDataSource

extension NewsListTableViewController {
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return newsListVM.articles.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "ArticleListViewCell", for: indexPath) as? ArticleListViewCell else { return UITableViewCell() }
        cell.titleLabel?.text = self.newsListVM.articles[indexPath.row].title
        return cell
    }
    
}
