//
//  AdaptativeGridView.swift
//  Memorize
//
//  Created by Daniel Leon on 11/8/24.
//

import SwiftUI

struct AdaptativeGridView<Item: Identifiable, ItemView: View>: View {
    var items: [Item]
    var content: (Item) -> ItemView
    let aspectRatio: CGFloat = 2/3
    
    var body: some View {
        GeometryReader{ geometry in
            let minimum = gridItemWidth(count: items.count, size: geometry.size, atAspectRatio: aspectRatio)
            LazyVGrid(columns: [GridItem(.adaptive(minimum: minimum), spacing: 0)], spacing: 0) {
                ForEach(items) { item in
                    content(item)
                }
            }
        }
    }
    
    private func gridItemWidth(count: Int, size: CGSize, atAspectRatio aspectRatio: CGFloat) -> CGFloat {
        let count = CGFloat(count)
        var columnCount = 1.0
        
        repeat{
            let width = size.width / columnCount
            let height = width / aspectRatio
            
            let rowCount = (count / columnCount).rounded(.up)
            if rowCount * height < size.height{
                return (size.width / columnCount).rounded(.down)
            }
            columnCount += 1
        } while columnCount < count
        return min(size.width / count, size.height * aspectRatio).rounded(.down)
    }
}

