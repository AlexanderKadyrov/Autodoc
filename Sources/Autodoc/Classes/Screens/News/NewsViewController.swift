import UIKit
import UI

final public class NewsViewController: UIViewController {
    
    public var viewModel: NewsViewModel? {
        didSet {
            bind()
        }
    }
    
    private let collectionViewLayout = NewsCollectionViewLayout()
    
    private lazy var collectionView: UICollectionView = {
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.scrollDirection = .vertical
        let view = UICollectionView(frame: .zero, collectionViewLayout: collectionViewLayout)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.register(NewsCollectionCellView.self, forCellWithReuseIdentifier: "NewsCollectionCellView")
        view.delegate = self
        return view
    }()
    
    private lazy var dataSource = CollectionDataSource(collectionView: collectionView)
    
    public override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        collectionView.collectionViewLayout = collectionViewLayout
    }
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.prefersLargeTitles = true
        title = "Новости"
        configureUI()
    }
    
    private func configureUI() {
        view.addSubview(collectionView)
        NSLayoutConstraint.activate([
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            collectionView.topAnchor.constraint(equalTo: view.topAnchor)
        ])
    }
    
    private func bind() {
        dataSource.adapter = viewModel?.collectionDataSourceAdapter
    }
}

extension NewsViewController: UICollectionViewDelegate {
    public func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        collectionView.deselectItem(at: indexPath, animated: true)
    }
}
