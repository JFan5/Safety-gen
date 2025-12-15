; params: python3 /home/fjl2401/Safety-gen/spanner/spanner-generator.py 4 3 4 --seed 435175330 --problem-name spanner-s4-n3-l4-s435175330
(define (problem spanner-s4-n3-l4-s435175330)
 (:domain spanner)
 (:objects 
     obj_14 - type_4
     obj_13 obj_05 obj_11 obj_12 - type_5
     obj_03 obj_02 obj_09 - type_1
     obj_07 obj_10 obj_01 obj_08 - type_3
     obj_06 obj_04 - type_3
    )
 (:init 
    (pred_3 obj_14 obj_06)
    (pred_3 obj_13 obj_01)
    (pred_1 obj_13)
    (pred_3 obj_05 obj_10)
    (pred_1 obj_05)
    (pred_3 obj_11 obj_01)
    (pred_1 obj_11)
    (pred_3 obj_12 obj_01)
    (pred_1 obj_12)
    (pred_5 obj_03)
    (pred_3 obj_03 obj_04)
    (pred_5 obj_02)
    (pred_3 obj_02 obj_04)
    (pred_5 obj_09)
    (pred_3 obj_09 obj_04)
    (pred_4 obj_06 obj_07)
    (pred_4 obj_08 obj_04)
    (pred_4 obj_07 obj_10)
    (pred_4 obj_10 obj_01)
    (pred_4 obj_01 obj_08)
)
 (:goal
  (and
   (pred_2 obj_03)
   (pred_2 obj_02)
   (pred_2 obj_09)
))
(:constraints
  (and
    (always (imply (not (pred_2 obj_02)) (not (pred_2 obj_09))))
    (forall (?m - type_4) (at-most-once (pred_3 ?m obj_06)))
  )
)
)
