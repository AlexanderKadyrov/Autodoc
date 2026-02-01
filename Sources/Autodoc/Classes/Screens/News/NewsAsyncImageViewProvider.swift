import Foundation
import Network
import UIKit
import DI
import UI

final class NewsAsyncImageViewProvider: AsyncImageViewProvider {
    
    private enum Constants {
        static let placeholder = UIImage(named: "pattern_mechanical")
    }
    
    private let url: URL?
    
    init(url: URL?) {
        self.url = url
    }
    
    func fetchImage() async -> UIImage? {
        guard let url else {
            return Constants.placeholder
        }
        do {
            @DI(\.imageService) var imageService
            return try await imageService.fetchImage(url: url)
        } catch {
            return Constants.placeholder
        }
    }
}
