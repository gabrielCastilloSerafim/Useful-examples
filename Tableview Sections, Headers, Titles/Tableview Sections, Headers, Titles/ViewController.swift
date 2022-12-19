//
//  ViewController.swift
//  Tableview Sections, Headers, Titles
//
//  Created by Gabriel Castillo Serafim on 11/12/22.
//

import UIKit

class ViewController: UIViewController {
    
    let _view = View()
    
    override func loadView() {
        super.loadView()
        
        view = _view
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        _view.tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        _view.tableView.dataSource = self
        _view.tableView.delegate = self
    }
    
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        cell.textLabel?.text = "Section: \(indexPath) | Row: \(indexPath.row)"
        
        return cell
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 10
    }
    
    //MARK: - This commented out method gives the title for each sections's header in the default IOS configuration "As a simple label"
//    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
//        return "Section Title: \(section)"
//    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        //Since this function returns an optional UIView we can specify a number of section to return nil and let the section with no title for example:
        if section == 3 {
            return nil
        }
        
        let header = UIView(frame: CGRect(x: 0, y: 0, width: _view.frame.size.width, height: 100))
        header.backgroundColor = .systemGray
        
        let label = UILabel()
        label.text = "Custom section header: \(section)"
        label.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        header.addSubview(label)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.leftAnchor.constraint(equalTo: header.leftAnchor, constant: 20).isActive = true
        label.topAnchor.constraint(equalTo: header.topAnchor, constant: 20).isActive = true
        
        return header
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        
        return 80
    }
    
}
