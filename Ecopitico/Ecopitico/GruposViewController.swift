//
//  GruposViewController.swift
//  Ecopitico
//
//  Created by jpbol on 21/09/22.
//

import UIKit

class GruposViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout{
    
    var segmentedViews: [UIView]!
    let contatoView = ContatoView(frame: CGRect(x: 0, y: 520, width: 390, height: 220))
    let mySegmentedControl = UISegmentedControl (items: ["Contato","Ações","Vídeos", "Problemas"])
    
    var grupo: Grupo?
    
    var collectionView: UICollectionView!
    
    let nome: UILabel = {
        let n = UILabel ()
        n.translatesAutoresizingMaskIntoConstraints = false
        n.textColor = UIColor(named: "EcoGreen")
        n.font = UIFont(name: "Nunito-Bold", size: 32)
        n.numberOfLines = 0
        return n
    }()
    
    let descricao: UILabel = {
        let desc = UILabel()
        desc.translatesAutoresizingMaskIntoConstraints = false
        desc.textColor = UIColor(named: "EcoBlack")
        desc.font = UIFont(name: "Nunito-Regular", size: 14)
        desc.numberOfLines = 0
        return desc
    }()
    
    let likeButton: UIButton =  {
        let b = UIButton()
        b.translatesAutoresizingMaskIntoConstraints = false
        b.setBackgroundImage(UIImage(systemName: "heart"), for: .normal)
        b.contentMode = .scaleToFill
        b.tintColor = UIColor(named: "EcoGreen")
        b.setBackgroundImage(UIImage(systemName: "heart.fill"), for: .selected)
        return b
    }()
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        grupo?.imagens.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 200, height: 200)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 13
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "fotosCell", for: indexPath) as? FotosGruposCollectionViewCell
        cell!.bg.image = UIImage( named: (grupo?.imagens[indexPath.row])!)
        return cell ?? UICollectionViewCell()
    }


    override func viewDidLoad() {
        super.viewDidLoad()

        mySegmentedControl.addTarget(self, action: #selector(self.segmentedValueChanged(_:)), for: .valueChanged)
        mySegmentedControl.translatesAutoresizingMaskIntoConstraints = false
        mySegmentedControl.selectedSegmentIndex = 0
        mySegmentedControl.addUnderlineForSelectedSegment()
        
        view.backgroundColor = UIColor(named: "EcoWhite")
        
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        
        
        layout.scrollDirection = .horizontal
        
        likeButton.addTarget(self, action: #selector(likeTapped(_:)), for: .primaryActionTriggered)
        
        // set the frame and layout
        self.collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        
        view.addSubview(collectionView)
        view.addSubview(likeButton)
        view.addSubview(nome)
        view.addSubview(descricao)
        view.addSubview(mySegmentedControl)
        view.addSubview(contatoView)
        
        collectionView.translatesAutoresizingMaskIntoConstraints = false

        
        self.collectionView.dataSource = self
        self.collectionView.delegate = self
        
        self.collectionView.register(FotosGruposCollectionViewCell.self, forCellWithReuseIdentifier: "fotosCell")
        
        self.collectionView.showsHorizontalScrollIndicator = false
        
        contatoView.updateTextInstagramButton(grupo?.nome)
        contatoView.updateTextTwitterButton(grupo?.nome)
        
        contatoView.instagramButton.addTarget(self, action: #selector(instagramTapped(_:)), for: .primaryActionTriggered)
        contatoView.instagramButton.addTarget(self, action: #selector(twitterTapped(_:)), for: .primaryActionTriggered)
        
        nome.text = grupo?.nome
        descricao.text = grupo?.descricao
        
        setupConstraints()
        // Do any additional setup after loading the view.
    }
    
    @objc func instagramTapped (_ sender: UIButton){
        UIApplication.shared.openURL(NSURL(string: (grupo?.redesSocias[0])!)! as URL)
    }
    @objc func twitterTapped (_ sender: UIButton){
        UIApplication.shared.openURL(NSURL(string: (grupo?.redesSocias[1])!)! as URL)
    }
    
    @objc func segmentedValueChanged(_ sender:UISegmentedControl!)
    {
        print("Selected Segment Index is : \(sender.selectedSegmentIndex)")
        mySegmentedControl.changeUnderlinePosition()
    }
    
    func setupConstraints (){
        
        likeButton.centerYAnchor.constraint(equalTo: nome.centerYAnchor).isActive = true
        likeButton.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -15).isActive = true
        likeButton.heightAnchor.constraint(equalToConstant: 30).isActive = true
        likeButton.leadingAnchor.constraint(equalTo: nome.trailingAnchor).isActive = true
        
        
        NSLayoutConstraint.activate([nome.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 15), nome.topAnchor.constraint(equalTo: view.topAnchor, constant: 96),nome.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -45)])
        
        NSLayoutConstraint.activate([descricao.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 15), descricao.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -15), descricao.topAnchor.constraint(equalTo: nome.bottomAnchor)])
        
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: descricao.bottomAnchor, constant: 30),
            collectionView.heightAnchor.constraint(equalToConstant: 200),
            collectionView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 15),
            collectionView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -15)
        ])
        
        
        
        NSLayoutConstraint.activate([mySegmentedControl.topAnchor.constraint(equalTo: collectionView.bottomAnchor, constant: 58), mySegmentedControl.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 15), mySegmentedControl.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -15), mySegmentedControl.heightAnchor.constraint(equalToConstant: 24)])
        
    }
    
    @objc func likeTapped (_ sender: UIButton){
        if (sender.isSelected == false){
            likeButton.isSelected = true
            grupo?.isLiked = true
        }
        else {
            likeButton.isSelected = false
            grupo?.isLiked = false
        }
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
}

extension UISegmentedControl{
    func removeBorder(){
        let backgroundImage = UIImage.getColoredRectImageWith(color: UIColor.white.cgColor, andSize: self.bounds.size)
        self.setBackgroundImage(backgroundImage, for: .normal, barMetrics: .default)
        self.setBackgroundImage(backgroundImage, for: .selected, barMetrics: .default)
        self.setBackgroundImage(backgroundImage, for: .highlighted, barMetrics: .default)

        let deviderImage = UIImage.getColoredRectImageWith(color: UIColor.white.cgColor, andSize: CGSize(width: 1.0, height: self.bounds.size.height))
        self.setDividerImage(deviderImage, forLeftSegmentState: .selected, rightSegmentState: .normal, barMetrics: .default)
        self.setTitleTextAttributes([NSAttributedString.Key.foregroundColor: UIColor.gray], for: .normal)
        self.setTitleTextAttributes([NSAttributedString.Key.foregroundColor: UIColor(named: "EcoGreen")!], for: .selected)
    }

    func addUnderlineForSelectedSegment(){
        removeBorder()
        let underlineWidth: CGFloat = self.bounds.size.width / CGFloat(self.numberOfSegments)
        let underlineHeight: CGFloat = 2.0
        let underlineXPosition = CGFloat(selectedSegmentIndex * Int(underlineWidth))
        let underLineYPosition = self.bounds.size.height - 1.0
        let underlineFrame = CGRect(x: underlineXPosition, y: underLineYPosition, width: underlineWidth, height: underlineHeight)
        let underline = UIView(frame: underlineFrame)
        underline.backgroundColor = UIColor(named: "EcoGreen")
        underline.tag = 1
        self.addSubview(underline)
    }

    func changeUnderlinePosition(){
        guard let underline = self.viewWithTag(1) else {return}
        let underlineFinalXPosition = (self.bounds.width / CGFloat(self.numberOfSegments)) * CGFloat(selectedSegmentIndex)
        UIView.animate(withDuration: 0.1, animations: {
            underline.frame.origin.x = underlineFinalXPosition
        })
    }
}

extension UIImage{

    class func getColoredRectImageWith(color: CGColor, andSize size: CGSize) -> UIImage{
        UIGraphicsBeginImageContextWithOptions(size, false, 0.0)
        let graphicsContext = UIGraphicsGetCurrentContext()
        graphicsContext?.setFillColor(color)
        let rectangle = CGRect(x: 0.0, y: 0.0, width: size.width, height: size.height)
        graphicsContext?.fill(rectangle)
        let rectangleImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return rectangleImage!
    }
}
