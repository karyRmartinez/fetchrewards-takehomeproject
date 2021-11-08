//
//  CategoryViewController.swift
//  RecipeApp
//
//  Created by Kary Martinez on 11/5/21.
//

import UIKit

class CategoryViewController: UIViewController {
    
    //MARK: -Properies
    private let categorylist = APIClient<CategoryList>()
    
    var allRecipes = [Category]() {
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
        layout.itemSize = CGSize(width: view.frame.width, height: 75)
        let CategoryView = UICollectionView(frame: CGRect.zero, collectionViewLayout: layout)
        
        CategoryView.register(CategoryCollectionViewCell.self, forCellWithReuseIdentifier: "categoryCell")
        CategoryView.backgroundColor = .white
        CategoryView.dataSource = self
        CategoryView.delegate = self
         return CategoryView
    }()
    
    func addSubview() {
        self.view.addSubview(collectionView)
        
    }
    // MARK: Lifecycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        addSubview()
        fetchData()
        NavigationBarTitle()
        collectionViewConstraints()
    }
    // MARK: Loading Data
    private func fetchData() {
        categorylist.fetchData(url: APIHelper.URL.base + "categories.php"  ) { [weak self] (result) in
            switch result {
            case .failure(let error):
                print(error)
            case .success(let outcome):
                self?.allRecipes = outcome.categories.sorted()
                { $0.name < $1.name }
            }
        }
    }
    
    private func NavigationBarTitle() {
        self.title = "Categories"
    }
    // MARK: - Constraints
    private func collectionViewConstraints() {
            collectionView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant:  25),
            collectionView.topAnchor.constraint(equalTo: view.topAnchor),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -25),
            collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }

}
    // MARK: - Extensions
extension CategoryViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let selectedRecipe = allRecipes[indexPath.row]
        let detailViewController = SearchResultsViewController(categoryMealName: allRecipes[indexPath.item].name)
        self.navigationController?.pushViewController(detailViewController, animated: true)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return allRecipes.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "categoryCell", for: indexPath) as! CategoryCollectionViewCell
        let currentRecipe = allRecipes[indexPath.row]
        cell.titleLabel.text = currentRecipe.name
        
        
        
        return cell
    }
    
    
}

