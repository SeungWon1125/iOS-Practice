import UIKit
//
//print("시작") // 메인쓰레드
//print("1.Thread:", Thread.current)
//
//Task { // 다른쓰레드로 넘기기
//    print("2.Thread:", Thread.current)
//    var number = 0
//    for i in 0...200000 {
//        number += i
//    }
//    print("결과:", number)
//
//}
//
//
//print("끝")
//print("3.Thread:", Thread.current)

Task {
    await Task.sleep(2_000_000_000) // 함수 설명에 async달려있는 함수는 비동기 처리 해야하는 함수 (오래걸릴 수 있다는 것)
    // async사용된 함수는 Task 안에 써줘야 하고
    // await을 앞에 달아줘야 한다.
}

