//
//  SwitchTableViewCell.swift
//  DisplaySystemSettings
//
//  Created by Роман Назаров on 03.06.2022.
//

import UIKit

class SwitchTableViewCell: UITableViewCell {
    
    static let identifire = "SwitchTableViewCell"
    
    private let iconContainer: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.clipsToBounds = true
        view.layer.cornerRadius = 8
        return view
    }()
    
    private let iconImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.clipsToBounds = true
        imageView.tintColor = .white
        return imageView
    }()
    
    private let label: UILabel = {
        let label = UILabel()
        label.numberOfLines = 1
        label.font = UIFont.systemFont(ofSize: 17)
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let mySwitch: UISwitch = {
       let mySwitch = UISwitch()
        mySwitch.onTintColor = .green
        mySwitch.translatesAutoresizingMaskIntoConstraints = false
        return mySwitch
    }()
    
    private func setupHierarchy() {
        contentView.addSubview(label)
        contentView.addSubview(iconContainer)
        contentView.addSubview(mySwitch)
        iconContainer.addSubview(iconImageView)
        
        contentView.clipsToBounds = true
        accessoryType = .none
    }
    
    private func setupLayout() {
        
        NSLayoutConstraint.activate([
            iconContainer.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            iconContainer.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 15),
            iconContainer.widthAnchor.constraint(equalToConstant: 40),
            iconContainer.heightAnchor.constraint(equalToConstant: 40),
            
            iconImageView.centerYAnchor.constraint(equalTo: iconContainer.centerYAnchor),
            iconImageView.leadingAnchor.constraint(equalTo: iconContainer.leadingAnchor,constant: 3),
            iconImageView.widthAnchor.constraint(equalToConstant: 35),
            iconImageView.heightAnchor.constraint(equalToConstant: 35),
            
            label.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            label.leadingAnchor.constraint(equalTo: iconContainer.trailingAnchor, constant: 10),
            
            mySwitch.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            mySwitch.trailingAnchor.constraint(equalTo: contentView.trailingAnchor,constant: -15)
        ])
    }
    
    func configure(with settings: SettingsSwitchOptions) {
        label.text = settings.title
        iconImageView.image = settings.icon
        iconContainer.backgroundColor = settings.iconBackgroundColor
        mySwitch.isOn = settings.isOn
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupHierarchy()
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        iconImageView.image = nil
        label.text = nil
        iconContainer.backgroundColor = nil
        mySwitch.isOn = false
    }
}
