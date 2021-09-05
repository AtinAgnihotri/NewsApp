//
//  NewsListVC.swift
//  NewsApp
//
//  Created by Atin Agnihotri on 04/09/21.
//

import UIKit

class NewsListVC: UITableViewController {
    
    private let CELL_INDENTIFIER = "ArticleTableViewCell"
    private let INFO_DICT_API_KEY = "News API Key"
    private let INFO_DICT_URL_KEY = "Top News URL"
    
    private var loadingIndicator: UIBarButtonItem!
    private var loadingTimer: Timer!
    private var country: String  = "in"
    private var topNewsUrl: String {
        guard let endPoint = Bundle.main.object(forInfoDictionaryKey: INFO_DICT_URL_KEY) as? String else { return "" }
        guard let apiKey = Bundle.main.object(forInfoDictionaryKey: INFO_DICT_API_KEY) as? String else { return "" }
        let requestUrl = "\(endPoint)?country=\(country)&apiKey=\(apiKey)"
        return requestUrl
    }
    
    private var articleListVM: ArticleListVM!
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
    
    private func setup() {
        title = "News App"
        navigationController?.navigationBar.prefersLargeTitles = true
        loadDataFromAPI()
    }
    
    func loadDataFromAPI() {
        if let url = URL(string: topNewsUrl) {
            showLoadingText(true)
            WebService().getArticles(from: url) { [weak self] articles in
                if let articles = articles {
                    self?.articleListVM = ArticleListVM(articles: articles)
                    
                    DispatchQueue.main.async {
                        self?.showLoadingText(false)
                        self?.tableView.reloadData()
                    }
                }
            }
        }
    }
    
    func showLoadingText(_ show: Bool) {
        if show {
            loadingIndicator = UIBarButtonItem(title: "Loading", style: .done, target: nil, action: nil)
            loadingIndicator.tintColor = .white
            loadingTimer = Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(loadingAnimation), userInfo: nil, repeats: true)
            navigationItem.leftBarButtonItem = loadingIndicator
        } else {
            navigationItem.leftBarButtonItem = nil
            loadingTimer.invalidate()
            loadingTimer = nil
        }
    }
    
    @objc func loadingAnimation() {
        switch loadingIndicator.title {
            case "Loading":
                loadingIndicator.title = "Loading."
            case "Loading.":
                loadingIndicator.title = "Loading.."
            case "Loading..":
                loadingIndicator.title = "Loading..."
            default:
                loadingIndicator.title = "Loading"
        }
    }
    
    
    // MARK: Table View Data Source methods

    override func numberOfSections(in tableView: UITableView) -> Int {
        articleListVM == nil ? 0 : articleListVM.numberInSections
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        articleListVM == nil ? 0 : articleListVM.numberOfRowsInSection(section)
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: CELL_INDENTIFIER, for: indexPath) as? ArticleTableViewCell else {
            fatalError("Could not dequeue a ArticleTableViewCell")
        }
        
        let articleVM = articleListVM.articleAtIndex(indexPath.row)
        cell.titleLabel.text = articleVM.title
        cell.descriptionLabel.text = articleVM.description
        
        return cell
    }

}
