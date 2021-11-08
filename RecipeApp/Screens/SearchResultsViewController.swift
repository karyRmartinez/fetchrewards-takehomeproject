//
//  MealInfoViewController.swift
//  RecipeApp
//
//  Created by Kary Martinez on 11/6/21.
//

import UIKit

class SearchResultsViewController: UIViewController {
    
    //MARK: Properies
    private let Meallist = APIClient<MealInfo>()
    private var categoryMealName: String

    private var currentMealResults = [Meal]() {
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
          let mealCollectionView = UICollectionView(frame: CGRect.zero, collectionViewLayout: layout)

          mealCollectionView.register(CategoryResultsCollectionCell.self, forCellWithReuseIdentifier: "mealCell")
        mealCollectionView.backgroundColor = .systemBackground
          mealCollectionView.dataSource = self
          mealCollectionView.delegate = self
          
          return mealCollectionView
      }()
    func addSubview() {
    self.view.addSubview(collectionView)
      
    }

    init(categoryMealName: String) {
        self.categoryMealName = categoryMealName
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func fetchData(with query: String) {
        Meallist.fetchData(url: APIHelper.URL.base + "filter.php?c=\(query)"  ) { [weak self] (result) in
            switch result {
            case .failure(let error):
              print(error)
            case .success(let outcome):
                self?.currentMealResults = outcome.meals.sorted()
                { $0.name < $1.name}
            }
          }
        }
    //MARK: Lifecycle Method
    override func viewDidLoad() {
        view.backgroundColor = .systemBackground
        super.viewDidLoad()
        addSubview()
        fetchData(with: categoryMealName)
        NavigationBarTitle()
        collectionViewConstraints()

    }
    private func NavigationBarTitle() {
        self.title = "Meal Results"
    }
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
extension SearchResultsViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let selectedRecipe = currentMealResults[indexPath.row]
        
        let detailViewController = DetailViewControllerViewController(mealID: selectedRecipe.id, mealName: selectedRecipe.name)
       // detailViewController.allMeals = selectedRecipe
       self.navigationController?.pushViewController(detailViewController, animated: true)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return currentMealResults.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "mealCell", for: indexPath) as! CategoryResultsCollectionCell
        let currentRecipe = currentMealResults[indexPath.row]
        cell.mealnameLabel.text = currentRecipe.name
    
       
      
        return cell
    }
    
    
}
