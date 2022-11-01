//
//  NoteViewModel.swift
//  task
//
//  Created by ThangTQ on 28/10/2022.
//

import Foundation

class NoteViewModel: BaseViewModel {
    
    @Published var listNote: [ItemNoteModel] = []
    
    func getListNote() {
        service.callApiGet(url: Constant.BASE_URL + "api/note", returnType: [ItemNoteModel].self) { val in
            print(val)
            DispatchQueue.main.async {
                self.listNote = val
            }
        }
    }
    
    func setStar() {
        
    }
    
    func saveNote(title: String, content: String, completed: @escaping (_ id: Int?) -> Void) {
        var body = NoteCreateRequest()
        body.content = content
        body.title = title
        service.post(url: Constant.BASE_URL + "api/note/save", body: body, typeResponse: NoteCreateResponse.self) { val in
            DispatchQueue.main.async {
                completed(val.id)
            }
        }
    }
    
    func updateNote(id: Int, title: String? = nil, content: String? = nil, isFavorite: Bool? = nil,
                    isFirstDisplay: Bool? = nil, isDelete: Bool? = nil,
                    completed: @escaping (_ note: NoteCreateResponse?) -> Void) {
 
        var body = NoteCreateRequest()
        body.content = content
        body.id = id
        body.title = title
        if let isFavorite = isFavorite {
            body.isFavorite = isFavorite
            print(isFavorite)
        }
        if let title = title {
            body.title = title
        }
        if let content = content {
            body.content = content
        }
        if let isDelete = isDelete {
            body.isDelete = isDelete
        }
        if let isFirstDisplay = isFirstDisplay {
            body.isFirstDisplay = isFirstDisplay
        }
        print(body)
        service.put(url: Constant.BASE_URL + "api/note/update", body: body, typeResponse: NoteCreateResponse.self) { val in
            DispatchQueue.main.async {
                completed(val)
            }
        }
    }
}
