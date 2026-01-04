; params: python3 /home/fjl2401/Safety-gen/spanner/spanner-generator.py 4 3 4 --seed 435175330 --problem-name spanner-s4-n3-l4-s435175330
(define (problem spanner-s4-n3-l4-s435175330)
 (:domain spanner)
 (:objects 
     obj_11 - type_1
     obj_12 obj_01 obj_02 obj_13 - type_4
     obj_09 obj_05 obj_07 - type_3
     obj_06 obj_03 obj_04 obj_10 - type_2
     obj_14 obj_08 - type_2
    )
 (:init 
    (pred_5 obj_11 obj_14)
    (pred_5 obj_12 obj_04)
    (pred_1 obj_12)
    (pred_5 obj_01 obj_03)
    (pred_1 obj_01)
    (pred_5 obj_02 obj_04)
    (pred_1 obj_02)
    (pred_5 obj_13 obj_04)
    (pred_1 obj_13)
    (pred_3 obj_09)
    (pred_5 obj_09 obj_08)
    (pred_3 obj_05)
    (pred_5 obj_05 obj_08)
    (pred_3 obj_07)
    (pred_5 obj_07 obj_08)
    (pred_4 obj_14 obj_06)
    (pred_4 obj_10 obj_08)
    (pred_4 obj_06 obj_03)
    (pred_4 obj_03 obj_04)
    (pred_4 obj_04 obj_10)
)
 (:goal
  (and
   (pred_2 obj_09)
   (pred_2 obj_05)
   (pred_2 obj_07)
))
(:constraints
  (and
    (always (imply (not (pred_2 obj_05)) (not (pred_2 obj_07))))
    (forall (?m - type_1) (at-most-once (pred_5 ?m obj_14)))
  )
)
)
