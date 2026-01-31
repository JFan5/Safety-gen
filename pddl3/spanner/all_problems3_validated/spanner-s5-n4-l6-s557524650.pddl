; params: python3 /home/jfan5/Safety-gen/pddl3/spanner/spanner-generator.py 5 4 6 --seed 557524650 --problem-name spanner-s5-n4-l6-s557524650
(define (problem spanner-s5-n4-l6-s557524650)
 (:domain spanner)
 (:objects 
     bob - man
     spanner1 spanner2 spanner3 spanner4 spanner5 - spanner
     nut1 nut2 nut3 nut4 - nut
     location1 location2 location3 location4 location5 location6 - location
     shed gate - location
    )
 (:init 
    (at bob shed)
    (at spanner1 location4)
    (useable spanner1)
    (at spanner2 location1)
    (useable spanner2)
    (at spanner3 location3)
    (useable spanner3)
    (at spanner4 location5)
    (useable spanner4)
    (at spanner5 location4)
    (useable spanner5)
    (loose nut1)
    (at nut1 gate)
    (loose nut2)
    (at nut2 gate)
    (loose nut3)
    (at nut3 gate)
    (loose nut4)
    (at nut4 gate)
    (link shed location1)
    (link location6 gate)
    (link location1 location2)
    (link location2 location3)
    (link location3 location4)
    (link location4 location5)
    (link location5 location6)
)
 (:goal
  (and
   (tightened nut1)
   (tightened nut2)
   (tightened nut3)
   (tightened nut4)
))
(:constraints
  (and
    (sometime-before (tightened nut2) (tightened nut1))
    (sometime-before (tightened nut3) (tightened nut1))
  )
)
)
