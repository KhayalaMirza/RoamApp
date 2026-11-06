//
//  OnboardingController.swift
//  ROAM
//
//  Created by Khayala Mirza on 24/10/2026.
//

import UIKit

class OnboardingController: BaseController {

    private lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = 0
        layout.minimumInteritemSpacing = 0

        let collection = UICollectionView(frame: .zero,collectionViewLayout: layout)
        collection.backgroundColor = .clear
        collection.isPagingEnabled = true
        collection.isScrollEnabled = false
        collection.showsHorizontalScrollIndicator = false
        collection.contentInsetAdjustmentBehavior = .never

        collection.delegate = self
        collection.dataSource = self

        collection.register(OnboardingCell.self, forCellWithReuseIdentifier: OnboardingCell.identifier)
        collection.translatesAutoresizingMaskIntoConstraints = false
        return collection
    }()

    private var skipButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Skip", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = UIColor.black.withAlphaComponent(0.5)
        button.layer.cornerRadius = 18
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    private let pageControl: UIPageControl = {
        let page = UIPageControl()
        page.numberOfPages = onboardingItems.count
        page.currentPage = 0
        page.currentPageIndicatorTintColor = UIColor(named: "button_bg")
        page.pageIndicatorTintColor = .gray
        page.translatesAutoresizingMaskIntoConstraints = false
        return page
    }()

    private var nextButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Next", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 16,weight: .bold)
        button.backgroundColor = UIColor(named: "button_bg")
        button.layer.cornerRadius = 26
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    private var currentPage = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func configureUI() {
        view.backgroundColor = UIColor(named: "background")
        
        view.addSubview(collectionView)
        view.addSubview(skipButton)
        view.addSubview(pageControl)
        view.addSubview(nextButton)
    }
    override func configureConstraints() {
        NSLayoutConstraint.activate([
                    collectionView.topAnchor.constraint(equalTo: view.topAnchor),
                    collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
                    collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
                    collectionView.bottomAnchor.constraint(equalTo: pageControl.topAnchor, constant: -8),

                    skipButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10),
                    skipButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -24),
                    skipButton.widthAnchor.constraint(equalToConstant: 75),
                    skipButton.heightAnchor.constraint(equalToConstant: 36),

                    pageControl.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
                    pageControl.bottomAnchor.constraint(equalTo: nextButton.topAnchor, constant: -12),

                    nextButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 24),
                    nextButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -24),
                    nextButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -20),
                    nextButton.heightAnchor.constraint(equalToConstant: 50)
                ])
                nextButton.addTarget(self, action: #selector(nextTapped), for: .touchUpInside)
                skipButton.addTarget(self, action: #selector(skipTapped), for: .touchUpInside)
                pageControl.addTarget(self, action: #selector(pageControlChanged), for: .valueChanged)
    }

    @objc private func nextTapped() {
        if currentPage < onboardingItems.count - 1 {
            currentPage += 1
            scrollTo(page: currentPage, animated: true)
            updatePage()
        } else {
            finishOnboarding()
        }
    }
    @objc private func pageControlChanged() {
        currentPage = pageControl.currentPage
               scrollTo(page: currentPage, animated: true)
               updatePage()
    }

    @objc private func skipTapped() {
        finishOnboarding()
    }
    private func scrollTo(page: Int, animated: Bool) {
           let x = CGFloat(page) * collectionView.bounds.width
           collectionView.setContentOffset(CGPoint(x: x, y: 0), animated: animated)
       }

    private func updatePage() {
        pageControl.currentPage = currentPage
        let isLastPage = currentPage == onboardingItems.count - 1
        
        nextButton.setTitle( isLastPage ?
                             "Get started" :"Next",
                             for: .normal)
    }

    private func finishOnboarding() {
        UserDefaults.standard.set(true,forKey: "hasSeenOnboarding" )

        let controller = LoginController()
        navigationController?.pushViewController(controller, animated: true)
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()

        guard let layout = collectionView.collectionViewLayout
            as? UICollectionViewFlowLayout else { return }

        if layout.itemSize != collectionView.bounds.size {
            layout.itemSize = collectionView.bounds.size
            layout.invalidateLayout()
            scrollTo(page: currentPage, animated: false)
        }
    }
}

extension OnboardingController:UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView( _ collectionView: UICollectionView,
        numberOfItemsInSection section: Int) -> Int {
        return onboardingItems.count
    }
    
    func collectionView( _ collectionView: UICollectionView,
        cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell( withReuseIdentifier: OnboardingCell.identifier, for: indexPath) as? OnboardingCell else {
            return UICollectionViewCell()
        }
        cell.configure(with: onboardingItems[indexPath.item])
        return cell
    }
}

