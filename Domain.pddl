;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; TRANSPORT
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(define (domain TRANSPORT)
  (:requirements :typing)
  (:types
    city
    location                    
    locatable                   
    house - location             
    station - location          
    airport - location          
    package - locatable         
    driver - locatable          
    motransporation - locatable 
    airplane - motransporation  
    train - motransporation     
    bus - motransporation       
  )

  (:predicates (in ?c - city ?x - (either location locatable))
               (at ?l - location ?x - locatable)
               (isconnected ?l1 - location ?l2 - location)
               (transportedby ?p - package ?x - motransporation)
               (drivenby ?f - bus ?d - driver)
               (isavailable ?x - (either bus driver))
               (unavailablebuses ?l - location)             
  )

  (:action loadPackage
	     :parameters (?p - package ?h - house ?d - driver ?f - bus)
	     :precondition (and (at ?h ?d) (at ?h ?p) (drivenby ?f ?d))
           :effect
	               (and (not (at ?h ?p))(transportedby ?p ?f)))


 (:action walk
	     :parameters (?l1 - location ?l2 - location ?d - driver ?c - city)
	     :precondition (and (in ?c ?l1) (in ?c ?l2) (at ?l1 ?d)
                              (unavailablebuses ?l1) (isavailable ?d))
    	     :effect
	     (and (at ?l2 ?d) (not (at ?l1 ?d))))


 (:action geton
	     :parameters (?l1 - location ?d - driver ?f - bus)
	     :precondition (and (at ?l1 ?d) (at ?l1 ?f) (isavailable ?d) (isavailable ?f))                              
	     :effect
	     (and 
        (drivenby ?f ?d) 
        (not (isavailable ?d)) 
        (not (isavailable ?f)) 
        (when 
            (forall (?b - bus) (or (not (at ?l1 ?b)) (not (isavailable ?b))))
            (unavailablebuses ?l1)
        )))


 (:action moveF
	     :parameters (?l1 - location ?l2 - location ?d - driver ?c - city ?f - bus)
	     :precondition (and (in ?c ?l1) (in ?c ?l2) (at ?l1 ?d) (at ?l1 ?f) (drivenby ?f ?d))                              
	     :effect
	     (and (at ?l2 ?d) (at ?l2 ?f) (not (at ?l1 ?d)) (not (at ?l1 ?f))))


 (:action transferPackage
	     :parameters (?p - package ?m1 - motransporation ?m2 - motransporation ?l - location)
	     :precondition (and (at ?l ?m1) (at ?l ?m2) (transportedby ?p ?m1))
    	     :effect
	     (and (transportedby ?p ?m2) (not (transportedby ?p ?m1))))


 (:action moveToA
	     :parameters (?t - (either train airplane) ?e1 - (either station airport) ?e2 - (either station airport))
	     :precondition (and (at ?e1 ?t) (isconnected ?e1 ?e2))
    	     :effect
	     (and (at ?e2 ?t) (not (at ?e1 ?t))))


(:action deliverPackage
	     :parameters (?p - package ?h - house ?d - driver ?f - bus)
	     :precondition (and (transportedby ?p ?f) (at ?h ?f) (drivenby ?f ?d))
           :effect
	               (and (at ?h ?p) (not (transportedby ?p ?f))))
 
)
