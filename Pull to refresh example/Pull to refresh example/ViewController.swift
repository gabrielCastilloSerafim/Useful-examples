//
//  ViewController.swift
//  Pull to refresh example
//
//  Created by Gabriel Castillo Serafim on 19/12/22.
//

import UIKit

class ViewController: UIViewController {
    
    private let tableView = UITableView()
    
    private var tableDatasource = [String]()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(tableView)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.dataSource = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        
        tableView.refreshControl = UIRefreshControl()
        tableView.refreshControl?.addTarget(self, action: #selector(didPullToRefresh), for: .valueChanged)
        
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.topAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            tableView.rightAnchor.constraint(equalTo: view.rightAnchor),
            tableView.leftAnchor.constraint(equalTo: view.leftAnchor)
        ])
        
        fetchData()
    }
    
    @objc private func didPullToRefresh() {
        
        tableDatasource.removeAll()
        print("Started refreshing")
        fetchData()
    }


    private func fetchData() {
        
        guard let url = URL(string: "https://api.sunrise-sunset.org/json?date=2020-8-1&lgn=37.3230&lat=-122.0322&formatted=0") else {return}
        
        let task = URLSession.shared.dataTask(with: url) { [weak self] data, _, _ in
            
            guard let data = data else { return }
            
            let decoder = JSONDecoder()
            
            do {
                let data = try decoder.decode(Welcome.self, from: data)
                
                self?.tableDatasource.append(data.results.sunset)
                self?.tableDatasource.append(data.results.sunrise)
                self?.tableDatasource.append(String(data.results.day_length))
                
                DispatchQueue.main.async {
                    self?.tableView.refreshControl?.endRefreshing()
                    self?.tableView.reloadData()
                }
            } catch {
                print(error)
            }
        }
        task.resume()
    }
    
}

extension ViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tableDatasource.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        let object = tableDatasource[indexPath.row]
        
        cell.textLabel?.text = object
        
        return cell
    }
}

struct Welcome: Codable {
    let results: Results
    let status: String
}

struct Results: Codable {
    let sunrise, sunset, solar_noon: String
    let day_length: Int
    let civil_twilight_begin, civil_twilight_end, nautical_twilight_begin, nautical_twilight_end: String
    let astronomical_twilight_begin, astronomical_twilight_end: String
}
