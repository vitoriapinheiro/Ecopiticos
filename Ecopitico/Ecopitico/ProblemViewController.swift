//
//  ProblemViewController.swift
//  Ecopitico
//
//  Created by vivi on 20/09/22.
//

import UIKit

class ProblemViewController: UIViewController {
    
    private let scrollView = UIScrollView()
    private let contentView = UIView()
    
    private lazy var imageView: UIImageView = {
        let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 150, height: 1050))
        imageView.center = contentView.center
        imageView.backgroundColor = .green
        imageView.layer.masksToBounds = true
        imageView.layer.cornerRadius = 150/2
        imageView.image = UIImage(named: "manatee")
        
        return imageView
    }()
    
    private lazy var background: UIImageView = {
        let backgroundImageView = UIImageView()
        backgroundImageView.image = UIImage(named: "ocean")
        backgroundImageView.contentMode = .scaleAspectFill
        
        return backgroundImageView
    }()
    
    let blur = UIBlurEffect(style: .regular)
    lazy var blurView = UIVisualEffectView(effect: blur)

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .cyan
//        self.tabBarController?.tabBar.isHidden = true
        loadHierachy()
        setupConstraints()

    }
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.navigationBar.isOpaque = true
    }
    
    func loadHierachy(){
        self.view.addSubview(scrollView)
        scrollView.addSubview(contentView)
        contentView.addSubview(background)
        contentView.addSubview(blurView)
        contentView.addSubview(imageView)
        
    }
    
    func setupConstraints(){
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: view.topAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
        
        contentView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            contentView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            contentView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            contentView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            contentView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            contentView.widthAnchor.constraint(equalTo: scrollView.widthAnchor)
        ])
        
        background.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            background.topAnchor.constraint(equalTo: contentView.topAnchor, constant: -100),
            background.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            background.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            background.heightAnchor.constraint(equalToConstant: 1000),
        ])
        
        blurView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            blurView.bottomAnchor.constraint(equalTo: background.bottomAnchor),
            blurView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            blurView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            blurView.heightAnchor.constraint(equalToConstant: 300),
            blurView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        ])
    }
    
//    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
//        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
//        hidesBottomBarWhenPushed = true
//    }
//
//    required init?(coder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
