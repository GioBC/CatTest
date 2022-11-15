//
//  HomeViewController.swift
//  Cat Test
//
//  Created by Yermis Giovanny Beltrán Cuervo on 14/11/22.
//

import UIKit

class HomeViewController: UIViewController, Storyboarded {

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    var viewModel: HomeViewModel = HomeViewModel(api: CatAPI(httpClient: URLSessionHTTPClient()), imageLoader: ImageLoader())
    
    struct Constants {
        static let cellName = "TableViewCell"
        static let rowHeight: CGFloat = 290
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configTable()
        configViewModel()
        configSearchBar()
        viewModel.getCats()
    }
    
    func configSearchBar() {
        searchBar.delegate = self
    }
    
    func configViewModel() {
        activityIndicator.startAnimating()
        viewModel.onLoadData = {
            self.reloadData()
            self.activityIndicator.stopAnimating()
            self.activityIndicator.isHidden = true
        }
    }
    
    func configTable() {
        tableView.register(UINib(nibName: Constants.cellName, bundle: nil), forCellReuseIdentifier: Constants.cellName)
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.rowHeight = Constants.rowHeight
        tableView.tableFooterView = UIView()
        
    }
    
    private func reloadData() {
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
}

extension HomeViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        print(searchText)
        viewModel.searchText = searchText
        self.reloadData()
    }
}

extension HomeViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.filteredCatList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: Constants.cellName, for: indexPath) as? TableViewCell else {
            return UITableViewCell()
        }
        
        cell.configCell(viewModel: viewModel.filteredCatList[indexPath.row])
        return cell
    }
    
}

extension HomeViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let controller = DetailViewController(viewModel: viewModel.filteredCatList[indexPath.row])
        navigationController?.pushViewController(controller, animated: true)
    }
}
