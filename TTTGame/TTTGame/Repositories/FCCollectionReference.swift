//
//  FCCollectionReference.swift
//  TTTGame
//
//  Created by Yery Castro on 6/9/23.
//

import Foundation
import Firebase

enum FCollectionReference: String {
    case Game
}

func FirebaserReference(_ reference: FCollectionReference) -> CollectionReference {
    Firestore.firestore().collection(reference.rawValue)
}
