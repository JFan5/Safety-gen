; params: python3 /home/fjl2401/Safety-gen/spanner/spanner-generator.py 4 3 4 --seed 2104555399 --problem-name spanner-s4-n3-l4-s2104555399
(define (problem spanner-s4-n3-l4-s2104555399)
 (:domain spanner)
 (:objects 
     obj_05 - type_1
     obj_11 obj_13 obj_08 obj_12 - type_3
     obj_06 obj_01 obj_10 - type_5
     obj_14 obj_02 obj_03 obj_07 - type_2
     obj_04 obj_09 - type_2
    )
 (:init 
    (pred_4 obj_05 obj_04)
    (pred_4 obj_11 obj_02)
    (pred_1 obj_11)
    (pred_4 obj_13 obj_14)
    (pred_1 obj_13)
    (pred_4 obj_08 obj_02)
    (pred_1 obj_08)
    (pred_4 obj_12 obj_02)
    (pred_1 obj_12)
    (pred_3 obj_06)
    (pred_4 obj_06 obj_09)
    (pred_3 obj_01)
    (pred_4 obj_01 obj_09)
    (pred_3 obj_10)
    (pred_4 obj_10 obj_09)
    (pred_5 obj_04 obj_14)
    (pred_5 obj_07 obj_09)
    (pred_5 obj_14 obj_02)
    (pred_5 obj_02 obj_03)
    (pred_5 obj_03 obj_07)
)
 (:goal
  (and
   (pred_6 obj_06)
   (pred_6 obj_01)
   (pred_6 obj_10)
))
(:constraints
  (and
    (always (imply (not (pred_6 obj_06)) (not (pred_6 obj_01))))
    (forall (?m - type_1) (at-most-once (pred_4 ?m obj_04)))
  )
)
)
