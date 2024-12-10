(define (problem TRANSPORT-1)
(:domain TRANSPORT)
(:objects 
	c1 c2 c3 - city
	ca1 ca2 ca3 - house
	e1 e2 e3 e4  - station
	a1 a2 - airport
	p1 p2 p3 p4 p5 p6 p7 p8 p9 - package
	d1 d2 d3 - driver
	av1 av2 - airplane
	t1 t2 - train
	f1 f2 f3 f4 - bus
)

(:init
	(in c1 ca1)
	(in c1 e1)
	(in c1 e2)
	(in c1 a1)
	(in c2 ca2)
	(in c2 e3)
	(in c2 a2)
	(in c3 ca3)
	(in c3 e4)
	(at ca1 p1)
	(at e1 f1)
	(at e1 p6)
	(at e2 t1)
	(at e2 d1)
	(at e2 p7)
	(at a1 av1)
	(at a1 f2)
	(at a1 p5)
	(at ca2 p2)
	(at ca2 d2)
	(at a2 av2)
	(at a2 p4)
	(at a2 f3)
  (at e3 p3)
	(at e4 t2)
	(at e4 p8)
	(at ca3 d3)
	(at ca3 f4)
	(at ca3 p9)
	(isavailable f1)
	(isavailable f2)
	(isavailable f3)
	(isavailable f4)
)

(:goal (at ca2 package)

)
