package main

import (
	"fmt"
	"net/http"
)

func main() {
	http.HandleFunc("/ping", func(w http.ResponseWriter, r *http.Request) {
		fmt.Println("pong")
		_, err := w.Write([]byte("pong"))
		if err != nil {
			return
		}
	})

	fmt.Println("starting server on port 8080")
	http.ListenAndServe(":80", nil)
}
