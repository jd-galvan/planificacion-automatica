(define (problem TRANSPORT-2)
(:domain TRANSPORT)
(:objects 
	c1 c2 c3 - city
	ca1 ca2 ca3 - house
	e1 e2 e3 e4  - station
	a1 a2 - airport
	p1 p2 p3 p4 p5 p6 - package
	d1 d2 d3 d4 - driver
	av1 av2 av3 - airplane
	t1 t2 t3 t4 - train
	f1 f2 f3 f4 f5 f6 f7 - bus
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
	(at ca1 f6)
	(at ca1 p3)
	(at e1 f1)
	(at e1 t4)
	(at e2 t1)
	(at e2 d1)
	(at e2 p5)
	(at a1 av1)
	(at a1 f2)
	(at a1 p4)
	(at ca2 p2)
	(at ca2 d2)
	(at a2 av2)
	(at a2 av3)
	(at a2 f3)
	(at e4 t2)
	(at e4 f7)
	(at ca3 d3)
	(at ca3 f4)
	(at ca3 p6)
  (at e3 d4)
  (at e3 t3)
  (at e3 f5)
	(isavailable f1)
	(isavailable f2)
	(isavailable f3)
	(isavailable f4)
	(isavailable f5)
	(isavailable f6)
	(isavailable f7)
)

(:goal (and (at ca3 p1) (at ca3 p2) (at ca3 p3) (at ca3 p4) (at ca3 p5) (at ca3 p6)))

)
