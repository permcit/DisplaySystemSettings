//
//  ViewController.swift
//  DisplaySystemSettings
//
//  Created by Роман Назаров on 03.06.2022.
//

import UIKit

struct Section {
    let title: String
    let options: [SettingOptionalType]
}

enum SettingOptionalType {
    case staticCell(type: SettingsOption)
    case switchCell(type: SettingsSwitchOptions)
}

struct SettingsOption {
    let title: String
    let icon: UIImage?
    let iconBackgroundColor: UIColor
}

struct SettingsSwitchOptions {
    let title: String
    let icon: UIImage?
    let iconBackgroundColor: UIColor
    var isOn: Bool
}

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var settings = [Section]()
    
    private lazy var tableView: UITableView = {
        let tableView = UITableView.init(frame: .zero, style: .grouped)
        tableView.backgroundColor = .white
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(SettingTableViewCell.self, forCellReuseIdentifier: SettingTableViewCell.identifire)
        tableView.register(SwitchTableViewCell.self, forCellReuseIdentifier: SwitchTableViewCell.identifire)
        return tableView
    }()
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
        view.backgroundColor = .white
        setupView()
        setupHierarcy()
        setupLayout()
    }
    
    // MARK: - Function
    
    func configure() {
        settings.append(Section(title: "General", options: [
            .switchCell(type: SettingsSwitchOptions(title: "Авиарежим", icon: UIImage(systemName: "airplane"), iconBackgroundColor: .orange, isOn: true)),
            .staticCell(type: SettingsOption(title: "Wi-Fi", icon: UIImage(systemName: "wifi"), iconBackgroundColor: .blue))
        ]))
        
        settings.append(Section(title: "General", options: [
            .staticCell(type: SettingsOption(title: "Tytytytyty", icon: UIImage(systemName: "play"), iconBackgroundColor: .white))
        ]))
    }
    
    // MARK: - Settings
    
    private func setupView() {
        navigationItem.title = "Настройки"
        navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    private func setupHierarcy() {
        view.addSubview(tableView)
    }
    
    private func setupLayout() {
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
    }
    
    // MARK: - UITableViewDataSource
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return settings.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let setting = settings[indexPath.section].options[indexPath.row]
        
        switch setting.self {
        case .staticCell(let setting):
            guard let cell = tableView.dequeueReusableCell(withIdentifier: SettingTableViewCell.identifire, for: indexPath) as? SettingTableViewCell else {
                return UITableViewCell()
            }
            cell.accessoryType = .disclosureIndicator
            cell.configure(with: setting)
            return cell
        case .switchCell(let setting):
            guard let cell = tableView.dequeueReusableCell(withIdentifier: SwitchTableViewCell.identifire, for: indexPath) as? SwitchTableViewCell else {
                return UITableViewCell()
            }
            cell.accessoryType = .none
            cell.selectionStyle = .none
            cell.configure(with: setting)
            return cell
        }
    }
    
    // MARK: - UITableViewDelegate
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
    
}

