; params: python3 /home/fjl2401/Safety-gen/spanner/spanner-generator.py 3 3 4 --seed 1509329081 --problem-name spanner-s3-n3-l4-s1509329081
(define (problem spanner-s3-n3-l4-s1509329081)
 (:domain spanner)
 (:objects 
     obj_02 - type_5
     obj_10 obj_01 obj_05 - type_2
     obj_06 obj_11 obj_03 - type_3
     obj_09 obj_07 obj_13 obj_12 - type_4
     obj_04 obj_08 - type_4
    )
 (:init 
    (pred_2 obj_02 obj_04)
    (pred_2 obj_10 obj_13)
    (pred_5 obj_10)
    (pred_2 obj_01 obj_12)
    (pred_5 obj_01)
    (pred_2 obj_05 obj_13)
    (pred_5 obj_05)
    (pred_3 obj_06)
    (pred_2 obj_06 obj_08)
    (pred_3 obj_11)
    (pred_2 obj_11 obj_08)
    (pred_3 obj_03)
    (pred_2 obj_03 obj_08)
    (pred_1 obj_04 obj_09)
    (pred_1 obj_12 obj_08)
    (pred_1 obj_09 obj_07)
    (pred_1 obj_07 obj_13)
    (pred_1 obj_13 obj_12)
)
 (:goal
  (and
   (pred_4 obj_06)
   (pred_4 obj_11)
   (pred_4 obj_03)
))
(:constraints
  (and
    (always (imply (not (pred_4 obj_11)) (not (pred_4 obj_03))))
    (forall (?m - type_5) (at-most-once (pred_2 ?m obj_04)))
  )
)
)
