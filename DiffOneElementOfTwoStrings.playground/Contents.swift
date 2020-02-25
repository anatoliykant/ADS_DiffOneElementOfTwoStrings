/// Проверить различие строк на один символ
/// Time: O(N), Space: O(1)

var firstString = "Hello"
var secondString = "Hllo"
var thirdString = "Hilll"

func diffOneElement(from firstString: String, second string: String) -> Bool {
	
	/// ### Эти проверки можно убрать без нарушения правильности
	/// выполнения алгоритма - используются только для оптимизации проверки,
	/// если строка большая (например, три тома Война и Мир)
	guard firstString != string else { return true }
	guard
		abs(firstString.count - string.count) < 2,
		let startFirst = firstString.first,
		let endFirst = firstString.last,
		let startSecond = string.first,
		let endSecond = string.last,
		(startFirst == startSecond || endFirst == endSecond)
		else { return false }
	/// ###
	
	
	let firstArray = firstString.map { String($0) }
	let secondArray = string.map { String($0) }
	let minCount = min(firstString.count, secondArray.count)
	var counter = 0
	var index = 0
	
	while index != minCount {
		if index < minCount, firstArray[index] == secondArray[index] {
			counter += 1
		} else if index < firstArray.count - 1, firstArray[index + 1] == secondArray[index] {
			counter += 1
		} else if index < secondArray.count - 1, firstArray[index] == secondArray[index + 1] {
			counter += 1
		} else {
			return false
		}
		index += 1
	}
	
	return counter == minCount
}

print(diffOneElement(from: firstString, second: secondString))

