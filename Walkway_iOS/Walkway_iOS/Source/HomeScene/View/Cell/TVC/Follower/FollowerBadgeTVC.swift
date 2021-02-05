//
//  FollowerBadgeTVC.swift
//  Walkway_iOS
//
//  Created by SHIN YOON AH on 2021/02/03.
//

import UIKit

class FollowerBadgeTVC: UITableViewCell {
    static let identifier = "FollowerBadgeTVC"

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var viewAllButton: UIButton!
    @IBOutlet weak var bottomView: UIView!
    @IBOutlet weak var badgeCollectionView: UICollectionView!
    
    var images: [String] = ["bookmark", "paperplane", "person.3", "graduationcap", "sun.haze", "sparkles", "flame"]
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setUI()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}

// MARK: - CollectionViewDelegate
extension FollowerBadgeTVC: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 7
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: FollowerBadgeCVC.identifier, for: indexPath) as? FollowerBadgeCVC else {
            return UICollectionViewCell()
        }
        cell.setImage(image: images[indexPath.row])
        return cell
    }
}

extension FollowerBadgeTVC: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 44, height: 44)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 12
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 13, left: 16, bottom: 13, right: 16)
    }
}

// MARK: - UI
extension FollowerBadgeTVC {
    private func setUI() {
        setView()
        setCollectionView()
        setCollectionViewNib()
        setLabel()
        setButton()
    }
    
    private func setView() {
        bottomView.backgroundColor = .gray40
    }
    
    private func setCollectionView() {
        badgeCollectionView.delegate = self
        badgeCollectionView.dataSource = self
    }
    
    private func setCollectionViewNib() {
        let nibName =  UINib(nibName: "FollowerBadgeCVC", bundle: nil)
        badgeCollectionView.register(nibName, forCellWithReuseIdentifier: FollowerBadgeCVC.identifier)
    }
    
    private func setLabel() {
        titleLabel.text = "뱃지"
        titleLabel.font = .boldSystemFont(ofSize: 16)
    }
    
    private func setButton() {
        viewAllButton.setTitle("전체보기", for: .normal)
        viewAllButton.setTitleColor(.gray70, for: .normal)
        viewAllButton.titleLabel?.font = .systemFont(ofSize: 11, weight: .semibold)
    }
}
