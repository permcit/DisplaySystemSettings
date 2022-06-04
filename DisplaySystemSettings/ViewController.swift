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
        setupView()
//        view.backgroundColor = .white
        setupHierarcy()
        setupLayout()
        configure()
    }

    // MARK: - Settings
    
    private func setupView() {
        navigationItem.title = "Настройки"
        navigationController?.navigationBar.prefersLargeTitles = true
        view.backgroundColor = .lightGray
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
    
    // MARK: - Function
    
    func configure() {
        settings.append(Section(title: "Original", options: [
            .switchCell(type: SettingsSwitchOptions(title: "Авиарежим", icon: UIImage(named: "airplane"), iconBackgroundColor: .white, isOn: true)),
            .staticCell(type: SettingsOption(title: "Wi-Fi", icon: UIImage(named: "wifi"), iconBackgroundColor: .white)),
            .staticCell(type: SettingsOption(title: "Bluetooth", icon: UIImage(named: "bluetooth"), iconBackgroundColor: .white)),
            .staticCell(type: SettingsOption(title: "Сотовая связь", icon: UIImage(named: "radiosignal"), iconBackgroundColor: .white)),
            .staticCell(type: SettingsOption(title: "Режим модема", icon: UIImage(named: "share"), iconBackgroundColor: .white)),
            .staticCell(type: SettingsOption(title: "VPN", icon: UIImage(named: "vpn"), iconBackgroundColor: .white))
            ]))
        
        settings.append(Section(title: "Middle", options: [
            .staticCell(type: SettingsOption(title: "Уведомления", icon: UIImage(named: "yvedomlenie"), iconBackgroundColor: .white)),
            .staticCell(type: SettingsOption(title: "Звуки, тактильные сигналы", icon: UIImage(named: "sounds"), iconBackgroundColor: .white)),
            .staticCell(type: SettingsOption(title: "Не беспокоить", icon: UIImage(named: "nebespokoit"), iconBackgroundColor: .white)),
            .staticCell(type: SettingsOption(title: "Экранное время", icon: UIImage(named: "monitortimer"), iconBackgroundColor: .white))
            ]))

        settings.append(Section(title: "Lower", options: [
            .staticCell(type: SettingsOption(title: "Основные", icon: UIImage(named: "main"), iconBackgroundColor: .white)),
            .staticCell(type: SettingsOption(title: "Пункт управления", icon: UIImage(named: "pynktypravleniya"), iconBackgroundColor: .white)),
            .staticCell(type: SettingsOption(title: "Экран и яркость", icon: UIImage(named: "yarkost"), iconBackgroundColor: .white)),
            .staticCell(type: SettingsOption(title: "Экран «Домой»", icon: UIImage(named: "homemonitor"), iconBackgroundColor: .white)),
            .staticCell(type: SettingsOption(title: "Универсальный доступ", icon: UIImage(named: "universaldostup"), iconBackgroundColor: .white))
            ]))
    }
    
    // MARK: - UITableViewDataSource
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return settings.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return settings[section].options.count
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
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let setting = settings[indexPath.section].options[indexPath.row]
        switch setting.self {
        case .staticCell(let setting):
            tableView.deselectRow(at: indexPath, animated: true)
            print("Нажата кнопка \(setting.title).")
        case .switchCell:
            return
        }
    }
}

