//
//  CustomTableViewCell.swift
//  Expand Text Example
//
//  Created by Gabriel Castillo Serafim on 27/12/22.
//

import UIKit

//This protocol is adopted by the view controller and the delegate property on the cell class will be set to the view controller, this way the cell will be able to communicate to the view controller in order to run a function on the view controller to update the tableView's row hight whenever the more/Less button is tapped
protocol CustomTableCellDelegate {
    func moreButtonTapped()
}

class CustomTableViewCell: UITableViewCell {

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupContentView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    var delegate: CustomTableCellDelegate?
    var isExpanded = false
    
    private func setupContentView() {
        
        contentView.addSubview(largeTextLabel)
        contentView.addSubview(expandButton)
        expandButton.addTarget(self, action: #selector(expandButtonPressed), for: .touchUpInside)
        
        NSLayoutConstraint.activate([
            largeTextLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 20),
            largeTextLabel.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 10),
            largeTextLabel.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -10)
        ])
        
        NSLayoutConstraint.activate([
            expandButton.topAnchor.constraint(equalTo: largeTextLabel.bottomAnchor, constant: 5),
            expandButton.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -10),
            expandButton.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10)
        ])
        
    }
    
    var largeTextLabel: UILabel = {
       
        let label = UILabel()
        label.numberOfLines = 1
        label.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        label.text = "Text ñaosigfdhañoidfsghjñasdoifhgjñaoidfhgñodhsfgñosdfhgñodjhfgñkosdhjfñgoksjdhfñgkjlohdsñfgkjhsdñfgkjhdfghndfndfgn"
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    var expandButton: UIButton = {
       
        let button = UIButton()
        button.setTitle("More", for: .normal)
        button.setTitleColor(.lightGray, for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 12, weight: .bold)
        button.translatesAutoresizingMaskIntoConstraints = false
        
        return button
    }()
    
    @objc private func expandButtonPressed() {
        
        if isExpanded == true {
            largeTextLabel.numberOfLines = 1
            expandButton.setTitle("More", for: .normal)
        } else {
            largeTextLabel.numberOfLines = 0
            expandButton.setTitle("Less", for: .normal)
        }
        
        isExpanded = !isExpanded
        
        //This method will run in the delegate and reload the size of the tableView's row
        delegate?.moreButtonTapped()
    }
}
