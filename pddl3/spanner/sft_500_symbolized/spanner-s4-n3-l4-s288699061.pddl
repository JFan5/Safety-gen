; params: python3 /home/fjl2401/Safety-gen/spanner/spanner-generator.py 4 3 4 --seed 288699061 --problem-name spanner-s4-n3-l4-s288699061
(define (problem spanner-s4-n3-l4-s288699061)
 (:domain spanner)
 (:objects 
     obj_02 - type_2
     obj_07 obj_10 obj_12 obj_13 - type_5
     obj_08 obj_09 obj_14 - type_3
     obj_01 obj_06 obj_04 obj_03 - type_1
     obj_05 obj_11 - type_1
    )
 (:init 
    (pred_6 obj_02 obj_05)
    (pred_6 obj_07 obj_01)
    (pred_3 obj_07)
    (pred_6 obj_10 obj_06)
    (pred_3 obj_10)
    (pred_6 obj_12 obj_04)
    (pred_3 obj_12)
    (pred_6 obj_13 obj_06)
    (pred_3 obj_13)
    (pred_5 obj_08)
    (pred_6 obj_08 obj_11)
    (pred_5 obj_09)
    (pred_6 obj_09 obj_11)
    (pred_5 obj_14)
    (pred_6 obj_14 obj_11)
    (pred_4 obj_05 obj_01)
    (pred_4 obj_03 obj_11)
    (pred_4 obj_01 obj_06)
    (pred_4 obj_06 obj_04)
    (pred_4 obj_04 obj_03)
)
 (:goal
  (and
   (pred_2 obj_08)
   (pred_2 obj_09)
   (pred_2 obj_14)
))
(:constraints
  (and
    (always (imply (not (pred_2 obj_08)) (not (pred_2 obj_09))))
    (forall (?m - type_2) (at-most-once (pred_6 ?m obj_05)))
  )
)
)
