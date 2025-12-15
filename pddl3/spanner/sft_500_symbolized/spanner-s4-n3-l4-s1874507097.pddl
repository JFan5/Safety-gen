; params: python3 /home/fjl2401/Safety-gen/spanner/spanner-generator.py 4 3 4 --seed 1874507097 --problem-name spanner-s4-n3-l4-s1874507097
(define (problem spanner-s4-n3-l4-s1874507097)
 (:domain spanner)
 (:objects 
     obj_07 - type_2
     obj_04 obj_08 obj_01 obj_10 - type_5
     obj_13 obj_02 obj_14 - type_4
     obj_11 obj_03 obj_12 obj_05 - type_3
     obj_06 obj_09 - type_3
    )
 (:init 
    (pred_3 obj_07 obj_06)
    (pred_3 obj_04 obj_12)
    (pred_5 obj_04)
    (pred_3 obj_08 obj_12)
    (pred_5 obj_08)
    (pred_3 obj_01 obj_12)
    (pred_5 obj_01)
    (pred_3 obj_10 obj_11)
    (pred_5 obj_10)
    (pred_2 obj_13)
    (pred_3 obj_13 obj_09)
    (pred_2 obj_02)
    (pred_3 obj_02 obj_09)
    (pred_2 obj_14)
    (pred_3 obj_14 obj_09)
    (pred_6 obj_06 obj_11)
    (pred_6 obj_05 obj_09)
    (pred_6 obj_11 obj_03)
    (pred_6 obj_03 obj_12)
    (pred_6 obj_12 obj_05)
)
 (:goal
  (and
   (pred_1 obj_13)
   (pred_1 obj_02)
   (pred_1 obj_14)
))
(:constraints
  (and
    (always (imply (not (pred_1 obj_02)) (not (pred_1 obj_14))))
    (forall (?m - type_2) (at-most-once (pred_3 ?m obj_06)))
  )
)
)
