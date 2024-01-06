//
//  HorizentalCell.swift
//  My_Tasks
//
//  Created by Heba Omar94 on 26/11/2023.
//
import UIKit
import SkeletonView

protocol HorizontalCellDelegate {
    func didSelectStory(_ story: Story)
}

class HorizontalCell: UITableViewCell {
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    private var list = [Story]()
    private var delegate: HorizontalCellDelegate?
    
    func configure(with list: [Story],
                   delegate: HorizontalCellDelegate?) {
        self.list = list
        self.delegate = delegate
        collectionView.reloadData()
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupCollectionView()
    }
}

extension HorizontalCell: UICollectionViewReference,
                          UICollectionViewDelegateFlowLayout {
    
    func collectionSkeletonView(_ skeletonView: UICollectionView, cellIdentifierForItemAt indexPath: IndexPath) -> ReusableCellIdentifier {
        return String(describing: StoryCell.self)
    }
    
    func collectionSkeletonView(_ skeletonView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 3
    }
    
    func setupCollectionView() {
        collectionView.registerCellNib(StoryCell.self)
        let padding = 4.5
        collectionView.contentInset = .init(top: 0,
                                            left: padding,
                                            bottom: 0,
                                            right: padding)
        collectionView.delegate = self
        collectionView.dataSource = self
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return list.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeue(StoryCell.self,
                                          indexPath: indexPath)
        cell.configure(with: list[indexPath.item])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return .init(width: 88, height: 99)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let model = list[indexPath.row]
        delegate?.didSelectStory(model)
    }
}
