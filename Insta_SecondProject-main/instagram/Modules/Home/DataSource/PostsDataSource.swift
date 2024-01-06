//
//  PostsDataSource.swift
//  instagram
//
//  Created by Heba Omar94 on 16/12/2023.
//
import UIKit
import SkeletonView

protocol PostsDataSourceDelegate {
    func didSelectItem(_ post: Post)
    func didClickedLike(on post: Post)
    func didClickedComment(on post: Post)
    func didClickedViewComments(on post: Post)
    func didClickedShare(on post: Post)
}

class PostsDataSource: NSObject,
                       UITableViewReference {
    
    private var list = [Post]()
    private var collectionList = [Story]()
    private var delegate: PostsDataSourceDelegate?
    private var collectionDelegate: HorizontalCellDelegate?
    
    init(delegate: PostsDataSourceDelegate?,
         collectionDelegate: HorizontalCellDelegate?) {
        self.delegate = delegate
        self.collectionDelegate = collectionDelegate
    }
    
    func setup(_ tableView: UITableView) {
        tableView.registerCellNib(HorizontalCell.self)
        tableView.registerCellNib(Postcell.self)
        tableView.estimatedSectionHeaderHeight = 0
        tableView.estimatedSectionFooterHeight = 0
        tableView.estimatedRowHeight = 420
    }
    
    func configure(with list: [Post], collectionList: [Story]) {
        self.list = list
        self.collectionList = collectionList
    }
    
    
    
    //return cell's name

    func collectionSkeletonView(_ skeletonView: UITableView, cellIdentifierForRowAt indexPath: IndexPath) -> ReusableCellIdentifier {
        /*
        if indexPath.row == 0 {
            return String(describing: HorizontalCell.self)
        } else {
            return String(describing: PostCell.self)
        }
        */
        
        return String(describing: Postcell.self)
    }
    func collectionSkeletonView(_ skeletonView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return list.count + 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 0 {
            let cell = tableView.dequeue(HorizontalCell.self)
            cell.configure(with: collectionList,
                           delegate: collectionDelegate)
            return cell
        }
        
        let cell = tableView.dequeue(Postcell.self)
        cell.configure(with: list[indexPath.row - 1])
        return cell
    }
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.row == 0 { return 99 }
        return UITableView.automaticDimension
    }
}
