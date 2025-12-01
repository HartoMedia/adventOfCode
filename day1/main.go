package main

import (
	"os"
	"strconv"
	"strings"
)

func main() {
	dial := 50
	countIsNull := 0
	content, _ := os.ReadFile("input.txt")
	contentList := strings.Split(string(content), "\r\n")
	for _, v := range contentList {
		s := v[1:]
		int, _ := strconv.Atoi(s)
		number := int % 100
		countIsNull += int / 100
		dial_before := dial
		if v[0] == 'L' {
			dial -= number
			if dial < 0 {
				dial = 100 - dial*-1
				if dial != 0 && dial_before != 0 {
					countIsNull += 1
				}
			}
		}
		if v[0] == 'R' {
			dial += number
			if dial > 99 {
				dial = dial - 100
				if dial != 0 {
					countIsNull += 1
				}
			}
		}
		if dial == 0 {
			countIsNull += 1
		}
	}
}
