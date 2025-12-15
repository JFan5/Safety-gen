; params: python3 /home/fjl2401/Safety-gen/spanner/spanner-generator.py 3 3 4 --seed 1312193528 --problem-name spanner-s3-n3-l4-s1312193528
(define (problem spanner-s3-n3-l4-s1312193528)
 (:domain spanner)
 (:objects 
     obj_06 - type_1
     obj_10 obj_11 obj_05 - type_2
     obj_02 obj_13 obj_03 - type_5
     obj_07 obj_04 obj_09 obj_08 - type_4
     obj_01 obj_12 - type_4
    )
 (:init 
    (pred_1 obj_06 obj_01)
    (pred_1 obj_10 obj_09)
    (pred_2 obj_10)
    (pred_1 obj_11 obj_09)
    (pred_2 obj_11)
    (pred_1 obj_05 obj_07)
    (pred_2 obj_05)
    (pred_5 obj_02)
    (pred_1 obj_02 obj_12)
    (pred_5 obj_13)
    (pred_1 obj_13 obj_12)
    (pred_5 obj_03)
    (pred_1 obj_03 obj_12)
    (pred_4 obj_01 obj_07)
    (pred_4 obj_08 obj_12)
    (pred_4 obj_07 obj_04)
    (pred_4 obj_04 obj_09)
    (pred_4 obj_09 obj_08)
)
 (:goal
  (and
   (pred_6 obj_02)
   (pred_6 obj_13)
   (pred_6 obj_03)
))
(:constraints
  (and
    (always (imply (not (pred_6 obj_13)) (not (pred_6 obj_03))))
    (forall (?m - type_1) (at-most-once (pred_1 ?m obj_01)))
  )
)
)
