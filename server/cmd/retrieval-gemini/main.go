package main

import (
	"log"

	"github.com/gofiber/fiber/v2"
)

func main() {
	// Creates a new Fiber instance.
	app := fiber.New()

	// Routes
	app.Get("/", hello)

	// Prepare a static middleware to serve the built React files.

	// If you serve Single Page Application on "/web", make sure to add basename on BrowserRouter
	// app.Static("/web", "./web/dist")

	app.Static("/", "./web/dist")

	// Prepare a fallback route to always serve the 'index.html', had there not be any matching routes.

	// app.Static("/web/*", "./web/dist/index.html")

	app.Static("*", "./web/dist/index.html")

	// Listen to port 8080.
	log.Fatal(app.Listen(":8080"))
}

// Handler
func hello(c *fiber.Ctx) error {
	return c.SendString("Hello, World 👋!")
}
