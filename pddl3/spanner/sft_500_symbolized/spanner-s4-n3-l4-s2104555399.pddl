; params: python3 /home/fjl2401/Safety-gen/spanner/spanner-generator.py 4 3 4 --seed 2104555399 --problem-name spanner-s4-n3-l4-s2104555399
(define (problem spanner-s4-n3-l4-s2104555399)
 (:domain spanner)
 (:objects 
     obj_03 - type_3
     obj_09 obj_11 obj_01 obj_08 - type_5
     obj_12 obj_02 obj_06 - type_4
     obj_05 obj_10 obj_04 obj_07 - type_1
     obj_13 obj_14 - type_1
    )
 (:init 
    (pred_3 obj_03 obj_13)
    (pred_3 obj_09 obj_10)
    (pred_4 obj_09)
    (pred_3 obj_11 obj_05)
    (pred_4 obj_11)
    (pred_3 obj_01 obj_10)
    (pred_4 obj_01)
    (pred_3 obj_08 obj_10)
    (pred_4 obj_08)
    (pred_5 obj_12)
    (pred_3 obj_12 obj_14)
    (pred_5 obj_02)
    (pred_3 obj_02 obj_14)
    (pred_5 obj_06)
    (pred_3 obj_06 obj_14)
    (pred_6 obj_13 obj_05)
    (pred_6 obj_07 obj_14)
    (pred_6 obj_05 obj_10)
    (pred_6 obj_10 obj_04)
    (pred_6 obj_04 obj_07)
)
 (:goal
  (and
   (pred_1 obj_12)
   (pred_1 obj_02)
   (pred_1 obj_06)
))
(:constraints
  (and
    (always (imply (not (pred_1 obj_12)) (not (pred_1 obj_02))))
    (forall (?m - type_3) (at-most-once (pred_3 ?m obj_13)))
  )
)
)
