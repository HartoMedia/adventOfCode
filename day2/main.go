package main

import (
	"bufio"
	"fmt"
	"os"
	"strconv"
	"strings"
)

func isRepeatedTwice(n int) bool {
	s := strconv.Itoa(n)
	if len(s)%2 != 0 {
		return false
	}

	half := len(s) / 2
	left := s[:half]
	right := s[half:]

	return left == right
}

func main() {
	scanner := bufio.NewScanner(os.Stdin)
	scanner.Scan()
	line := strings.TrimSpace(scanner.Text())

	ranges := strings.Split(line, ",")

	var total int64 = 0

	for _, r := range ranges {
		if r == "" {
			continue
		}

		parts := strings.Split(r, "-")
		start, _ := strconv.Atoi(parts[0])
		end, _ := strconv.Atoi(parts[1])

		for i := start; i <= end; i++ {
			if isRepeatedTwice(i) {
				total += int64(i)
			}
		}
	}

	fmt.Println(total)
}
