; params: python3 /home/fjl2401/Safety-gen/spanner/spanner-generator.py 4 3 4 --seed 1095920369 --problem-name spanner-s4-n3-l4-s1095920369
(define (problem spanner-s4-n3-l4-s1095920369)
 (:domain spanner)
 (:objects 
     obj_03 - type_5
     obj_14 obj_10 obj_01 obj_04 - type_4
     obj_09 obj_02 obj_08 - type_2
     obj_06 obj_07 obj_05 obj_11 - type_1
     obj_13 obj_12 - type_1
    )
 (:init 
    (pred_6 obj_03 obj_13)
    (pred_6 obj_14 obj_07)
    (pred_3 obj_14)
    (pred_6 obj_10 obj_05)
    (pred_3 obj_10)
    (pred_6 obj_01 obj_05)
    (pred_3 obj_01)
    (pred_6 obj_04 obj_07)
    (pred_3 obj_04)
    (pred_4 obj_09)
    (pred_6 obj_09 obj_12)
    (pred_4 obj_02)
    (pred_6 obj_02 obj_12)
    (pred_4 obj_08)
    (pred_6 obj_08 obj_12)
    (pred_1 obj_13 obj_06)
    (pred_1 obj_11 obj_12)
    (pred_1 obj_06 obj_07)
    (pred_1 obj_07 obj_05)
    (pred_1 obj_05 obj_11)
)
 (:goal
  (and
   (pred_2 obj_09)
   (pred_2 obj_02)
   (pred_2 obj_08)
))
(:constraints
  (and
    (always (imply (not (pred_2 obj_09)) (not (pred_2 obj_02))))
    (forall (?m - type_5) (at-most-once (pred_6 ?m obj_13)))
  )
)
)
