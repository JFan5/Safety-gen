; params: python3 /home/fjl2401/Safety-gen/spanner/spanner-generator.py 3 3 4 --seed 1345827070 --problem-name spanner-s3-n3-l4-s1345827070
(define (problem spanner-s3-n3-l4-s1345827070)
 (:domain spanner)
 (:objects 
     obj_10 - type_3
     obj_04 obj_09 obj_03 - type_5
     obj_12 obj_06 obj_02 - type_4
     obj_13 obj_11 obj_08 obj_01 - type_2
     obj_05 obj_07 - type_2
    )
 (:init 
    (pred_2 obj_10 obj_05)
    (pred_2 obj_04 obj_08)
    (pred_1 obj_04)
    (pred_2 obj_09 obj_01)
    (pred_1 obj_09)
    (pred_2 obj_03 obj_11)
    (pred_1 obj_03)
    (pred_5 obj_12)
    (pred_2 obj_12 obj_07)
    (pred_5 obj_06)
    (pred_2 obj_06 obj_07)
    (pred_5 obj_02)
    (pred_2 obj_02 obj_07)
    (pred_6 obj_05 obj_13)
    (pred_6 obj_01 obj_07)
    (pred_6 obj_13 obj_11)
    (pred_6 obj_11 obj_08)
    (pred_6 obj_08 obj_01)
)
 (:goal
  (and
   (pred_3 obj_12)
   (pred_3 obj_06)
   (pred_3 obj_02)
))
(:constraints
  (and
    (always (imply (not (pred_3 obj_06)) (not (pred_3 obj_02))))
    (forall (?m - type_3) (at-most-once (pred_2 ?m obj_05)))
  )
)
)
