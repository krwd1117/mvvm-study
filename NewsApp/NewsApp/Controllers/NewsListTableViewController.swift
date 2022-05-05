//
//  NewsListTableViewController.swift
//  NewsApp
//
//  Created by Jeongwan Kim on 2022/05/05.
//

import UIKit

class NewsListTableViewController: UITableViewController {
    
    private var articleListViewModel: ArticleListViewModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
    }
    
    private func configure() {
        self.navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.largeTitleDisplayMode = .always
        
        let url = URL(string: "https://newsapi.org/v2/top-headlines?country=kr&apiKey=73355104c2b14d0794fdc25cec9e5cd1")!
        WebService().getArticles(url: url) { articles in
            if let articles = articles {
                self.articleListViewModel = ArticleListViewModel(articles: articles)
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
            }
        }
    }
}


// MARK: - UITableViewDelegate
extension NewsListTableViewController {
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        guard let articleListViewModel = articleListViewModel else { return 0 }
        return articleListViewModel.numberOfSections
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let articleListViewModel = articleListViewModel else { return 0 }
        return articleListViewModel.numberOfRowsInSection(section)
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "ArticleTableViewCell", for: indexPath) as? ArticleTableViewCell else { return UITableViewCell() }
        guard let articleListViewModel = articleListViewModel else { return UITableViewCell()}
        
        let article = articleListViewModel.articleAtIndes(indexPath.row)
        
        cell.titleLabel?.text = article.title 
        cell.descriptionLabel?.text = article.description 
        
        return cell
    }
    
}
