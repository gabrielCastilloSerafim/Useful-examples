
import UIKit
import SkeletonView

class ViewController: UIViewController {
    
    let tableView = UITableView()
    
    var mockData = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        
        tableView.rowHeight = 80
        tableView.register(MyTableViewCell.self, forCellReuseIdentifier: "cell")
        tableView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(tableView)
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            tableView.leftAnchor.constraint(equalTo: view.leftAnchor),
            tableView.rightAnchor.constraint(equalTo: view.rightAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
        
        tableView.dataSource = self
        tableView.isSkeletonable = true
        tableView.showAnimatedGradientSkeleton()
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 3) { [weak self] in
            
            for _ in 0...15 {
                self?.mockData.append("Gabriel Castillo Serafim")
            }
            self?.tableView.hideSkeleton(reloadDataAfter: true, transition: .crossDissolve(0.5))
        }
        
    }
    
    
}

extension ViewController: SkeletonTableViewDataSource {
    
    func collectionSkeletonView(_ skeletonView: UITableView, cellIdentifierForRowAt indexPath: IndexPath) -> ReusableCellIdentifier {
        return "cell"
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return mockData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! MyTableViewCell
        
        let name = mockData[indexPath.row]
        
        cell.nameLabel.text = "\(name) \(indexPath.row)"
        
        return cell
    }
    
    
    
    
}
