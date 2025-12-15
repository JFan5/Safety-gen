; params: python3 /home/fjl2401/Safety-gen/spanner/spanner-generator.py 3 3 4 --seed 1376712055 --problem-name spanner-s3-n3-l4-s1376712055
(define (problem spanner-s3-n3-l4-s1376712055)
 (:domain spanner)
 (:objects 
     obj_08 - type_4
     obj_06 obj_07 obj_10 - type_5
     obj_04 obj_09 obj_01 - type_1
     obj_13 obj_11 obj_05 obj_12 - type_3
     obj_03 obj_02 - type_3
    )
 (:init 
    (pred_3 obj_08 obj_03)
    (pred_3 obj_06 obj_11)
    (pred_1 obj_06)
    (pred_3 obj_07 obj_12)
    (pred_1 obj_07)
    (pred_3 obj_10 obj_11)
    (pred_1 obj_10)
    (pred_5 obj_04)
    (pred_3 obj_04 obj_02)
    (pred_5 obj_09)
    (pred_3 obj_09 obj_02)
    (pred_5 obj_01)
    (pred_3 obj_01 obj_02)
    (pred_4 obj_03 obj_13)
    (pred_4 obj_12 obj_02)
    (pred_4 obj_13 obj_11)
    (pred_4 obj_11 obj_05)
    (pred_4 obj_05 obj_12)
)
 (:goal
  (and
   (pred_2 obj_04)
   (pred_2 obj_09)
   (pred_2 obj_01)
))
(:constraints
  (and
    (always (imply (not (pred_2 obj_04)) (not (pred_2 obj_09))))
    (forall (?m - type_4) (at-most-once (pred_3 ?m obj_03)))
  )
)
)
