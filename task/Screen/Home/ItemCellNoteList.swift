//
//  ItemCellNoteList.swift
//  task
//
//  Created by ToThang on 10/28/22.
//

import SwiftUI

struct ItemCellNoteList: View {
    
    var title: String
    var isFavorite: Bool
    
    init(title: String, isFavorite: Bool) {
        self.title = title
        self.isFavorite = isFavorite
    }
    
    var body: some View {
        HStack {
            Text(title)
            Spacer()
            if isFavorite {
                Image(systemName: "star.fill").foregroundColor(.yellow)
            } else {
                Image(systemName: "star").foregroundColor(.gray)
            }
        }
    }
}
//
//struct ItemCellNoteList_Previews: PreviewProvider {
//    static var previews: some View {
//        ItemCellNoteList()
//    }
//}
