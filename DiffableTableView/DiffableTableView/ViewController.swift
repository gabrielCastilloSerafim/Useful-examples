//
//  ViewController.swift
//  DiffableTableView
//
//  Created by Gabriel Castillo Serafim on 4/3/23.
//

import UIKit

class ViewController: UIViewController {
    
    //MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // View Setup
        view.addSubview(myTableView)
        myTableView.frame = view.bounds
        title = "My fruits"
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "plus"), style: .done, target: self, action: #selector(plusButtonPressed))
        
        // Configure the diffable datasource
        configureMyDataSource()
    }
    
    //MARK: - Models
    
    // Created a enum for the sections because the diffable datasource always takes two parameters a section and a object containing the data that we are going to use to populate the cell
    enum Section {
        case first
    }
    
    // Added a fruitId property because every object is meant to be different always, in case we try to add to dataSource a duplicate object the app will crash.
    struct Fruit: Hashable {
        let title: String
        let fruitId: Double = Date().timeIntervalSince1970
    }
    
    //MARK: - Properties
    
    var myDataSource: UITableViewDiffableDataSource<Section, Fruit>?
    var fruits = [Fruit]()
    
    //MARK: - UIProperties
    
    private lazy var myTableView: UITableView = {
       
        let tableView = UITableView()
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        tableView.delegate = self
        
        return tableView
    }()
    
    //MARK: - Methods
    
    // Configure the diffable datasource (This is the equivalent for the cell for row at index path function in tableViews with regular datasources)
    private func configureMyDataSource() {
        
        myDataSource = UITableViewDiffableDataSource(tableView: myTableView, cellProvider: { tableView, indexPath, model -> UITableViewCell? in
            
            let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
            cell.textLabel?.text = model.title
            
            return cell
        })
    }
    
    // Create, present and add selection action to action sheet
    @objc private func plusButtonPressed() {
        
        let actionSheet = UIAlertController(title: "Select fruit", message: nil, preferredStyle: .actionSheet)
        
        for x in 0...100 {
            actionSheet.addAction(UIAlertAction(title: "Fruit\(x+1)", style: .default, handler: { _ in
                
                let fruit = Fruit(title: "Fruit\(x+1)")
//                if self.fruits.contains(fruit) { return }
                self.fruits.append(fruit)
                self.updateDataSource()
            }))
        }
        
        actionSheet.addAction(UIAlertAction(title: "Cancel", style: .cancel))
        
        self.present(actionSheet, animated: true)
    }
    
    // Function used to update the dataSource by applying a snapshot
    private func updateDataSource() {
        
        var mySnapshot = NSDiffableDataSourceSnapshot<Section,Fruit>()
        mySnapshot.appendSections([.first])
        mySnapshot.appendItems(fruits)
        
        myDataSource?.apply(mySnapshot, animatingDifferences: true, completion: nil)
    }
}

//MARK: - UITableViewDelegate

extension ViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // Deselect row
        tableView.deselectRow(at: indexPath, animated: true)
        // Print selected row
        print(fruits[indexPath.row].title)
    }
    
}
