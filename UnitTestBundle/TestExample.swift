import XCTest

func lastTidy(from number: Int) -> Int {
    return number
}

extension Int {
    var isTidy: Bool {
        let digits = self.digits
        for (index, _) in digits.enumerated() {
            if index == digits.count - 1 {
                break
            }
            let currentDigit = digits[index]
            let nextDigit = digits[index+1]
            if currentDigit > nextDigit {
                return false
            }
        }
        return true
    }

    var digits: [Int] {
        return "\(self)".flatMap { Int(String($0)) }
    }
}

class TestExample: XCTestCase {

    var sut: SystemUnderTest!

    override func setUp() {
        super.setUp()
        sut = SystemUnderTest()
    }

    func IGNORE_testSample() {
        let sample = """
        4
        132
        1000
        7
        111111111111111110
        """

        let output = sut.methodToTest(sample)

        let expected = """
        Case #1: 129
        Case #2: 999
        Case #3: 7
        Case #4: 99999999999999999
        """
        XCTAssertEqual(expected, output)
    }

    func testSingleDigitReturnsSameDigit() {
        XCTAssertEqual(lastTidy(from: 7), 7)
    }

    func testSameDigitsReturnsSameDigit() {
        XCTAssertEqual(lastTidy(from: 111111), 111111)
    }

    func testIsTidy() {
        XCTAssertTrue(7.isTidy)
        XCTAssertTrue(129.isTidy)
    }

    func testIsNotTidy() {
        XCTAssertFalse(132.isTidy)
    }
}

class SystemUnderTest {
    func methodToTest(_ input: String) -> String {
        return ""
    }
}
