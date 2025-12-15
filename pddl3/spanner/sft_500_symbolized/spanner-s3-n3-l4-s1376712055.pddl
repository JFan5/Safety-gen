; params: python3 /home/fjl2401/Safety-gen/spanner/spanner-generator.py 3 3 4 --seed 1376712055 --problem-name spanner-s3-n3-l4-s1376712055
(define (problem spanner-s3-n3-l4-s1376712055)
 (:domain spanner)
 (:objects 
     obj_10 - type_4
     obj_04 obj_09 obj_08 - type_5
     obj_12 obj_07 obj_13 - type_1
     obj_11 obj_02 obj_05 obj_01 - type_2
     obj_03 obj_06 - type_2
    )
 (:init 
    (pred_6 obj_10 obj_03)
    (pred_6 obj_04 obj_02)
    (pred_2 obj_04)
    (pred_6 obj_09 obj_01)
    (pred_2 obj_09)
    (pred_6 obj_08 obj_02)
    (pred_2 obj_08)
    (pred_1 obj_12)
    (pred_6 obj_12 obj_06)
    (pred_1 obj_07)
    (pred_6 obj_07 obj_06)
    (pred_1 obj_13)
    (pred_6 obj_13 obj_06)
    (pred_3 obj_03 obj_11)
    (pred_3 obj_01 obj_06)
    (pred_3 obj_11 obj_02)
    (pred_3 obj_02 obj_05)
    (pred_3 obj_05 obj_01)
)
 (:goal
  (and
   (pred_5 obj_12)
   (pred_5 obj_07)
   (pred_5 obj_13)
))
(:constraints
  (and
    (always (imply (not (pred_5 obj_12)) (not (pred_5 obj_07))))
    (forall (?m - type_4) (at-most-once (pred_6 ?m obj_03)))
  )
)
)
