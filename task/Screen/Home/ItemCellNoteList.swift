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
    var id: Int
    @State var isFavorite: Bool = false
    
    init(id: Int, title: String, isFavorite: Bool) {
        self.id = id
        self.title = title
        _isFavorite = State(initialValue: isFavorite)
    }
    
    var body: some View {
        HStack {
            GeometryReader { geo in
                HStack {
                    NavigationLink(destination: {
                        Text("des")
                    }, label: {
                        Text(title).frame(alignment: .center).onTapGesture {
                            
                        }
                    })
                }.onTapGesture {
                    
                }
            }.onTapGesture {
                print("----> " + title)
            }
            Spacer()
            if $isFavorite.wrappedValue {
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
        }.onTapGesture {
            print("xxxxxx")
        }
    }
}
//
//struct ItemCellNoteList_Previews: PreviewProvider {
//    static var previews: some View {
//        ItemCellNoteList()
//    }
//}
