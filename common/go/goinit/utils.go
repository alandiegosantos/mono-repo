package goinit

import (
	"syscall"

	log "github.com/sirupsen/logrus"
)

// ensureNotEUID aborts the program if it is running setuid something,
// or being invoked by root.  That is, the preparer isn't setting up
// the program correctly.
func ensureNotEUID() {
	euid := syscall.Geteuid()
	uid := syscall.Getuid()
	egid := syscall.Getegid()
	gid := syscall.Getgid()
	if uid != euid || gid != egid {
		log.Fatalf("go runtime is setuid uids:(%d vs %d), gids(%d vs %d)", uid, euid, gid, egid)
	}
	if uid == 0 {
		log.Fatalf("go runtime is running as root - cheating")
	}
}
