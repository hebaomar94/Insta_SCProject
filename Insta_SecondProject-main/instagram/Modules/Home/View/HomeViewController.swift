//
//  HomeViewController.swift
//  instagram
//
//  Created by Heba Omar94 on 06/12/2023.
//

import UIKit
//import SkeletonView

class HomeViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    var dataSource: PostsDataSource?
    
    
    
    var stories: [Story] {
           return [
               .init(imageUrl: nil, isMyStory: true),
               .init(imageUrl: nil, username: "jake.marco"),
               .init(imageUrl: nil, username: "max.d1")
           ]
       }
       
       var posts: [Post] {
           return [
               .init(username: "jake.marco"),
               .init(username: "max.d1")
           ]
       }
       
       init() {
           super.init(nibName: String(describing: Self.self),
                      bundle: Bundle(for: Self.self))
       }
       
       required init?(coder: NSCoder) {
           super.init(coder: coder)
       }

       override func viewDidLoad() {
           super.viewDidLoad()
           navigationItem.title = "Home"
           setupTableView()
           view.showAnimatedGradientSkeleton()
           
           DispatchQueue.main.asyncAfter(deadline: .now() + 10) {
               self.view.hideSkeleton()
           }
       }
       
       private func setupTableView() {
           dataSource = .init(delegate: self, collectionDelegate: self)
           dataSource?.setup(tableView)
           tableView.delegate = dataSource
           tableView.dataSource = dataSource
           
           dataSource?.configure(with: posts,
                                 collectionList: stories)
           tableView.reloadData()
       }
   }

   extension HomeViewController: HorizontalCellDelegate {
       
       func didSelectStory(_ story: Story) {
           
       }
   }

   extension HomeViewController: PostsDataSourceDelegate {
       
       func didSelectItem(_ post: Post) {
           
       }
       
       func didClickedLike(on post: Post) {
           
       }
       
       func didClickedComment(on post: Post) {
           
       }
       
       func didClickedViewComments(on post: Post) {
           
       }
       
       func didClickedShare(on post: Post) {
           
       }
   }
