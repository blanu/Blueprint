import XCTest
@testable import Blueprint
import Text

final class BlueprintTests: XCTestCase
{
    func testCaseEmpty() throws
    {
        let blueprint = Case(name: "foo", value: nil)
        let correct = """
        case foo
        """.text

        let result = try blueprint.transpile(.swift)

        XCTAssertEqual(correct, result)
    }

    func testCaseWithValue() throws
    {
        let blueprint = Case(name: "foo", value: Type.named("String"))
        let correct = """
        case foo(String)
        """.text

        let result = try blueprint.transpile(.swift)

        XCTAssertEqual(correct, result)
    }

    func testConstructor() throws
    {
        let blueprint = Constructor(
            visibility: .public,
            parameters: [
                Parameter(name: "host", type: Type.named("String")),
                Parameter(name: "port", type: Type.named("Int")),
            ],
            failable: true,
            throwing: true
        )
        let correct = """
        public init?(host: String, port: Int) throws
        {
        
        }
        """.text

        let result = try blueprint.transpile(.swift)

        XCTAssertEqual(correct, result)
    }

    func testEnumeration() throws
    {
        let blueprint = Enumeration(
            visibility: .public,
            name: "TestEnum",
            implements: ["Codable"],
            cases: [
                Case(name: "first"),
                Case(name: "second", value: Type.named("Int")),
            ]
        )
        let correct = """
        public enum TestEnum: Codable
        {
            case first
            case second(Int)
        }
        """.text

        let result = try blueprint.transpile(.swift)

        XCTAssertEqual(correct, result)
    }

    func testExpression() throws
    {
        let blueprint = Expression.value(.literal(.number(1)))
        let correct: Text = "1"

        let result = try blueprint.transpile(.swift)

        XCTAssertEqual(result, correct)
    }

    func testFileHeader() throws
    {
        let filename = "Test"
        let now = Date()
        let correct = """
        //
        //  \(filename).swift
        //
        //
        //  Created by the Daydream Compiler on \(now).
        //
        """.text

        let header = FileHeader(filename: "Test")
        let result = try header.transpileSwift(0)

        XCTAssertEqual(result, correct)
    }

    func testFunction() throws
    {
        let blueprint = Function(
            visibility: .public,
            name: "connect",
            parameters: [
                Parameter(name: "host", type: .named("String")),
                Parameter(name: "port", type: .named("Int")),
            ],
            returnType: .named("Connection"),
            throwing: true
        )
        let correct = """
        public func connect(host: String, port: Int) throws -> Connection
        {
        
        }
        """.text

        let result = try blueprint.transpile(.swift)

        XCTAssertEqual(correct, result)
    }

    func testGlobalImportTarget() throws
    {
        let blueprint = GlobalImportTarget.Text
        let correct = "import Text".text

        let result = try blueprint.transpile(.swift)

        XCTAssertEqual(correct, result)
    }

    func testImportSection() throws
    {
        let blueprint = ImportSection(.Text, .BigNumber)
        let correct = """
        import Text
        import BigNumber
        
        """.text

        let result = try blueprint.transpile(.swift)

        XCTAssertEqual(result, correct)
    }

    func testLiteralValue() throws
    {
        let blueprint = LiteralValue.number(1)
        let correct: Text = "1"

        let result = try blueprint.transpile(.swift)

        XCTAssertEqual(result, correct)
    }

    func testMutability() throws
    {
        let blueprint = Mutability.mutable
        let correct: Text = "var"

        let result = try blueprint.transpile(.swift)

        XCTAssertEqual(result, correct)
    }

    func testParameter() throws
    {
        let blueprint = Parameter(name: "host", type: .named("String"))
        let correct: Text = "host: String"

        let result = try blueprint.transpile(.swift)

        XCTAssertEqual(result, correct)
    }

    func testPassSemantics() throws
    {
        let blueprint = PassingSemantics.reference
        let correct: Text = "class"

        let result = try blueprint.transpile(.swift)

        XCTAssertEqual(result, correct)
    }

    func testProperty() throws
    {
        let blueprint = Property(name: "host", type: .named("String"))
        let correct: Text = "public let host: String"

        let result = try blueprint.transpile(.swift)

        XCTAssertEqual(result, correct)
    }

    func testStatement() throws
    {
        let blueprint = Statement.assignment(LValue.variable("x"), .value(.literal(.number(1))))
        let correct: Text = "x = 1"

        let result = try blueprint.transpile(.swift)

        XCTAssertEqual(result, correct)
    }

    func testStructure() throws
    {
        let blueprint = Structure(passing: .reference, visibility: .public, name: "Test", inherits: [], implements: ["Codable"])
        let correct = """
        public class Test: Codable
        {

        }
        """.text

        let result = try blueprint.transpile(.swift)

        XCTAssertEqual(result, correct)
    }

    func testType() throws
    {
        let blueprint = Type.named("String")
        let correct: Text = "String"

        let result = try blueprint.transpile(.swift)

        XCTAssertEqual(result, correct)
    }

    func testValue() throws
    {
        let blueprint = RValue.variable("x")
        let correct: Text = "x"

        let result = try blueprint.transpile(.swift)

        XCTAssertEqual(result, correct)
    }

    func testVisibility() throws
    {
        let blueprint = Visibility.public
        let correct: Text = "public "

        let result = try blueprint.transpile(.swift)

        XCTAssertEqual(result, correct)
    }
}
