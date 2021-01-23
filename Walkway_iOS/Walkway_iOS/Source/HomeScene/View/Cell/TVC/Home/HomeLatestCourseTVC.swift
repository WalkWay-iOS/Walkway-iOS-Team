//
//  HomeLatestCourseTVC.swift
//  Walkway_iOS
//
//  Created by SHIN YOON AH on 2021/01/22.
//

import UIKit

class HomeLatestCourseTVC: UITableViewCell {
    static let identifier = "HomeLatestCourseTVC"

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var viewAllButton: UIButton!
    @IBOutlet weak var latestCollectionView: UICollectionView!
    
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
extension HomeLatestCourseTVC: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 7
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: HomeLatestCourseCVC.identifier, for: indexPath) as? HomeLatestCourseCVC else {
            return UICollectionViewCell()
        }
        return cell
    }
}

extension HomeLatestCourseTVC: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = UIScreen.main.bounds.size.width - 14 - 100
        let height = collectionView.frame.size.height - 11 - 22
        return CGSize(width: width, height: height)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 8
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 11, left: 14, bottom: 22, right: 14)
    }
}

// MARK: - UI
extension HomeLatestCourseTVC {
    private func setUI() {
        setCollectionView()
        setCollectionViewNib()
        setLabel()
        setButton()
    }
    
    private func setCollectionView() {
        latestCollectionView.delegate = self
        latestCollectionView.dataSource = self
    }
    
    private func setCollectionViewNib() {
        let nibName = UINib(nibName: "HomeLatestCourseCVC", bundle: nil)
        latestCollectionView.register(nibName, forCellWithReuseIdentifier: HomeLatestCourseCVC.identifier)
    }
    
    private func setLabel() {
        titleLabel.text = "최신 코스"
        titleLabel.font = .systemFont(ofSize: 20, weight: .semibold)
    }
    
    private func setButton() {
        viewAllButton.setTitle("전체보기", for: .normal)
        viewAllButton.titleLabel?.font = .systemFont(ofSize: 13, weight: .semibold)
        viewAllButton.setTitleColor(.black, for: .normal)
        viewAllButton.addTarget(self, action: #selector(touchUpViewAll), for: .touchUpInside)
    }
}

// MARK: - Action
extension HomeLatestCourseTVC {
    @objc func touchUpViewAll() {
        delegate?.cellTapedLatestCourse()
    }
}
