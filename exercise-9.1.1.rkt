;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname |Exercise 9.1.1|) (read-case-sensitive #t) (teachpacks ((lib "guess.ss" "teachpack" "htdp") (lib "master.ss" "teachpack" "htdp") (lib "draw.ss" "teachpack" "htdp") (lib "hangman.ss" "teachpack" "htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "guess.ss" "teachpack" "htdp") (lib "master.ss" "teachpack" "htdp") (lib "draw.ss" "teachpack" "htdp") (lib "hangman.ss" "teachpack" "htdp")))))
;; list of all planets on our solar system
(cons 'Mercury
      (cons 'Venus
            (cons 'Earth
                  (cons 'Mars
                        (cons 'Jupiter
                              (cons 'Saturn
                                    (cons 'Uranus
                                          (cons 'Neptune
                                                empty))))))))

;; a meal
(cons 'steak
      (cons 'pommes-frites
            (cons 'beans
                  (cons 'bread
                        (cons 'water
                              (cons 'juice
                                    (cons 'brie-cheese
                                          (cons 'ice-cream
                                                empty))))))))

;; list of basic colors
(cons 'red
      (cons 'green
            (cons 'blue
                  (cons 'yellow
                        (cons 'purple
                              (cons 'orange
                                    empty))))))
                        
