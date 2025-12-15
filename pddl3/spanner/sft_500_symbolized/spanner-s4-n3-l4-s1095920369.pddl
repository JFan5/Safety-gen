; params: python3 /home/fjl2401/Safety-gen/spanner/spanner-generator.py 4 3 4 --seed 1095920369 --problem-name spanner-s4-n3-l4-s1095920369
(define (problem spanner-s4-n3-l4-s1095920369)
 (:domain spanner)
 (:objects 
     obj_06 - type_4
     obj_07 obj_12 obj_08 obj_05 - type_2
     obj_11 obj_13 obj_14 - type_1
     obj_09 obj_03 obj_04 obj_10 - type_3
     obj_01 obj_02 - type_3
    )
 (:init 
    (pred_4 obj_06 obj_01)
    (pred_4 obj_07 obj_03)
    (pred_6 obj_07)
    (pred_4 obj_12 obj_04)
    (pred_6 obj_12)
    (pred_4 obj_08 obj_04)
    (pred_6 obj_08)
    (pred_4 obj_05 obj_03)
    (pred_6 obj_05)
    (pred_3 obj_11)
    (pred_4 obj_11 obj_02)
    (pred_3 obj_13)
    (pred_4 obj_13 obj_02)
    (pred_3 obj_14)
    (pred_4 obj_14 obj_02)
    (pred_5 obj_01 obj_09)
    (pred_5 obj_10 obj_02)
    (pred_5 obj_09 obj_03)
    (pred_5 obj_03 obj_04)
    (pred_5 obj_04 obj_10)
)
 (:goal
  (and
   (pred_1 obj_11)
   (pred_1 obj_13)
   (pred_1 obj_14)
))
(:constraints
  (and
    (always (imply (not (pred_1 obj_11)) (not (pred_1 obj_13))))
    (forall (?m - type_4) (at-most-once (pred_4 ?m obj_01)))
  )
)
)
