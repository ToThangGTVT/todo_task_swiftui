//
//  ItemCellNoteList.swift
//  task
//
//  Created by ToThang on 10/28/22.
//

import SwiftUI

struct ItemCellNoteList: View {
    
    @EnvironmentObject var noteViewModel: NoteViewModel
    
    var title: String
    @State var isFavorite: Bool = false
    var id: Int
    
    init(id: Int, title: String, isFavorite: Bool) {
        self.id = id
        self.title = title
        self.isFavorite = isFavorite
    }
    
    var body: some View {
        HStack {
            Button(action: {
                print(title)
                
            }) {
                Text(title)
            }.buttonStyle(BorderlessButtonStyle())
            Spacer()
            if isFavorite {
                Button(action: {
                    noteViewModel.updateNote(id: id, isFavorite: false) { note in
                        isFavorite = note?.isFavorite ?? true
                    }
                }) {
                    Image(systemName: "star.fill").foregroundColor(.yellow)
                }.buttonStyle(BorderlessButtonStyle())
            } else {
                Button(action: {
                    noteViewModel.updateNote(id: id, isFavorite: true) { note in
                        isFavorite = note?.isFavorite ?? false
                    }
                }) {
                    Image(systemName: "star").foregroundColor(.gray)
                }.buttonStyle(BorderlessButtonStyle())
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
