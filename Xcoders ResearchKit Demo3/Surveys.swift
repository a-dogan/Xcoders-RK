//
//  Surveys.swift
//  Xcoders ResearchKit Demo3
//
//  Created by Dogan, Art on 5/25/15.
//  Copyright (c) 2015 artdog, Inc. All rights reserved.
//

import ResearchKit

class Survey {
    
    //MARK: Question steps
    var instructionStep:ORKInstructionStep {
        let instruction = ORKInstructionStep(identifier: "SurveyInstructionStep")
        instruction.title = "Daily fasting question survey"
        instruction.text = "This is your daily fasting study. This brief survey will ask you a few questions about your fasting. Please answer accuratley to the best of your knowledge"
        
        return instruction
    }
    
    
    var didFastQuestion:ORKQuestionStep {
        let question = ORKQuestionStep(identifier: "DidFastBoolQuestion")
        question.optional = false
        question.title = "Did you fast today?"
        //Only uses Yes, No answers
        question.answerFormat = ORKBooleanAnswerFormat()
        
        return question
    }
    
    
    var hoursOfFastingQuestion:ORKQuestionStep {
        let question = ORKQuestionStep(identifier: "HoursFastingQuestion")
        question.optional = false
        question.title = "How many hours did you fast today"
        question.answerFormat = ORKNumericAnswerFormat(style: ORKNumericAnswerStyle.Integer, unit: "Hours", minimum: 0, maximum: 24)
        
        return question
    }
    
    
    var moodQuestion:ORKQuestionStep {
        let question = ORKQuestionStep(identifier: "MoodQuestion")
        question.optional = false
        question.title = "How's your mood today?"
        question.text = "Choose a numeric value from 1 to 5 indicating your overall mood for today. One being irritable and unpleasant, and 5 being in a great mood."
        question.answerFormat = ORKScaleAnswerFormat(maximumValue: 5, minimumValue: 1, defaultValue: 3, step: 1)
        
        return question
    }
    
    
    var weightQuestion:ORKQuestionStep {
        let question = ORKQuestionStep(identifier: "Weight")
        question.title = "Current Weight"
        question.answerFormat = ORKNumericAnswerFormat(style: ORKNumericAnswerStyle.Integer, unit: "LBS", minimum: 0, maximum: 1000)
        
        return question
    }
    
    
    var weightAgainQuestion:ORKQuestionStep {
        let question = ORKQuestionStep(identifier: "WeightAgainQuestion")
        question.title = "Current Weight AGAIN"
        question.answerFormat = ORKNumericAnswerFormat(style: ORKNumericAnswerStyle.Integer, unit: "LBS", minimum: 0, maximum: 1000)
        
        return question
    }
    
    func dailySurveyQuestions() -> ORKOrderedTask {
        return ORKOrderedTask(identifier: "DailySurveyQuestions", steps: [instructionStep, didFastQuestion, hoursOfFastingQuestion, moodQuestion])
    }
    
    
    func dailySurveyChoiceQuestions() -> ORKOrderedTask {
        return SurveyOrderedTasks(identifier: "DailySurveyQuestions", steps: [instructionStep, didFastQuestion, hoursOfFastingQuestion, moodQuestion])
    }
}

//MARK: Override ORKOrderedTask to get cusotm logic
class SurveyOrderedTasks:ORKOrderedTask {
    
    override func stepWithIdentifier(identifier: String) -> ORKStep? {
        return super.stepWithIdentifier(identifier)
    }
    
    override func stepBeforeStep(step: ORKStep?, withResult result: ORKTaskResult) -> ORKStep? {
        
        if step?.identifier == "WeightAgainQuestion" {
            return Survey().instructionStep
        }
        
        return super.stepBeforeStep(step, withResult: result)
    }
    
    override func stepAfterStep(step: ORKStep?, withResult result: ORKTaskResult) -> ORKStep? {
        
        if let stepChoice = choiceStepForQuestion(step, withResult: result) {
            return Survey().weightAgainQuestion
        }
        else if step?.identifier == "WeightAgainQuestion" {
            return Survey().moodQuestion
        }
        
        return super.stepAfterStep(step, withResult: result)
    }
    

    private func choiceStepForQuestion(step:ORKStep?, withResult result: ORKTaskResult) -> ORKStep? {
        if step?.identifier == "DidFastBoolQuestion" {
            if let stepResult = result.resultForIdentifier("DidFastBoolQuestion") as? ORKStepResult {
                if let boolResult = stepResult.firstResult as? ORKBooleanQuestionResult {
                    if boolResult.booleanAnswer == 0 {
                        return Survey().weightAgainQuestion
                    }
                }
            }
        }
        
        return nil
    }
}
