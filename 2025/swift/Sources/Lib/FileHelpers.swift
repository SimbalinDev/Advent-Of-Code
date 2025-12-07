import Foundation

public func getFileContent(
    day: String,
    fileName: String,
    fileType: String = "txt"
) -> String {

    let resourceName = fileName
   
   if let url = Bundle.module.url(
    forResource: resourceName,
    withExtension: fileType,
    subdirectory: "Data/Day\(day)"
   ) {
       return try! String(contentsOf: url, encoding: .utf8)
   }

   // Fallback: current working directory (keeps terminal run behavior)
   let cwd = FileManager.default.currentDirectoryPath
   let fallbackURL = URL(fileURLWithPath: cwd).appendingPathComponent("Data/Day\(day)/\(resourceName).\(fileType)")
   if FileManager.default.fileExists(atPath: fallbackURL.path) {
       return try! String(contentsOf: fallbackURL, encoding: .utf8).trimmingCharacters(in: .whitespacesAndNewlines)
   }

   fatalError("File not found: \(resourceName).\(fileType). Tried Bundle.module and \(fallbackURL.path)")
}

public func getFileLines(
    day: String,
    fileName: String,
    fileType: String = "txt"
) -> [String] {
    return getFileContent(day:day, fileName: fileName, fileType: fileType)
        .split(separator: "\n")
        .map(String.init)
}
