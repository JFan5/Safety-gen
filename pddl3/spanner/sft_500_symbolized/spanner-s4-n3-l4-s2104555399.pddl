; params: python3 /home/fjl2401/Safety-gen/spanner/spanner-generator.py 4 3 4 --seed 2104555399 --problem-name spanner-s4-n3-l4-s2104555399
(define (problem spanner-s4-n3-l4-s2104555399)
 (:domain spanner)
 (:objects 
     obj_02 - type_3
     obj_13 obj_10 obj_11 obj_05 - type_5
     obj_07 obj_12 obj_14 - type_4
     obj_01 obj_09 obj_06 obj_03 - type_2
     obj_08 obj_04 - type_2
    )
 (:init 
    (pred_2 obj_02 obj_08)
    (pred_2 obj_13 obj_09)
    (pred_1 obj_13)
    (pred_2 obj_10 obj_01)
    (pred_1 obj_10)
    (pred_2 obj_11 obj_09)
    (pred_1 obj_11)
    (pred_2 obj_05 obj_09)
    (pred_1 obj_05)
    (pred_5 obj_07)
    (pred_2 obj_07 obj_04)
    (pred_5 obj_12)
    (pred_2 obj_12 obj_04)
    (pred_5 obj_14)
    (pred_2 obj_14 obj_04)
    (pred_6 obj_08 obj_01)
    (pred_6 obj_03 obj_04)
    (pred_6 obj_01 obj_09)
    (pred_6 obj_09 obj_06)
    (pred_6 obj_06 obj_03)
)
 (:goal
  (and
   (pred_3 obj_07)
   (pred_3 obj_12)
   (pred_3 obj_14)
))
(:constraints
  (and
    (always (imply (not (pred_3 obj_07)) (not (pred_3 obj_12))))
    (forall (?m - type_3) (at-most-once (pred_2 ?m obj_08)))
  )
)
)
