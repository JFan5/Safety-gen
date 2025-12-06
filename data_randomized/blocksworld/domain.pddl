(define (domain blocksworld)
  (:requirements :strips :constraints :negative-preconditions)
  (:predicates (p5 ?x)
               (p2 ?x)
               (p3)
               (p1 ?x)
               (p4 ?x ?y))

  (:action a3
    :parameters (?ob)
    :precondition (and (p5 ?ob) (p2 ?ob) (p3))
    :effect (and (p1 ?ob) (not (p5 ?ob)) (not (p2 ?ob)) 
                 (not (p3))))

  (:action a1
    :parameters  (?ob)
    :precondition (p1 ?ob)
    :effect (and (p5 ?ob) (p3) (p2 ?ob) 
                 (not (p1 ?ob))))

  (:action a4
    :parameters  (?ob ?underob)
    :precondition (and (p5 ?underob) (p1 ?ob))
    :effect (and (p3) (p5 ?ob) (p4 ?ob ?underob)
                 (not (p5 ?underob)) (not (p1 ?ob))))

  (:action a2
    :parameters  (?ob ?underob)
    :precondition (and (p4 ?ob ?underob) (p5 ?ob) (p3))
    :effect (and (p1 ?ob) (p5 ?underob)
                 (not (p4 ?ob ?underob)) (not (p5 ?ob)) (not (p3)))))
