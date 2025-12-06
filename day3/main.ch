#!/usr/local/bin/charly

if ARGV.length < 2 {
  print("Missing filepath")
  exit(1)
}

const input_path = ARGV[1]
const input = readfile(input_path)

let result = 0

const banks = input
	.split("\r\n")
	.map(->(bank) {
		bank.split("").map(->(bttry) bttry.to_number())
	})



func delete_until(list, value) {
    let index = null

    list.each(->(e, i) {
        if e == value && index == null {
            index = i
	    return
        }
    })

    if index != null {
        list.erase(0, index + 1)
    }
    return list
}

func highestNumberNotInLasteleven(list) {
	let listLen = list.length
	const lastEleven = listLen - 12
	
	let sublist = list.sublist(0, lastEleven)

	return sublist.findMax()
}

banks.each(->(zkb) {
	let zwiRes = "0"
	let nr = 0
	nr = highestNumberNotInLasteleven(zkb)

	delete_until(zkb,nr)
	print(nr)
	print(zkb)
	result += zwiRes.to_number()

	print("$$$$$$$$$$$$$$$$$$$$$$$$$$$$")
	
})


print("---------------")
print(result)


