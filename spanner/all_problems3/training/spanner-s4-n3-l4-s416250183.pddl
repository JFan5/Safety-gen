; params: python3 /home/fjl2401/Safety-gen/spanner/spanner-generator.py 4 3 4 --seed 416250183 --problem-name spanner-s4-n3-l4-s416250183
(define (problem spanner-s4-n3-l4-s416250183)
 (:domain spanner)
 (:objects 
     bob - man
     spanner1 spanner2 spanner3 spanner4 - spanner
     nut1 nut2 nut3 - nut
     location1 location2 location3 location4 - location
     shed gate - location
    )
 (:init 
    (at bob shed)
    (at spanner1 location3)
    (useable spanner1)
    (at spanner2 location2)
    (useable spanner2)
    (at spanner3 location4)
    (useable spanner3)
    (at spanner4 location2)
    (useable spanner4)
    (loose nut1)
    (at nut1 gate)
    (loose nut2)
    (at nut2 gate)
    (loose nut3)
    (at nut3 gate)
    (link shed location1)
    (link location4 gate)
    (link location1 location2)
    (link location2 location3)
    (link location3 location4)
)
 (:goal
  (and
   (tightened nut1)
   (tightened nut2)
   (tightened nut3)
))
(:constraints
  (and
    (sometime-before (tightened nut2) (tightened nut3))
    (forall (?m - man) (at-most-once (at ?m shed)))
  )
)
)
