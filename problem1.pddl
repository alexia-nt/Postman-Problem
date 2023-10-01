(define (problem problem1)
    (:domain post-delivery)
    
    (:objects p1 p2 p3 p4 p5 p6 p7 p8 p9 p10 p11 p12 p13 p14
              red blue
              house1 house2
              letter1 letter2
              postman1
              postbox1)
    
    (:init (point p1) (point p2) (point p3) (point p4) (point p5) (point p6)
           (point p7) (point p8) (point p9) (point p10) (point p11) (point p12)
           (point p13) (point p14)
           
           (color red) (color blue)
           
           (house house1) (house house2)
           (letter letter1) (letter letter2)
           (postman postman1)
           (postbox postbox1)
           
           (connected p1 p2)
           (connected p2 p1)
           
           (connected p2 p3)
           (connected p3 p2)
           
           (connected p3 p4)
           (connected p4 p3)
           
           (connected p4 p5)
           (connected p5 p4)
           
           (connected p5 p12)
           (connected p12 p5)
           
           (connected p8 p13)
           (connected p13 p8)
           
           (connected p13 p14)
           (connected p14 p13)
           
           (connected p8 p10)
           (connected p10 p8)
           
           (connected p10 p6)
           (connected p6 p10)
           
           (connected p6 p11)
           (connected p11 p6)
           
           (connected p11 p9)
           (connected p9 p11)
           
           (connected p9 p10)
           (connected p10 p9)
           
           (connected p11 p2)
           (connected p2 p11)
           
           ;;red subway line
           (subway-line p5 p7 red)
           (subway-line p7 p8 red)
           (subway-line p8 p6 red)
           (subway-line p6 p5 red)
           
           ;;blue subway line
           (subway-line p5 p7 blue)
           (subway-line p7 p8 blue)
           (subway-line p8 p6 blue)
           (subway-line p6 p2 blue)
           (subway-line p2 p3 blue)
           (subway-line p3 p5 blue)
           
           (is-station p2)
           (is-station p3)
           (is-station p6)
           (is-station p7)
           (is-station p8)
           
           (house-at house1 p13)
           (house-at house2 p10)
           
           (letter-at-house letter1 house1)
           (letter-at-house letter2 house2)
           
           (postbox-at postbox1 p7)
           
           (postman-at postman1 p14)
           
           (off-subway postman1))
           
    (:goal (and (delivered letter1)
                (delivered letter2)
            )
    )
)
