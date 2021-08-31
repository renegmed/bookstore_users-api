package app

import (
	"fmt"

	"github.com/gin-gonic/gin"
	"github.com/renegmed/bookstore_utils-go/logger"
)

var (
	router = gin.Default()
)

func StartApplication(addr string) {
	mapUrls()

	logger.Info(fmt.Sprintf("about to start the application with address %s", addr))
	router.Run(addr)
}
