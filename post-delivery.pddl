(define (domain post-delivery)
    (:requirements :strips)
    
    (:predicates (point ?p) (color ?c) (house ?h)
                 (letter ?l) (postman ?m) (postbox ?b)
                 
                 (connected ?start ?end)
                 (subway-line ?start ?end ?c)
                 (is-station ?p)
                 
                 (house-at ?h ?p)
                 
                 (letter-at-house ?l ?h)
                 
                 (postbox-at ?b ?p)
                 
                 (postman-at ?m ?p)
                 
                 (holds-letter ?m ?l)
                 (delivered ?l)
                 
                 (off-subway ?m)
                 (on-subway ?c ?m))

    (:action pick
       :parameters (?p ?h ?l ?m)
       :precondition (and (point ?p) (house ?h) (letter ?l) (postman ?m)
                          (postman-at ?m ?p)
                          (house-at ?h ?p)
                          (letter-at-house ?l ?h)
			              (not (holds-letter ?m ?l))
			              (off-subway ?m))
       :effect (and (holds-letter ?m ?l)
	                (not (letter-at-house ?l ?h))))

   (:action drop
       :parameters (?p ?b ?l ?m)
       :precondition (and (point ?p) (postbox ?b) (letter ?l) (postman ?m)
                          (postman-at ?m ?p)
                          (postbox-at ?b ?p)
                          (holds-letter ?m ?l)
                          (off-subway ?m))
       :effect (and (not (holds-letter ?m ?l))
                    (delivered ?l)))

    (:action walk
        :parameters (?start ?end ?m)
        :precondition (and (point ?start) (point ?end) (postman ?m)
                           (postman-at ?m ?start)
                           (connected ?start ?end)
                           (off-subway ?m))
        :effect (and (postman-at ?m ?end)
                     (not (postman-at ?m ?start))))

    (:action take-subway1 ;;from station to station
        :parameters (?start ?end ?c ?m)
        :precondition (and (point ?start) (point ?end) (color ?c) (postman ?m)
                           (is-station ?start)
                           (is-station ?end)
                           (postman-at ?m ?start)
                           (subway-line ?start ?end ?c)
                           (off-subway ?m))
        :effect (and (postman-at ?m ?end)
                     (not (postman-at ?m ?start))))
                     
    (:action take-subway2 ;;from station to not station
        :parameters (?start ?end ?c ?m)
        :precondition (and (point ?start) (point ?end) (color ?c) (postman ?m)
                           (is-station ?start)
                           (not (is-station ?end))
                           (postman-at ?m ?start)
                           (subway-line ?start ?end ?c)
                           (off-subway ?m))
        :effect (and (postman-at ?m ?end)
                     (on-subway ?c ?m)
                     (not (postman-at ?m ?start))
                     (not (off-subway ?m))))
    
    (:action take-subway3 ;;from not station to station
        :parameters (?start ?end ?c ?m)
        :precondition (and (point ?start) (point ?end) (color ?c) (postman ?m)
                           (not (is-station ?start))
                           (is-station ?end)
                           (postman-at ?m ?start)
                           (subway-line ?start ?end ?c)
                           (not (off-subway ?m))
                           (on-subway ?c ?m))
        :effect (and (postman-at ?m ?end)
                     (off-subway ?m)
                     (not (postman-at ?m ?start))
                     (not (on-subway ?c ?m))))
    
    (:action take-subway4 ;;from not station to not station
        :parameters (?start ?end ?c ?m)
        :precondition (and (point ?start) (point ?end) (color ?c) (postman ?m)
                           (not (is-station ?start))
                           (not (is-station ?end))
                           (postman-at ?m ?start)
                           (subway-line ?start ?end ?c)
                           (not (off-subway ?m))
                           (on-subway ?c ?m))
        :effect (and (postman-at ?m ?end)
                     (not (postman-at ?m ?start)))))
