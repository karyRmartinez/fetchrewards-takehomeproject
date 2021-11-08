//
//  DetailViewControllerViewController.swift
//  RecipeApp
//
//  Created by Kary Martinez on 11/7/21.
//

import UIKit

class DetailViewControllerViewController: UIViewController {
    
    private var mealID: String
    private var mealName: String
    private let categorylist = APIClient<MealIDInfo>()
    
    
    var currentDetails = [MealDetails] () {
        didSet {
            DispatchQueue.main.async {
                self.collectionView.reloadData()
            }
        }
    }
    
    lazy var collectionView: UICollectionView = {
          let layout = UICollectionViewFlowLayout()
          layout.scrollDirection = .vertical
          layout.minimumInteritemSpacing = 0
         layout.itemSize = CGSize(width: view.frame.width, height: 600)
          let DetailView = UICollectionView(frame: CGRect.zero, collectionViewLayout: layout)
          
          DetailView.register(DetailCollectionViewCell.self, forCellWithReuseIdentifier: "categoryCell")
        DetailView.backgroundColor = .clear
          DetailView.dataSource = self
          DetailView.delegate = self
           return DetailView
      }()
  
    func addSubviews() {
        self.view.addSubview(collectionView)
}
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        getPost(with: mealID)
        addSubviews()
        NavigationBarTitle()
        collectionViewConstraints()
       
   
    }
    // MARK: - Initializers
    init(mealID: String, mealName: String) {
        self.mealID = mealID
        self.mealName = mealName
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    private func getPost(with mealID: String) {
        
        categorylist.fetchData(url: APIHelper.URL.base + "lookup.php?i=\(mealID)" ) { [weak self] (result) in
            switch result {
            case .failure(let error):
              print(error)
            case .success(let outcome):
                self?.currentDetails = outcome.meals
      
            }
        }
  }
    private func NavigationBarTitle() {
        self.title = "Recipe"
    }
    // MARK: - Constraints
    private func collectionViewConstraints() {
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.widthAnchor.constraint(equalTo: self.view.widthAnchor, constant: 0).isActive = true
        collectionView.heightAnchor.constraint(equalToConstant: 700).isActive = true
        collectionView.centerYAnchor.constraint(equalTo: self.view.centerYAnchor, constant: -200).isActive = true
        collectionView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor, constant: 0).isActive = true

    }
}
extension DetailViewControllerViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
       let selectedRecipe = currentDetails[indexPath.row]
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return currentDetails.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "categoryCell", for: indexPath) as! DetailCollectionViewCell
        let currentRecipe = currentDetails[indexPath.row]
        //cell.titleLabel.text = currentRecipe.id
        cell.NameLabel.text = currentRecipe.name
        cell.set(details: currentDetails[indexPath.row].mealDetails.description)
    
        
        
        
        return cell
    }
    
    
}
