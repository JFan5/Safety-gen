; params: python3 /home/fjl2401/Safety-gen/spanner/spanner-generator.py 4 3 4 --seed 1710045517 --problem-name spanner-s4-n3-l4-s1710045517
(define (problem spanner-s4-n3-l4-s1710045517)
 (:domain spanner)
 (:objects 
     obj_06 - type_1
     obj_01 obj_13 obj_12 obj_03 - type_2
     obj_05 obj_07 obj_04 - type_4
     obj_02 obj_08 obj_11 obj_10 - type_5
     obj_14 obj_09 - type_5
    )
 (:init 
    (pred_1 obj_06 obj_14)
    (pred_1 obj_01 obj_02)
    (pred_2 obj_01)
    (pred_1 obj_13 obj_10)
    (pred_2 obj_13)
    (pred_1 obj_12 obj_08)
    (pred_2 obj_12)
    (pred_1 obj_03 obj_02)
    (pred_2 obj_03)
    (pred_3 obj_05)
    (pred_1 obj_05 obj_09)
    (pred_3 obj_07)
    (pred_1 obj_07 obj_09)
    (pred_3 obj_04)
    (pred_1 obj_04 obj_09)
    (pred_4 obj_14 obj_02)
    (pred_4 obj_10 obj_09)
    (pred_4 obj_02 obj_08)
    (pred_4 obj_08 obj_11)
    (pred_4 obj_11 obj_10)
)
 (:goal
  (and
   (pred_5 obj_05)
   (pred_5 obj_07)
   (pred_5 obj_04)
))
(:constraints
  (and
    (always (imply (not (pred_5 obj_05)) (not (pred_5 obj_07))))
    (forall (?m - type_1) (at-most-once (pred_1 ?m obj_14)))
  )
)
)
