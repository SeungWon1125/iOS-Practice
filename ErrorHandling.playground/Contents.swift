import UIKit

func tryExample1() {
    do {
        let url = URL(string: "https://www.naver.com")!
        // 아래 Data함수는 에러를 던질 수 있는 throwing function이기 때문에 무조건 try를 써줘야 한다.
        // 만약 try문에서 에러가 발생하면 do가 에러를 잡아서 catch문에서 에러를 핸들링한다.
        // 에러가 발생하면 아래 줄로 넘어가지 않고 catch문으로 넘어가게 된다.1
        let data = try Data(contentsOf: url) //url로 접속, data형식으로 변경(바이너리)
        guard let fileContents = String(data: data, encoding: .utf8) else { return }// 바이너리 코드를 다시 String으로
        print(fileContents)
    } catch {
        print("에러발생\(error.localizedDescription)")
    }
}

func tryExample2() {
    let url = URL(string: "https://www.naver.com")!
    guard let data = try? Data(contentsOf: url) else {
        print("에러발생")
        return
    }
    guard let fileContents = String(data: data, encoding: .utf8) else { return }
    print(fileContents)
}

func tryExample3() {
    let url = URL(string: "https://www.naver.com")!
    let data = try! Data(contentsOf: url)
    guard let fileContents = String(data: data, encoding: .utf8) else { return }
    print(fileContents)
}

// 에러를 던지는 함수로 만들어 버리면
// 함수 안에서 에러 처리를 하지 않아도 된다.
// 에러를 상위함수로 넘긴다. Error propagation
func tryExample4() throws {
    let url = URL(string: "https://www.naver.com")!
    let data = try Data(contentsOf: url)
    guard let fileContents = String(data: data, encoding: .utf8) else { return }
    print(fileContents)
}

do {
    try tryExample4()
} catch {
    
}
