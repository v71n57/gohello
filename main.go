package main

import (
    "log"
    "github.com/gofiber/fiber/v2"
    "github.com/gofiber/fiber/v2/middleware/logger"
)

func main() {
    app := fiber.New()    
    app.Use(logger.New())
    routes(app)
    log.Fatal(app.Listen(":80"))
}

func routes(app *fiber.App) {
    app.Get("/", home)
}

func home(c *fiber.Ctx) error {
    c.Set(fiber.HeaderContentType, fiber.MIMETextHTML)
    return c.SendString("<h1>Hello, World 👋!</h1>\r\n")
}
