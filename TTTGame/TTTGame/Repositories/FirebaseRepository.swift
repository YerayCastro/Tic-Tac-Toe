//
//  FirebaseRepository.swift
//  TTTGame
//
//  Created by Yery Castro on 6/9/23.
//

import Foundation
import FirebaseFirestoreSwift
import Combine

public typealias EncodableIdentifiable = Encodable & Identifiable

protocol FirebaseRepositoryProtocol {
    func getDocuments<T: Codable>(from collection: FCollectionReference, for playerId: String) async throws -> [T]?
    
    func listen<T: Codable>(from collection: FCollectionReference, documentId: String) async throws -> AnyPublisher<T?, Error>
    
    func deleteDocument(with id: String, from collection: FCollectionReference)
    
    func saveDocument<T: EncodableIdentifiable>(data: T, to collection: FCollectionReference) throws
}

final class FirebaseRepository: FirebaseRepositoryProtocol {
    func getDocuments<T: Codable>(from collection: FCollectionReference, for playerId: String) async throws -> [T]? {
        
        let snapshot = try await  FirebaserReference(collection)
            .whereField(Constants.player2Id, isEqualTo: "")
            .whereField(Constants.player1Id, isNotEqualTo: playerId).getDocuments()
        
        return snapshot.documents.compactMap { queryDocumentsnapshot -> T? in
            return try? queryDocumentsnapshot.data(as: T.self)
        }
    }
    
    func listen<T: Codable>(from collection: FCollectionReference, documentId: String) async throws -> AnyPublisher<T?, Error> {
        
       let subject = PassthroughSubject<T?, Error>()
        
        let handle = FirebaserReference(collection).document(documentId).addSnapshotListener { FIRQuerySnapshot, error in
            
            if let error = error {
                subject.send(completion: .failure(error))
                return
            }
            
            guard let document = FIRQuerySnapshot else {
                subject.send(completion: .failure(AppError.badSnapshot))
                return
            }
            
            let data = try? document.data(as: T.self)
            
            subject.send(data)
            
        }
        
        return subject.handleEvents(receiveCancel: {
            handle.remove()
        }).eraseToAnyPublisher()
        
    }
    
    func deleteDocument(with id: String, from collection: FCollectionReference) {
        FirebaserReference(collection).document(id).delete()
    }
    
    func saveDocument<T: EncodableIdentifiable>(data: T, to collection: FCollectionReference) throws {
        let id = data.id as? String ?? UUID().uuidString
        
        try FirebaserReference(collection).document(id).setData(from: data.self)
    }
    
    
}
