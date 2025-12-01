#!/usr/local/bin/charly

if ARGV.length < 2 {
        print("Please attach file")
        exit(1)
}

let dial = 50
let countIsNull = 0
let dial_before = 50

const inputfilepath = ARGV[1]

const input = readfile(inputfilepath)

const list = input
        .split("\n")
        .map(->(line) {
                const dir = line.substring(0, 1)
                const count = line.substring(1).to_number()
                return (dir, count)
        })

list.each(->(ding) {
        const (dir, count) = ding
        const num = count % 100
        countIsNull += (count / 100).floor()
        dial_before = dial
        
        switch dir {
            case "L" {
                dial -= num
                if dial < 0 {
                    dial = 100 - dial * -1
                    if dial != 0 && dial_before != 0 {
                        countIsNull += 1
                    }
                }
            }
            case "R" {
                dial += num
                if dial > 99 {
                    dial = dial - 100
                    if dial != 0 {
                        countIsNull += 1
                    }
                }
            }
        }

        if dial == 0 {
            countIsNull += 1
        }
})

print(countIsNull)

