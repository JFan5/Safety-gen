; params: python3 /home/fjl2401/Safety-gen/spanner/spanner-generator.py 2 2 3 --seed 1086521948 --problem-name spanner-s2-n2-l3-s1086521948
(define (problem spanner-s2-n2-l3-s1086521948)
 (:domain spanner)
 (:objects 
     bob - man
     spanner1 spanner2 - spanner
     nut1 nut2 - nut
     location1 location2 location3 - location
     shed gate - location
    )
 (:init 
    (at bob shed)
    (at spanner1 location1)
    (useable spanner1)
    (at spanner2 location2)
    (useable spanner2)
    (loose nut1)
    (at nut1 gate)
    (loose nut2)
    (at nut2 gate)
    (link shed location1)
    (link location3 gate)
    (link location1 location2)
    (link location2 location3)
)
 (:goal
  (and
   (tightened nut1)
   (tightened nut2)
))
(:constraints
  (and
    (sometime-before (tightened nut1) (tightened nut2))
    (forall (?m - man) (at-most-once (at ?m shed)))
  )
)
)
