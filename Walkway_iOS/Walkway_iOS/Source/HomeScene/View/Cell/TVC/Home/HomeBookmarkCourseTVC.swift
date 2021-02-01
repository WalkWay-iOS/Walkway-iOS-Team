//
//  HomeBookmarkCourseTVC.swift
//  Walkway_iOS
//
//  Created by SHIN YOON AH on 2021/01/22.
//

import UIKit

class HomeBookmarkCourseTVC: UITableViewCell {
    static let identifier = "HomeBookmarkCourseTVC"

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var viewAllButton: UIButton!
    @IBOutlet weak var bookmarkCollectionView: UICollectionView!
    
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
extension HomeBookmarkCourseTVC: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 7
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: HomeBookmarkCourseCVC.identifier, for: indexPath) as? HomeBookmarkCourseCVC else {
            return UICollectionViewCell()
        }
        return cell
    }
}

extension HomeBookmarkCourseTVC: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = UIScreen.main.bounds.size.width - 14 - 100
        let height = collectionView.frame.size.height - 11 - 11
        return CGSize(width: width, height: height)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 8
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 11, left: 14, bottom: 11, right: 14)
    }
}

extension HomeBookmarkCourseTVC: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        guard let dvc = UIStoryboard(name: "Home", bundle: nil).instantiateViewController(identifier: "CourseDetailVC") as? CourseDetailVC else {
            return
        }
        delegate?.collectionViewCellTapedCourse(dvc: dvc)
    }
}

// MARK: - UI
extension HomeBookmarkCourseTVC {
    private func setUI() {
        setCollectionView()
        setCollectionViewNib()
        setLabel()
        setButton()
    }
    
    private func setCollectionView() {
        bookmarkCollectionView.delegate = self
        bookmarkCollectionView.dataSource = self
    }
    
    private func setCollectionViewNib() {
        let nibName = UINib(nibName: "HomeBookmarkCourseCVC", bundle: nil)
        bookmarkCollectionView.register(nibName, forCellWithReuseIdentifier: HomeBookmarkCourseCVC.identifier)
    }
    
    private func setLabel() {
        titleLabel.text = "북마크 / 평점 코스"
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
extension HomeBookmarkCourseTVC {
    @objc func touchUpViewAll() {
        delegate?.cellTapedBookmarkCourse()
    }
}
