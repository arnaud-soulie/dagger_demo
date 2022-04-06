package main

import (
	"fmt"
	"html/template"
	"log"
	"net/http"
	"os"
)

func main() {
	log.SetFlags(log.Lshortfile)

	heure, _ := os.ReadFile("buildtime.txt")
	fs := http.FileServer(http.Dir("./static"))
	http.Handle("/static/", http.StripPrefix("/static/", fs))
	http.HandleFunc("/", func(w http.ResponseWriter, r *http.Request) {
		tmpl, err := template.ParseFiles("index.html")
		if err != nil {
			http.Error(w, err.Error(), http.StatusInternalServerError)
		}

		data := struct {
			Heure string
		}{
			Heure: string(heure),
		}

		err = tmpl.Execute(w, data)
		if err != nil {
			http.Error(w, err.Error(), http.StatusInternalServerError)
		}
	})

	fmt.Println("http://127.0.0.1:3000")
	log.Fatalln(http.ListenAndServe("127.0.0.1:3000", nil))
}
