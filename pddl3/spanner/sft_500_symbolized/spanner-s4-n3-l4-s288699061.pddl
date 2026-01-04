; params: python3 /home/fjl2401/Safety-gen/spanner/spanner-generator.py 4 3 4 --seed 288699061 --problem-name spanner-s4-n3-l4-s288699061
(define (problem spanner-s4-n3-l4-s288699061)
 (:domain spanner)
 (:objects 
     obj_11 - type_4
     obj_05 obj_01 obj_09 obj_06 - type_2
     obj_12 obj_03 obj_10 - type_3
     obj_08 obj_07 obj_02 obj_13 - type_1
     obj_14 obj_04 - type_1
    )
 (:init 
    (pred_6 obj_11 obj_14)
    (pred_6 obj_05 obj_08)
    (pred_2 obj_05)
    (pred_6 obj_01 obj_07)
    (pred_2 obj_01)
    (pred_6 obj_09 obj_02)
    (pred_2 obj_09)
    (pred_6 obj_06 obj_07)
    (pred_2 obj_06)
    (pred_3 obj_12)
    (pred_6 obj_12 obj_04)
    (pred_3 obj_03)
    (pred_6 obj_03 obj_04)
    (pred_3 obj_10)
    (pred_6 obj_10 obj_04)
    (pred_1 obj_14 obj_08)
    (pred_1 obj_13 obj_04)
    (pred_1 obj_08 obj_07)
    (pred_1 obj_07 obj_02)
    (pred_1 obj_02 obj_13)
)
 (:goal
  (and
   (pred_4 obj_12)
   (pred_4 obj_03)
   (pred_4 obj_10)
))
(:constraints
  (and
    (always (imply (not (pred_4 obj_12)) (not (pred_4 obj_03))))
    (forall (?m - type_4) (at-most-once (pred_6 ?m obj_14)))
  )
)
)
