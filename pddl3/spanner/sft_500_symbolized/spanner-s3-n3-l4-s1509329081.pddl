; params: python3 /home/fjl2401/Safety-gen/spanner/spanner-generator.py 3 3 4 --seed 1509329081 --problem-name spanner-s3-n3-l4-s1509329081
(define (problem spanner-s3-n3-l4-s1509329081)
 (:domain spanner)
 (:objects 
     obj_13 - type_1
     obj_03 obj_09 obj_06 - type_4
     obj_04 obj_02 obj_01 - type_3
     obj_12 obj_11 obj_08 obj_07 - type_5
     obj_05 obj_10 - type_5
    )
 (:init 
    (pred_1 obj_13 obj_05)
    (pred_1 obj_03 obj_08)
    (pred_2 obj_03)
    (pred_1 obj_09 obj_07)
    (pred_2 obj_09)
    (pred_1 obj_06 obj_08)
    (pred_2 obj_06)
    (pred_6 obj_04)
    (pred_1 obj_04 obj_10)
    (pred_6 obj_02)
    (pred_1 obj_02 obj_10)
    (pred_6 obj_01)
    (pred_1 obj_01 obj_10)
    (pred_5 obj_05 obj_12)
    (pred_5 obj_07 obj_10)
    (pred_5 obj_12 obj_11)
    (pred_5 obj_11 obj_08)
    (pred_5 obj_08 obj_07)
)
 (:goal
  (and
   (pred_3 obj_04)
   (pred_3 obj_02)
   (pred_3 obj_01)
))
(:constraints
  (and
    (always (imply (not (pred_3 obj_02)) (not (pred_3 obj_01))))
    (forall (?m - type_1) (at-most-once (pred_1 ?m obj_05)))
  )
)
)
