; params: python3 /home/fjl2401/Safety-gen/spanner/spanner-generator.py 4 3 4 --seed 668315490 --problem-name spanner-s4-n3-l4-s668315490
(define (problem spanner-s4-n3-l4-s668315490)
 (:domain spanner)
 (:objects 
     obj_11 - type_1
     obj_06 obj_05 obj_12 obj_07 - type_2
     obj_13 obj_04 obj_14 - type_3
     obj_01 obj_10 obj_03 obj_02 - type_5
     obj_08 obj_09 - type_5
    )
 (:init 
    (pred_6 obj_11 obj_08)
    (pred_6 obj_06 obj_01)
    (pred_3 obj_06)
    (pred_6 obj_05 obj_10)
    (pred_3 obj_05)
    (pred_6 obj_12 obj_03)
    (pred_3 obj_12)
    (pred_6 obj_07 obj_03)
    (pred_3 obj_07)
    (pred_2 obj_13)
    (pred_6 obj_13 obj_09)
    (pred_2 obj_04)
    (pred_6 obj_04 obj_09)
    (pred_2 obj_14)
    (pred_6 obj_14 obj_09)
    (pred_5 obj_08 obj_01)
    (pred_5 obj_02 obj_09)
    (pred_5 obj_01 obj_10)
    (pred_5 obj_10 obj_03)
    (pred_5 obj_03 obj_02)
)
 (:goal
  (and
   (pred_1 obj_13)
   (pred_1 obj_04)
   (pred_1 obj_14)
))
(:constraints
  (and
    (always (imply (not (pred_1 obj_13)) (not (pred_1 obj_04))))
    (forall (?m - type_1) (at-most-once (pred_6 ?m obj_08)))
  )
)
)
