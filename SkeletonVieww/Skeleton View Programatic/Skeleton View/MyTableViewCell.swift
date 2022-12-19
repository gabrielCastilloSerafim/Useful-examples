//
//  MyTableViewCell.swift
//  Skeleton View
//
//  Created by Gabriel Castillo Serafim on 12/12/22.
//

import UIKit
import SkeletonView

class MyTableViewCell: UITableViewCell {

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        isSkeletonable = true
        
        personImage.isSkeletonable = true
        
        nameLabel.isSkeletonable = true
        nameLabel.linesCornerRadius = 8
        emailLabel.isSkeletonable = true
        emailLabel.linesCornerRadius = 8
        
        setupContentView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    private func setupContentView() {
        
        contentView.addSubview(personImage)
        contentView.addSubview(nameLabel)
        contentView.addSubview(emailLabel)
        
        setupConstraints()
    }
    
    private func setupConstraints() {
        
        //cell's contentView Constraints
        contentView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
        contentView.heightAnchor.constraint(equalToConstant: 80),
        contentView.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width)
        ])
        
        //imageView Contraints
        personImage.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            personImage.heightAnchor.constraint(equalToConstant: 50),
            personImage.widthAnchor.constraint(equalToConstant: 50),
            personImage.topAnchor.constraint(equalTo: contentView.topAnchor,constant: 15),
            personImage.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 10)
        ])

        
        //nameLabel Constraints
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            nameLabel.heightAnchor.constraint(equalToConstant: 15),
            nameLabel.widthAnchor.constraint(equalToConstant: 275),
            nameLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 20),
            nameLabel.leftAnchor.constraint(equalTo: personImage.rightAnchor, constant: 15)
        ])
        
        //emailLabel Constraints
        emailLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            emailLabel.heightAnchor.constraint(equalToConstant: 15),
            emailLabel.widthAnchor.constraint(equalToConstant: 250),
            emailLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 45),
            emailLabel.leftAnchor.constraint(equalTo: personImage.rightAnchor, constant: 15)
        ])
    }
    
    
    var personImage: UIImageView = {
       
        let imageView = UIImageView()
        imageView.image = UIImage(systemName: "person")
        imageView.contentMode = .scaleAspectFit
        imageView.layer.cornerRadius = 25
        imageView.layer.masksToBounds = true
        
        return imageView
    }()
    
    var nameLabel: UILabel = {
       
        let label = UILabel()
        label.text = "Gabriel Castillo"
        label.font = UIFont.systemFont(ofSize: 15, weight: .medium)
        
        return label
    }()
    
    var emailLabel: UILabel = {
       
        let label = UILabel()
        label.text = "g.castillo@gmail.com"
        label.font = UIFont.systemFont(ofSize: 12, weight: .regular)
        
        return label
    }()
    
}
