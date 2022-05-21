//
//  Crypto.swift
//  MetaStonks
//
//  Created by Rafael Patino on 20/05/22.
//

import Foundation
import SwiftUI

extension String {

    var length: Int {
        return count
    }

    subscript (i: Int) -> String {
        return self[i ..< i + 1]
    }

    func substring(fromIndex: Int) -> String {
        return self[min(fromIndex, length) ..< length]
    }

    func substring(toIndex: Int) -> String {
        return self[0 ..< max(0, toIndex)]
    }

    subscript (r: Range<Int>) -> String {
        let range = Range(uncheckedBounds: (lower: max(0, min(length, r.lowerBound)),
                                            upper: min(length, max(0, r.upperBound))))
        let start = index(startIndex, offsetBy: range.lowerBound)
        let end = index(start, offsetBy: range.upperBound - range.lowerBound)
        return String(self[start ..< end])
    }
}

struct CryptoView: View {
    @State var results_api = [DataStruct]()
    var body: some View {
        VStack{
            Text("Crypto 🚀")
                .padding(.top, 30)
                .font(.system(size: 36.0))
            
            List(results_api) { item in
                
                HStack{
                    VStack(alignment: .leading, spacing: 6){
                        Text("$" + item.token)
                            .font(.system(size: 20))
                        Text("Posts: " + String(item.ocurrences)).foregroundColor(.gray)
                        Text("Upvotes: " + String(item.upvote_ratio)).foregroundColor(.gray)
                        Text("Reddit score: " + String(item.score)).foregroundColor(.gray)
                        Text("Sentimiento: " + String(item.title_sentiment)).foregroundColor(.gray)
                        Text("Premios: " + String(item.award)).foregroundColor(.gray)
                    }
                    Spacer()
                    
                    let metascore_str = String(item.metascore)
                
                    VStack{
                        Text("metascore:")
                        Text("[" + metascore_str[0 ..< 4] + "]")
                            .font(.system(size: 35))
                            .foregroundColor(
                                (item.metascore >= 60) ? .green : ((item.metascore < 60 && item.metascore > 30) ? .yellow : .red)
                            )
                    }
                    
                }
                
            }.onAppear() {
                Api().loadData { (item) in
                    self.results_api = item
                }
            }
            
        }
    }
}
