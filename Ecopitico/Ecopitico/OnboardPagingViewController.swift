//
//  OnboardingViewController.swift
//  SimpleOnboardingDemo
//
//  Created by jrasmusson on 2021-01-08.
//

import UIKit

class OnboardingPagingViewController: UIViewController {
    
    let stackView = UIStackView()
    let startButton = UIButton()
    
    let imageView = UIImageView()
    let backgroundImage = UIImageView()
    let titleLabel = UILabel()
    let subtitleLabel = UILabel()
    
    init(imageName: UIImage , titleText: String, subtitleText: String, backgroundImage: UIImage) {
        super.init(nibName: nil, bundle: nil)
        imageView.image = imageName
        titleLabel.text = titleText
        subtitleLabel.text = subtitleText
        self.backgroundImage.image = backgroundImage
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        style()
        layout()
    }
    @objc func startTapped (_ sender: UIButton){
        let tabBar = MyTabBarController()
        tabBar.modalPresentationStyle = .fullScreen
        present(tabBar, animated: true, completion: nil)
    }
}

extension OnboardingPagingViewController {
    
    func style() {
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.alignment = .center
        stackView.spacing = 80
        
        backgroundImage.translatesAutoresizingMaskIntoConstraints = false
        backgroundImage.contentMode = .scaleAspectFill
        backgroundImage.clipsToBounds = true
        
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.font = UIFont(name: "Nunito-ExtraBold", size: 34)
        titleLabel.numberOfLines = 0
        titleLabel.textAlignment = .center
        
        subtitleLabel.translatesAutoresizingMaskIntoConstraints = false
        subtitleLabel.font = UIFont(name: "Nunito-Medium", size: 24)
        subtitleLabel.textAlignment = .center
        
        startButton.translatesAutoresizingMaskIntoConstraints = false
        startButton.setTitleColor(UIColor(named: "EcoWhite"), for: .normal)
        startButton.backgroundColor = UIColor(named: "EcoGreen")
        startButton.setTitle("Vamos Começar!", for: .normal)
        startButton.titleLabel?.font = UIFont(name: "Nunito-Medium", size: 24)
        startButton.layer.cornerRadius = 8
        startButton.addTarget(self, action: #selector(startTapped(_:)), for: .primaryActionTriggered)
        
        subtitleLabel.numberOfLines = 0
    }
        
    func layout() {
        stackView.addArrangedSubview(titleLabel)
        stackView.addArrangedSubview(imageView)
        stackView.addArrangedSubview(subtitleLabel)
        
        view.addSubview(backgroundImage)
        view.addSubview(stackView)
        view.addSubview(startButton)

        
        NSLayoutConstraint.activate([
            stackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            stackView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            
            imageView.heightAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.5),
            titleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 15),
            titleLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -15),
            titleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            subtitleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 15),
            subtitleLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -15),
            startButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 15),
            startButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -15),
            startButton.heightAnchor.constraint(equalToConstant: 54),
            startButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -100)
        ])
        
        NSLayoutConstraint.activate([backgroundImage.leadingAnchor.constraint(equalTo: view.leadingAnchor), backgroundImage.trailingAnchor.constraint(equalTo: view.trailingAnchor), backgroundImage.topAnchor.constraint(equalTo: view.topAnchor), backgroundImage.heightAnchor.constraint(equalToConstant: 539)])
    }
}
