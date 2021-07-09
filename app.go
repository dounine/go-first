package main

import (
	_ "fmt"
	"github.com/gin-gonic/gin"
	_ "github.com/gin-gonic/gin"
	_ "net"
	_ "net/http"
	_ "net/url"
)

func main() {
	r := gin.Default()

	r.GET("/ping", func(context *gin.Context) {
		context.JSON(200, gin.H{
			"code": "ok",
		})
	})

	r.Run(":8080")
}
