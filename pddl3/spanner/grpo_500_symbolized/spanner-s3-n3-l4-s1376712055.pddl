; params: python3 /home/fjl2401/Safety-gen/spanner/spanner-generator.py 3 3 4 --seed 1376712055 --problem-name spanner-s3-n3-l4-s1376712055
(define (problem spanner-s3-n3-l4-s1376712055)
 (:domain spanner)
 (:objects 
     obj_01 - type_5
     obj_05 obj_06 obj_11 - type_3
     obj_07 obj_08 obj_12 - type_1
     obj_04 obj_03 obj_09 obj_10 - type_2
     obj_02 obj_13 - type_2
    )
 (:init 
    (pred_6 obj_01 obj_02)
    (pred_6 obj_05 obj_03)
    (pred_5 obj_05)
    (pred_6 obj_06 obj_10)
    (pred_5 obj_06)
    (pred_6 obj_11 obj_03)
    (pred_5 obj_11)
    (pred_4 obj_07)
    (pred_6 obj_07 obj_13)
    (pred_4 obj_08)
    (pred_6 obj_08 obj_13)
    (pred_4 obj_12)
    (pred_6 obj_12 obj_13)
    (pred_3 obj_02 obj_04)
    (pred_3 obj_10 obj_13)
    (pred_3 obj_04 obj_03)
    (pred_3 obj_03 obj_09)
    (pred_3 obj_09 obj_10)
)
 (:goal
  (and
   (pred_1 obj_07)
   (pred_1 obj_08)
   (pred_1 obj_12)
))
(:constraints
  (and
    (always (imply (not (pred_1 obj_07)) (not (pred_1 obj_08))))
    (forall (?m - type_5) (at-most-once (pred_6 ?m obj_02)))
  )
)
)
