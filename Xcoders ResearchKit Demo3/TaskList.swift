//
//  TaskList.swift
//  Xcoders ResearchKit Demo3
//
//  Created by Dogan, Art on 5/23/15.
//  Copyright (c) 2015 artdog, Inc. All rights reserved.
//

import ResearchKit

enum StepIdentifiers:String {
    case UndefinedStep = "Undefined"
    case VisualConsentStep = "VisualConsentStep"
    case ReviewConsentSignatureStep = "ReviewConsentSignatureStep"
    
    func value() -> String {
        return rawValue
    }
}
