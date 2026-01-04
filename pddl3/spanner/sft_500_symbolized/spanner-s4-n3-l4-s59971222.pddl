; params: python3 /home/fjl2401/Safety-gen/spanner/spanner-generator.py 4 3 4 --seed 59971222 --problem-name spanner-s4-n3-l4-s59971222
(define (problem spanner-s4-n3-l4-s59971222)
 (:domain spanner)
 (:objects 
     obj_11 - type_2
     obj_07 obj_10 obj_13 obj_01 - type_4
     obj_05 obj_14 obj_06 - type_1
     obj_02 obj_12 obj_08 obj_03 - type_5
     obj_09 obj_04 - type_5
    )
 (:init 
    (pred_1 obj_11 obj_09)
    (pred_1 obj_07 obj_08)
    (pred_5 obj_07)
    (pred_1 obj_10 obj_08)
    (pred_5 obj_10)
    (pred_1 obj_13 obj_08)
    (pred_5 obj_13)
    (pred_1 obj_01 obj_12)
    (pred_5 obj_01)
    (pred_2 obj_05)
    (pred_1 obj_05 obj_04)
    (pred_2 obj_14)
    (pred_1 obj_14 obj_04)
    (pred_2 obj_06)
    (pred_1 obj_06 obj_04)
    (pred_3 obj_09 obj_02)
    (pred_3 obj_03 obj_04)
    (pred_3 obj_02 obj_12)
    (pred_3 obj_12 obj_08)
    (pred_3 obj_08 obj_03)
)
 (:goal
  (and
   (pred_6 obj_05)
   (pred_6 obj_14)
   (pred_6 obj_06)
))
(:constraints
  (and
    (always (imply (not (pred_6 obj_14)) (not (pred_6 obj_06))))
    (forall (?m - type_2) (at-most-once (pred_1 ?m obj_09)))
  )
)
)
