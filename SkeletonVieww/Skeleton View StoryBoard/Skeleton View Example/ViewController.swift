//
//  ViewController.swift
//  Skeleton View Example
//
//  Created by Gabriel Castillo Serafim on 12/12/22.
//

import UIKit
import SkeletonView

class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    var data = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = self
        tableView.rowHeight = 80
        
        tableView.isSkeletonable = true
        tableView.showAnimatedGradientSkeleton(transition: .crossDissolve(0.25))
        
        for _ in 0...15 {
            data.append("Gabriel Castillo Serafim")
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
            self.tableView.hideSkeleton()
            
            self.tableView.reloadData()
        }
    }


}

//MARK: - SkeletonTableViewDataSource

extension ViewController: SkeletonTableViewDataSource {
    
    func collectionSkeletonView(_ skeletonView: UITableView, cellIdentifierForRowAt indexPath: IndexPath) -> ReusableCellIdentifier {
        return "cell"
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! MyTableViewCell
        
        let name = data[indexPath.row]
        
        cell.nameLabel.text = "\(name) \(indexPath.row)"
        
        return cell
    }
    
    
}
