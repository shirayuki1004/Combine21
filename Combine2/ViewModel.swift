//
//  ViewModel.swift
//  Combine2
//
//  Created by cmStudent on 2022/07/11.
//

import Foundation
import Combine
 
final class WebAPIViewModel: ObservableObject {
    @Published var joke: String = ""
    
    @Published var List:[String] = []
    
    private var cancellables: [AnyCancellable] = []
    
    // キャンセルするときに利用
    deinit {
        cancellables.forEach { cancellable in
            cancellable.cancel()
        }
    }
    
    func fetchJoke() {
        guard let url = URL(string: "https://icanhazdadjoke.com/") else {
            return
        }
            
        var urlRequest = URLRequest(url: url)
        urlRequest.setValue("application/json", forHTTPHeaderField: "Accept")
        
        // Publisher
        URLSession.shared.dataTaskPublisher(for: urlRequest)
        // operator
            .tryMap { (data: Data, _: URLResponse) in return data }
            .decode(type: JokeResponse.self, decoder: JSONDecoder())
            .receive(on: DispatchQueue.main)
        // Publisherを購読する(Subscriber)
            .sink(receiveCompletion: { completion in
                switch completion {
                case .finished: // 終わった時
                    print("Finish.")
                case .failure(let error): // エラーの時
                    print(error)
                }
            }, receiveValue: { [weak self] response in // 受け取った時
                self?.joke = response.joke
                self!.List.append(self?.joke ?? "値なし")
                print("配列の中身：\(self!.List)")
            })
        // AnyCancellableという配列に保持しておく

            .store(in: &cancellables)
    }
}
