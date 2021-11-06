//
//  MealInfoViewController.swift
//  RecipeApp
//
//  Created by Kary Martinez on 11/6/21.
//

import UIKit

class MealInfoViewController: UIViewController {
    
    var allMeals = [Meal]() {
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
          layout.itemSize = CGSize(width: view.frame.width, height: 400)
          let BrowserView = UICollectionView(frame: CGRect.zero, collectionViewLayout: layout)

         // BrowserView.register(browserViewCollectionViewCell.self, forCellWithReuseIdentifier: "theCell")
          BrowserView.backgroundColor = .white
         // BrowserView.dataSource = sel        // BrowserView.delegate = self
          
          return BrowserView
      }()
    private let Meallist = APIClient<MealInfo>()

    private func fetchData() {
        Meallist.fetchData(url: APIHelper.URL.link + "filter.php?"  ) { [weak self] (result) in
            switch result {
            case .failure(let error):
              print(error)
            case .success(let outcome):
                self?.allMeals = outcome.meals
            }
          }
        }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionViewConstraints()

    }
    private func collectionViewConstraints() {
        
            collectionView.translatesAutoresizingMaskIntoConstraints = false
            collectionView.widthAnchor.constraint(equalTo: self.view.widthAnchor, constant: 0).isActive = true
            collectionView.heightAnchor.constraint(equalTo: view.heightAnchor).isActive = true
            collectionView.centerYAnchor.constraint(equalTo: self.view.centerYAnchor).isActive = true
            collectionView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor, constant: 0).isActive = true
        }
    }
extension MealInfoViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let selectedRecipe = allMeals[indexPath.row]
       // let detailViewController = DetailViewController()
       // detailViewController.currentRecipes = selectedRecipe
       // self.navigationController?.pushViewController(detailViewController, animated: true)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return allMeals.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "theCell", for: indexPath) as! browserViewCollectionViewCell
        let currentRecipe = allMeals[indexPath.row]
        cell.titleLabel.text = currentRecipe.name
    
       
      
        return cell
    }
    
    
}
