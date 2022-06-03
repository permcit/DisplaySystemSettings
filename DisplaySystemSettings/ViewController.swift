//
//  ViewController.swift
//  DisplaySystemSettings
//
//  Created by Роман Назаров on 03.06.2022.
//

import UIKit

class ViewController: UIViewController {

    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupView()
    }

    // MARK: - Settings
    
    private func setupView() {
        navigationItem.title = "Настройки"
        navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    private func setupHierarcy() {
        
    }
    
    private func setupLayout() {
        
    }

}

