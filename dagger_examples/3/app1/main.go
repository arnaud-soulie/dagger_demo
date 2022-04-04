package main

import (
	"fmt"
	"os"

	"dagger.io/test/greeting"
)

func main() {
	name := os.Getenv("NAME")
	if name == "" {
		name = "Johfdfdn Doe"
	}
	fmt.Printf(greeting.Greeting(name))
}
