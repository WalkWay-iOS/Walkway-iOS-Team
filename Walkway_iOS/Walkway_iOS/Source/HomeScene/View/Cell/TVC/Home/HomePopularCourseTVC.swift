//
//  HomePopularCourseTVC.swift
//  Walkway_iOS
//
//  Created by SHIN YOON AH on 2021/01/22.
//

import UIKit

class HomePopularCourseTVC: UITableViewCell {
    static let identifier = "HomePopularCourseTVC"
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var viewAllButton: UIButton!
    @IBOutlet weak var popularCollectionView: UICollectionView!
    
    var delegate: cellPresentDelegate?
    
    var populars: [Course] = []

    override func awakeFromNib() {
        super.awakeFromNib()
        setUI()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}

// MARK: - CollectionViewDelegate
extension HomePopularCourseTVC: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return populars.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: HomePopularCourseCVC.identifier, for: indexPath) as? HomePopularCourseCVC else {
            return UICollectionViewCell()
        }
        cell.getData(course: populars[indexPath.item])
        return cell
    }
}

extension HomePopularCourseTVC: UICollectionViewDelegateFlowLayout {
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

extension HomePopularCourseTVC: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        guard let dvc = UIStoryboard(name: "Home", bundle: nil).instantiateViewController(identifier: "CourseDetailVC") as? CourseDetailVC else {
            return
        }
        dvc.courseId = populars[indexPath.row].id 
        delegate?.collectionViewCellTapedCourse(dvc: dvc)
    }
}

// MARK: - UI
extension HomePopularCourseTVC {
    private func setUI() {
        setCollectionView()
        setCollectionViewNib()
        setLabel()
        setButton()
    }
    
    private func setCollectionView() {
        popularCollectionView.delegate = self
        popularCollectionView.dataSource = self
    }
    
    private func setCollectionViewNib() {
        let nibName = UINib(nibName: "HomePopularCourseCVC", bundle: nil)
        popularCollectionView.register(nibName, forCellWithReuseIdentifier: HomePopularCourseCVC.identifier)
    }
    
    private func setLabel() {
        titleLabel.text = "인기 추천 코스"
        titleLabel.font = .myBoldSystemFont(ofSize: 20)
    }
    
    private func setButton() {
        viewAllButton.setTitle("전체보기", for: .normal)
        viewAllButton.titleLabel?.font = .myMediumSystemFont(ofSize: 13)
        viewAllButton.setTitleColor(.black, for: .normal)
        viewAllButton.addTarget(self, action: #selector(touchUpViewAll), for: .touchUpInside)
    }
}

// MARK: - Action
extension HomePopularCourseTVC {
    @objc func touchUpViewAll() {
        delegate?.cellTapedPopularCourse()
    }
}
