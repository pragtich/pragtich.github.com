;; Manifest gets loaded automatically when doing `guix shell`
;; it does however need authorization:
;; echo $PWD >> /home/pragtich/.config/guix/shell-authorized-directories

; It seems that rubygems is included in ruby

(specifications->manifest
 '("ruby" "bundler" "jekyll" "gcc-toolchain" "make" "git"))
