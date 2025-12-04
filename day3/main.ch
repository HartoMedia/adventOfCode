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
	print(list)
    return list
}

banks.each(->(zkb) {
	let zwiRes = 0
	let max = 0
	let zweiteMax = 0
	// zwiSpi = zwischenspeicher
	let zwiSpi = 0
	const listLen = zkb.length
	print(zkb)
	max = zkb.findMax()
	
	print("max")
	print(max)

	if zkb[listLen-1] == max {
		zwiSpi = zkb.pop()
		zweiteMax = zkb.findMax()
		zwiRes = zweiteMax * 10 + zwiSpi
	} else {
		const newList = delete_until(zkb, max)
		zweiteMax = zkb.findMax()
		zwiRes = max * 10 + zweiteMax
	}

	print(zwiRes)
	
	result += zwiRes

	print("$$$$$$$$$$$$$$$$$$$$$$$$$$$$")
	
})


print("---------------")
print(result)


