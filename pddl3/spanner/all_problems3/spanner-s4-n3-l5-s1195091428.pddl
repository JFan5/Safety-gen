; params: python3 /home/jfan5/Safety-gen/pddl3/spanner/spanner-generator.py 4 3 5 --seed 1195091428 --problem-name spanner-s4-n3-l5-s1195091428
(define (problem spanner-s4-n3-l5-s1195091428)
 (:domain spanner)
 (:objects 
     bob - man
     spanner1 spanner2 spanner3 spanner4 - spanner
     nut1 nut2 nut3 - nut
     location1 location2 location3 location4 location5 - location
     shed gate - location
    )
 (:init 
    (at bob shed)
    (at spanner1 location1)
    (useable spanner1)
    (at spanner2 location4)
    (useable spanner2)
    (at spanner3 location4)
    (useable spanner3)
    (at spanner4 location4)
    (useable spanner4)
    (loose nut1)
    (at nut1 gate)
    (loose nut2)
    (at nut2 gate)
    (loose nut3)
    (at nut3 gate)
    (link shed location1)
    (link location5 gate)
    (link location1 location2)
    (link location2 location3)
    (link location3 location4)
    (link location4 location5)
)
 (:goal
  (and
   (tightened nut1)
   (tightened nut2)
   (tightened nut3)
))
(:constraints
  (and
    (sometime-before (tightened nut1) (tightened nut3))
    (sometime-before (tightened nut2) (tightened nut3))
  )
)
)
