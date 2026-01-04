; params: python3 /home/fjl2401/Safety-gen/spanner/spanner-generator.py 4 3 4 --seed 595016557 --problem-name spanner-s4-n3-l4-s595016557
(define (problem spanner-s4-n3-l4-s595016557)
 (:domain spanner)
 (:objects 
     obj_11 - type_2
     obj_07 obj_13 obj_09 obj_10 - type_5
     obj_01 obj_05 obj_14 - type_4
     obj_06 obj_02 obj_04 obj_12 - type_1
     obj_08 obj_03 - type_1
    )
 (:init 
    (pred_2 obj_11 obj_08)
    (pred_2 obj_07 obj_12)
    (pred_1 obj_07)
    (pred_2 obj_13 obj_12)
    (pred_1 obj_13)
    (pred_2 obj_09 obj_12)
    (pred_1 obj_09)
    (pred_2 obj_10 obj_12)
    (pred_1 obj_10)
    (pred_6 obj_01)
    (pred_2 obj_01 obj_03)
    (pred_6 obj_05)
    (pred_2 obj_05 obj_03)
    (pred_6 obj_14)
    (pred_2 obj_14 obj_03)
    (pred_3 obj_08 obj_06)
    (pred_3 obj_12 obj_03)
    (pred_3 obj_06 obj_02)
    (pred_3 obj_02 obj_04)
    (pred_3 obj_04 obj_12)
)
 (:goal
  (and
   (pred_5 obj_01)
   (pred_5 obj_05)
   (pred_5 obj_14)
))
(:constraints
  (and
    (always (imply (not (pred_5 obj_05)) (not (pred_5 obj_14))))
    (forall (?m - type_2) (at-most-once (pred_2 ?m obj_08)))
  )
)
)
