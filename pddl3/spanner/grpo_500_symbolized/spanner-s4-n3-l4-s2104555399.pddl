; params: python3 /home/fjl2401/Safety-gen/spanner/spanner-generator.py 4 3 4 --seed 2104555399 --problem-name spanner-s4-n3-l4-s2104555399
(define (problem spanner-s4-n3-l4-s2104555399)
 (:domain spanner)
 (:objects 
     obj_10 - type_4
     obj_02 obj_11 obj_12 obj_05 - type_5
     obj_08 obj_07 obj_03 - type_1
     obj_13 obj_09 obj_01 obj_06 - type_3
     obj_14 obj_04 - type_3
    )
 (:init 
    (pred_3 obj_10 obj_14)
    (pred_3 obj_02 obj_09)
    (pred_1 obj_02)
    (pred_3 obj_11 obj_13)
    (pred_1 obj_11)
    (pred_3 obj_12 obj_09)
    (pred_1 obj_12)
    (pred_3 obj_05 obj_09)
    (pred_1 obj_05)
    (pred_5 obj_08)
    (pred_3 obj_08 obj_04)
    (pred_5 obj_07)
    (pred_3 obj_07 obj_04)
    (pred_5 obj_03)
    (pred_3 obj_03 obj_04)
    (pred_4 obj_14 obj_13)
    (pred_4 obj_06 obj_04)
    (pred_4 obj_13 obj_09)
    (pred_4 obj_09 obj_01)
    (pred_4 obj_01 obj_06)
)
 (:goal
  (and
   (pred_2 obj_08)
   (pred_2 obj_07)
   (pred_2 obj_03)
))
(:constraints
  (and
    (always (imply (not (pred_2 obj_08)) (not (pred_2 obj_07))))
    (forall (?m - type_4) (at-most-once (pred_3 ?m obj_14)))
  )
)
)
