; params: python3 /home/fjl2401/Safety-gen/spanner/spanner-generator.py 3 3 4 --seed 576024841 --problem-name spanner-s3-n3-l4-s576024841
(define (problem spanner-s3-n3-l4-s576024841)
 (:domain spanner)
 (:objects 
     obj_12 - type_2
     obj_11 obj_04 obj_13 - type_5
     obj_05 obj_06 obj_09 - type_4
     obj_02 obj_03 obj_01 obj_10 - type_3
     obj_07 obj_08 - type_3
    )
 (:init 
    (pred_1 obj_12 obj_07)
    (pred_1 obj_11 obj_02)
    (pred_6 obj_11)
    (pred_1 obj_04 obj_01)
    (pred_6 obj_04)
    (pred_1 obj_13 obj_01)
    (pred_6 obj_13)
    (pred_2 obj_05)
    (pred_1 obj_05 obj_08)
    (pred_2 obj_06)
    (pred_1 obj_06 obj_08)
    (pred_2 obj_09)
    (pred_1 obj_09 obj_08)
    (pred_4 obj_07 obj_02)
    (pred_4 obj_10 obj_08)
    (pred_4 obj_02 obj_03)
    (pred_4 obj_03 obj_01)
    (pred_4 obj_01 obj_10)
)
 (:goal
  (and
   (pred_3 obj_05)
   (pred_3 obj_06)
   (pred_3 obj_09)
))
(:constraints
  (and
    (always (imply (not (pred_3 obj_05)) (not (pred_3 obj_06))))
    (forall (?m - type_2) (at-most-once (pred_1 ?m obj_07)))
  )
)
)
