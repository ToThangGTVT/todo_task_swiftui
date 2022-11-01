//
//  HomeView.swift
//  task
//
//  Created by ToThang on 10/27/22.
//

import SwiftUI

struct HomeView: View {
    
    @EnvironmentObject var noteViewModel: NoteViewModel
    @State var isCreateNotePress: Bool = false
    
    func fetchListNote() {
        noteViewModel.getListNote()
    }
    
    func createNote() {
        isCreateNotePress = true
    }
    
    var body: some View {
        NavigationView {
            VStack {
                Text("Hello, World!")
                Divider()
                List {
                    Section(header: Text("Important tasks")) {
                        ForEach(0 ..< noteViewModel.listNote.count,  id: \.self) { i in
                            ItemCellNoteList(id: noteViewModel.listNote[i].id ?? 0,
                                             title: noteViewModel.listNote[i].title ?? "",
                                             isFavorite: noteViewModel.listNote[i].isFavorite ?? false)
                        }
                    }
                    Button(action: {
                        createNote()
                    }){
                        Text("Tạo note").foregroundColor(.white).frame(maxWidth: .infinity, alignment: .center)
                    }.listRowBackground(Color.blue).sheet(isPresented: $isCreateNotePress, onDismiss: {
                        fetchListNote()
                    }) {
                        NoteCreateView()
                    }
                }
            }
            .background(Color.purple)
        }.onAppear {
            fetchListNote()
        }.toolbar {
            ToolbarItem(placement: ToolbarItemPlacement.principal) {
                Button(action: {}) {
                    Text("add")
                }
            }
        }
    }
}

//struct HomeView_Previews: PreviewProvider {
//    static var previews: some View {
//        HomeView()
//    }
//}
