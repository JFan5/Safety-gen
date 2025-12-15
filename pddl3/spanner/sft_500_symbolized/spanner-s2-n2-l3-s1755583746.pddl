; params: python3 /home/fjl2401/Safety-gen/spanner/spanner-generator.py 2 2 3 --seed 1755583746 --problem-name spanner-s2-n2-l3-s1755583746
(define (problem spanner-s2-n2-l3-s1755583746)
 (:domain spanner)
 (:objects 
     obj_10 - type_2
     obj_01 obj_09 - type_5
     obj_02 obj_07 - type_4
     obj_06 obj_04 obj_08 - type_3
     obj_03 obj_05 - type_3
    )
 (:init 
    (pred_1 obj_10 obj_03)
    (pred_1 obj_01 obj_04)
    (pred_6 obj_01)
    (pred_1 obj_09 obj_08)
    (pred_6 obj_09)
    (pred_4 obj_02)
    (pred_1 obj_02 obj_05)
    (pred_4 obj_07)
    (pred_1 obj_07 obj_05)
    (pred_5 obj_03 obj_06)
    (pred_5 obj_08 obj_05)
    (pred_5 obj_06 obj_04)
    (pred_5 obj_04 obj_08)
)
 (:goal
  (and
   (pred_2 obj_02)
   (pred_2 obj_07)
))
(:constraints
  (and
    (always (imply (not (pred_2 obj_02)) (not (pred_2 obj_07))))
    (forall (?m - type_2) (at-most-once (pred_1 ?m obj_03)))
  )
)
)
