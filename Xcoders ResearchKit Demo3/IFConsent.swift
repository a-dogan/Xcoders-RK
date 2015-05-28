//
//  IFConsent.swift
//  Xcoders ResearchKit Demo3
//
//  Created by Dogan, Art on 5/15/15.
//  Copyright (c) 2015 artdog, Inc. All rights reserved.
//

import Foundation
import ResearchKit

class IFConsent {
    
    //MARK: VisualConsentSteps
    //Step for the visual description of the study
    func studyOverviewSteps() -> ORKVisualConsentStep {
        let document:ORKConsentDocument = ORKConsentDocument()
        
        // Create additional section objects for later sections
        document.sections = [overviewSection(), dataSectionConsent(), timeSectionConsent(), privateSectionConsent()]
        
        return ORKVisualConsentStep(identifier: StepIdentifiers.VisualConsentStep.value(), document: document)
    }
    
    //MARK: ConsentDocument Signature
    //step for accepting the terms of the study and providing a signature
    func reviewConsent() -> ORKConsentReviewStep {
        let document:ORKConsentDocument = ORKConsentDocument()
        document.title = "Provide Consent"
        document.htmlReviewContent = htmlContent("consent_review")
        
        document.signaturePageTitle = "Sign below to indicate to provide consent"
        
        let participantSignature = ORKConsentSignature(forPersonWithTitle: "Participant", dateFormatString: "MM-DD-YYYY", identifier: "ParticipantSignature")
        participantSignature.requiresSignatureImage = true
        
        document.addSignature(participantSignature)
        
        let reviewStep = ORKConsentReviewStep(identifier: StepIdentifiers.ReviewConsentSignatureStep.value(),
            signature: document.signatures!.first as? ORKConsentSignature,
            inDocument: document)
        
        reviewStep.reasonForConsent = "I agree and give my consent to particpate."
        reviewStep.text = "Please review and accept to participate in this study."
        
        return reviewStep
    }
    
    //MARK: Visual Consent Sections
    private func overviewSection() -> ORKConsentSection {
        let overviewSection = ORKConsentSection(type: ORKConsentSectionType.Overview)
        
        overviewSection.title = "Welcome to the Intermittent Fasting Research Study"
        overviewSection.summary = "This study is for understanding how intermittent fasting affects your daily mood"
        overviewSection.content = "This study is sponsored by the X University, Seattle WA"
        
        return overviewSection
    }
    
    
    private func dataSectionConsent() -> ORKConsentSection {
        let dataSection = ORKConsentSection(type: ORKConsentSectionType.DataGathering)
        dataSection.htmlContent = htmlContent("data_section_descr")
        
        return dataSection
    }
    
    
    private func timeSectionConsent() -> ORKConsentSection {
        let timeSection = ORKConsentSection(type: ORKConsentSectionType.TimeCommitment)
        
        return timeSection
    }
    
    
    private func privateSectionConsent() -> ORKConsentSection {
        let privacySection = ORKConsentSection(type: ORKConsentSectionType.Privacy)
        
        return privacySection
    }
    
    private func htmlContent(documentName:String) -> String? {
        let path:String = NSBundle.mainBundle().pathForResource(documentName, ofType: "html", inDirectory: "HTMLContent")!
        
        return String(contentsOfURL: NSURL(fileURLWithPath: path)!, encoding: NSUTF8StringEncoding, error:nil)
    }
    
}

