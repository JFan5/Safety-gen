; params: python3 /home/fjl2401/Safety-gen/spanner/spanner-generator.py 3 3 4 --seed 2099328547 --problem-name spanner-s3-n3-l4-s2099328547
(define (problem spanner-s3-n3-l4-s2099328547)
 (:domain spanner)
 (:objects 
     obj_01 - type_4
     obj_13 obj_11 obj_05 - type_5
     obj_12 obj_09 obj_04 - type_2
     obj_10 obj_02 obj_07 obj_03 - type_1
     obj_08 obj_06 - type_1
    )
 (:init 
    (pred_3 obj_01 obj_08)
    (pred_3 obj_13 obj_02)
    (pred_2 obj_13)
    (pred_3 obj_11 obj_03)
    (pred_2 obj_11)
    (pred_3 obj_05 obj_02)
    (pred_2 obj_05)
    (pred_4 obj_12)
    (pred_3 obj_12 obj_06)
    (pred_4 obj_09)
    (pred_3 obj_09 obj_06)
    (pred_4 obj_04)
    (pred_3 obj_04 obj_06)
    (pred_1 obj_08 obj_10)
    (pred_1 obj_03 obj_06)
    (pred_1 obj_10 obj_02)
    (pred_1 obj_02 obj_07)
    (pred_1 obj_07 obj_03)
)
 (:goal
  (and
   (pred_5 obj_12)
   (pred_5 obj_09)
   (pred_5 obj_04)
))
(:constraints
  (and
    (always (imply (not (pred_5 obj_12)) (not (pred_5 obj_09))))
    (forall (?m - type_4) (at-most-once (pred_3 ?m obj_08)))
  )
)
)
