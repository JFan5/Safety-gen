; params: python3 /home/fjl2401/Safety-gen/spanner/spanner-generator.py 2 2 3 --seed 1755583746 --problem-name spanner-s2-n2-l3-s1755583746
(define (problem spanner-s2-n2-l3-s1755583746)
 (:domain spanner)
 (:objects 
     obj_10 - type_5
     obj_05 obj_07 - type_4
     obj_04 obj_06 - type_2
     obj_08 obj_09 obj_03 - type_3
     obj_01 obj_02 - type_3
    )
 (:init 
    (pred_5 obj_10 obj_01)
    (pred_5 obj_05 obj_09)
    (pred_1 obj_05)
    (pred_5 obj_07 obj_03)
    (pred_1 obj_07)
    (pred_4 obj_04)
    (pred_5 obj_04 obj_02)
    (pred_4 obj_06)
    (pred_5 obj_06 obj_02)
    (pred_3 obj_01 obj_08)
    (pred_3 obj_03 obj_02)
    (pred_3 obj_08 obj_09)
    (pred_3 obj_09 obj_03)
)
 (:goal
  (and
   (pred_2 obj_04)
   (pred_2 obj_06)
))
(:constraints
  (and
    (always (imply (not (pred_2 obj_04)) (not (pred_2 obj_06))))
    (forall (?m - type_5) (at-most-once (pred_5 ?m obj_01)))
  )
)
)
