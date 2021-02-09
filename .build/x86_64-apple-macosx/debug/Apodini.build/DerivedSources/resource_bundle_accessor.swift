import class Foundation.Bundle

extension Foundation.Bundle {
    static var module: Bundle = {
        let mainPath = Bundle.main.bundlePath + "/" + "Apodini_Apodini.bundle"
        let buildPath = "/Users/sadikekinozbay/Documents/TUM/WS-2/Swift/Apodini-Example-Project/.build/x86_64-apple-macosx/debug/Apodini_Apodini.bundle"

        let preferredBundle = Bundle(path: mainPath)

        guard let bundle = preferredBundle != nil ? preferredBundle : Bundle(path: buildPath) else {
            fatalError("could not load resource bundle: from \(mainPath) or \(buildPath)")
        }

        return bundle
    }()
}