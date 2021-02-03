//
//  HomeFollowerTVC.swift
//  Walkway_iOS
//
//  Created by SHIN YOON AH on 2021/01/22.
//

import UIKit

class HomeFollowerTVC: UITableViewCell {
    static let identifier = "HomeFollowerTVC"
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var followerCollectionView: UICollectionView!
    
    var delegate: cellPresentDelegate?

    override func awakeFromNib() {
        super.awakeFromNib()
        setUI()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}

// MARK: - CollectionViewDelegate
extension HomeFollowerTVC: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: HomeFollowerCVC.identifier, for: indexPath) as? HomeFollowerCVC else {
            return UICollectionViewCell()
        }
        return cell
    }
}

extension HomeFollowerTVC: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = (UIScreen.main.bounds.size.width - 14 - 50 - 24) / 3
        let height = collectionView.frame.size.height - 11
        return CGSize(width: width, height: height)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 8
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 11, left: 14, bottom: 0, right: 14)
    }
}

extension HomeFollowerTVC: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        guard let dvc = UIStoryboard(name: "Home", bundle: nil).instantiateViewController(identifier: "FollowerVC") as? FollowerVC else {
            return
        }
        delegate?.collectionViewCellTapedFollower(dvc: dvc)
    }
}

// MARK: - UI
extension HomeFollowerTVC {
    private func setUI() {
        setCollectionView()
        setCollectionViewNib()
        setLabel()
    }
    
    private func setCollectionView() {
        followerCollectionView.delegate = self
        followerCollectionView.dataSource = self
    }
    
    private func setCollectionViewNib() {
        let nibName = UINib(nibName: "HomeFollowerCVC", bundle: nil)
        followerCollectionView.register(nibName, forCellWithReuseIdentifier: HomeFollowerCVC.identifier)
    }
    
    private func setLabel() {
        titleLabel.text = "요즘 인기있는 팔로워"
        titleLabel.font = .systemFont(ofSize: 20, weight: .semibold)
    }
}
