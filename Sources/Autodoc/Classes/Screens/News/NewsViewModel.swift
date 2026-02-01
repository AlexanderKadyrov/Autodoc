import Foundation
import Combine
import UIKit
import UI

final public class NewsViewModel {
    
    let collectionDataSourceAdapter: CollectionDataSourceAdapter = {
        let adapter = CollectionDataSourceAdapter()
        adapter.append(sections: [NewsCollectionSectionViewModel()])
        return adapter
    }()
    
    public init() {
        
    }
}
