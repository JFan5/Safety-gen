; params: python3 /home/fjl2401/Safety-gen/spanner/spanner-generator.py 3 3 4 --seed 576024841 --problem-name spanner-s3-n3-l4-s576024841
(define (problem spanner-s3-n3-l4-s576024841)
 (:domain spanner)
 (:objects 
     obj_12 - type_2
     obj_07 obj_11 obj_06 - type_3
     obj_04 obj_02 obj_08 - type_1
     obj_05 obj_01 obj_03 obj_09 - type_5
     obj_13 obj_10 - type_5
    )
 (:init 
    (pred_4 obj_12 obj_13)
    (pred_4 obj_07 obj_05)
    (pred_6 obj_07)
    (pred_4 obj_11 obj_03)
    (pred_6 obj_11)
    (pred_4 obj_06 obj_03)
    (pred_6 obj_06)
    (pred_3 obj_04)
    (pred_4 obj_04 obj_10)
    (pred_3 obj_02)
    (pred_4 obj_02 obj_10)
    (pred_3 obj_08)
    (pred_4 obj_08 obj_10)
    (pred_2 obj_13 obj_05)
    (pred_2 obj_09 obj_10)
    (pred_2 obj_05 obj_01)
    (pred_2 obj_01 obj_03)
    (pred_2 obj_03 obj_09)
)
 (:goal
  (and
   (pred_5 obj_04)
   (pred_5 obj_02)
   (pred_5 obj_08)
))
(:constraints
  (and
    (always (imply (not (pred_5 obj_04)) (not (pred_5 obj_02))))
    (forall (?m - type_2) (at-most-once (pred_4 ?m obj_13)))
  )
)
)
