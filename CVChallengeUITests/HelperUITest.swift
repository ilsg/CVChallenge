//
//  HelperUITest.swift
//  CVChallengeUITests
//
//  Created by isela on 6/19/19.
//  Copyright © 2019 isela. All rights reserved.
//

import Foundation

class HelperUITest {

    var currentLanguage: (langCode: String, localeCode: String)? {
        let currentLocale = Locale(identifier: Locale.preferredLanguages.first!)
        guard let langCode = currentLocale.languageCode else {
            return nil
        }
        var localeCode = langCode
        if let scriptCode = currentLocale.scriptCode {
            localeCode = "\(langCode)-\(scriptCode)"
        } else if let regionCode = currentLocale.regionCode {
            localeCode = "\(langCode)-\(regionCode)"
        }
        return (langCode, localeCode)
    }
    
    func localizedString(_ key: String) -> String {
        let testBundle = Bundle(for: ExperienceListUITests.self)
        if let currentLanguage = currentLanguage,
            let testBundlePath = testBundle.path(forResource: currentLanguage.localeCode, ofType: "lproj") ?? testBundle.path(forResource: currentLanguage.langCode, ofType: "lproj"),
            let localizedBundle = Bundle(path: testBundlePath)
        {
            return NSLocalizedString(key, bundle: localizedBundle, comment: "")
        }
        return ""
    }
}
