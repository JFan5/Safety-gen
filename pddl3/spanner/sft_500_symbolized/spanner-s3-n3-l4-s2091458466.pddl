; params: python3 /home/fjl2401/Safety-gen/spanner/spanner-generator.py 3 3 4 --seed 2091458466 --problem-name spanner-s3-n3-l4-s2091458466
(define (problem spanner-s3-n3-l4-s2091458466)
 (:domain spanner)
 (:objects 
     obj_10 - type_3
     obj_07 obj_08 obj_01 - type_5
     obj_02 obj_03 obj_13 - type_2
     obj_05 obj_12 obj_06 obj_04 - type_4
     obj_09 obj_11 - type_4
    )
 (:init 
    (pred_2 obj_10 obj_09)
    (pred_2 obj_07 obj_05)
    (pred_1 obj_07)
    (pred_2 obj_08 obj_12)
    (pred_1 obj_08)
    (pred_2 obj_01 obj_06)
    (pred_1 obj_01)
    (pred_6 obj_02)
    (pred_2 obj_02 obj_11)
    (pred_6 obj_03)
    (pred_2 obj_03 obj_11)
    (pred_6 obj_13)
    (pred_2 obj_13 obj_11)
    (pred_5 obj_09 obj_05)
    (pred_5 obj_04 obj_11)
    (pred_5 obj_05 obj_12)
    (pred_5 obj_12 obj_06)
    (pred_5 obj_06 obj_04)
)
 (:goal
  (and
   (pred_4 obj_02)
   (pred_4 obj_03)
   (pred_4 obj_13)
))
(:constraints
  (and
    (always (imply (not (pred_4 obj_02)) (not (pred_4 obj_03))))
    (forall (?m - type_3) (at-most-once (pred_2 ?m obj_09)))
  )
)
)
