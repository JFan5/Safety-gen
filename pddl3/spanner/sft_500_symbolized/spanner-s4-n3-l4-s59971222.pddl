; params: python3 /home/fjl2401/Safety-gen/spanner/spanner-generator.py 4 3 4 --seed 59971222 --problem-name spanner-s4-n3-l4-s59971222
(define (problem spanner-s4-n3-l4-s59971222)
 (:domain spanner)
 (:objects 
     obj_01 - type_2
     obj_12 obj_10 obj_13 obj_04 - type_4
     obj_03 obj_14 obj_08 - type_5
     obj_02 obj_07 obj_11 obj_05 - type_3
     obj_06 obj_09 - type_3
    )
 (:init 
    (pred_3 obj_01 obj_06)
    (pred_3 obj_12 obj_11)
    (pred_1 obj_12)
    (pred_3 obj_10 obj_11)
    (pred_1 obj_10)
    (pred_3 obj_13 obj_11)
    (pred_1 obj_13)
    (pred_3 obj_04 obj_07)
    (pred_1 obj_04)
    (pred_6 obj_03)
    (pred_3 obj_03 obj_09)
    (pred_6 obj_14)
    (pred_3 obj_14 obj_09)
    (pred_6 obj_08)
    (pred_3 obj_08 obj_09)
    (pred_4 obj_06 obj_02)
    (pred_4 obj_05 obj_09)
    (pred_4 obj_02 obj_07)
    (pred_4 obj_07 obj_11)
    (pred_4 obj_11 obj_05)
)
 (:goal
  (and
   (pred_5 obj_03)
   (pred_5 obj_14)
   (pred_5 obj_08)
))
(:constraints
  (and
    (always (imply (not (pred_5 obj_14)) (not (pred_5 obj_08))))
    (forall (?m - type_2) (at-most-once (pred_3 ?m obj_06)))
  )
)
)
