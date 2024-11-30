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

  (:predicates (in ?c - city ?x - location)
               (at ?l - location ?x - locatable)
               (isconnected ?l1 - location ?l2 - location)
               (transportedby ?p - package ?x - motransporation)
               (drivenby ?f - bus ?d - driver)
               (isavailable ?x - bus)           
  )

  (:action loadPackage
	     :parameters (?p - package ?l1 - location ?f - motransporation)
	     :precondition (and (at ?l1 ?p) (at ?l1 ?f))
           :effect
	               (and (not (at ?l1 ?p)) (transportedby ?p ?f)))


 (:action walk
	     :parameters (?l1 - location ?l2 - location ?d - driver ?c - city)
	     :precondition (and (in ?c ?l1) (in ?c ?l2) (at ?l1 ?d))
    	     :effect
	     (and (at ?l2 ?d) (not (at ?l1 ?d))))


 (:action geton
	     :parameters (?l1 - location ?d - driver ?f - bus)
	     :precondition (and (at ?l1 ?d) (at ?l1 ?f) (isavailable ?f))                              
	     :effect
	     (and 
        (drivenby ?f ?d) 
        (not (isavailable ?f))
        (not (at ?l1 ?d)) 
        ))

(:action getoff
	     :parameters (?l1 - location ?d - driver ?f - bus)
	     :precondition (and (at ?l1 ?f) (drivenby ?f ?d))                              
	     :effect
	     (and (not (drivenby ?f ?d)) (at ?l1 ?d) (isavailable ?f)))

 (:action moveF
	     :parameters (?l1 - location ?l2 - location ?d - driver ?c - city ?f - bus)
	     :precondition (and (in ?c ?l1) (in ?c ?l2) (at ?l1 ?f) (drivenby ?f ?d))                              
	     :effect
	     (and (at ?l2 ?f) (not (at ?l1 ?f))))

(:action moveA
      :parameters (?av - airplane ?a1 - airport ?a2 - airport)
      :precondition (and (at ?a1 ?av) (isconnected ?a1 ?a2))
      :effect
	     (and (at ?a2 ?av) (not (at ?a1 ?av))))

(:action moveT
      :parameters (?t - train ?e1 - station ?e2 - station)
      :precondition (and (at ?e1 ?t) (isconnected ?e1 ?e2))
      :effect
	     (and (at ?e2 ?t) (not (at ?e1 ?t))))

(:action unloadPackage
	     :parameters (?p - package ?l1 - location ?f - motransporation)
	     :precondition (and (transportedby ?p ?f) (at ?l1 ?f))
           :effect
	               (and (at ?l1 ?p) (not (transportedby ?p ?f))))
 
)
