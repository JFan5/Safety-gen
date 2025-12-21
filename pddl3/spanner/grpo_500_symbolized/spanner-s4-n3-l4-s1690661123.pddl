; params: python3 /home/fjl2401/Safety-gen/spanner/spanner-generator.py 4 3 4 --seed 1690661123 --problem-name spanner-s4-n3-l4-s1690661123
(define (problem spanner-s4-n3-l4-s1690661123)
 (:domain spanner)
 (:objects 
     obj_10 - type_5
     obj_11 obj_06 obj_13 obj_12 - type_3
     obj_05 obj_14 obj_07 - type_1
     obj_08 obj_04 obj_02 obj_09 - type_2
     obj_03 obj_01 - type_2
    )
 (:init 
    (pred_6 obj_10 obj_03)
    (pred_6 obj_11 obj_04)
    (pred_5 obj_11)
    (pred_6 obj_06 obj_09)
    (pred_5 obj_06)
    (pred_6 obj_13 obj_02)
    (pred_5 obj_13)
    (pred_6 obj_12 obj_08)
    (pred_5 obj_12)
    (pred_4 obj_05)
    (pred_6 obj_05 obj_01)
    (pred_4 obj_14)
    (pred_6 obj_14 obj_01)
    (pred_4 obj_07)
    (pred_6 obj_07 obj_01)
    (pred_3 obj_03 obj_08)
    (pred_3 obj_09 obj_01)
    (pred_3 obj_08 obj_04)
    (pred_3 obj_04 obj_02)
    (pred_3 obj_02 obj_09)
)
 (:goal
  (and
   (pred_1 obj_05)
   (pred_1 obj_14)
   (pred_1 obj_07)
))
(:constraints
  (and
    (always (imply (not (pred_1 obj_05)) (not (pred_1 obj_14))))
    (forall (?m - type_5) (at-most-once (pred_6 ?m obj_03)))
  )
)
)
