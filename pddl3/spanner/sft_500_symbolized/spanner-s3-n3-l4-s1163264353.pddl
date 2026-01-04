; params: python3 /home/fjl2401/Safety-gen/spanner/spanner-generator.py 3 3 4 --seed 1163264353 --problem-name spanner-s3-n3-l4-s1163264353
(define (problem spanner-s3-n3-l4-s1163264353)
 (:domain spanner)
 (:objects 
     obj_10 - type_3
     obj_08 obj_11 obj_05 - type_1
     obj_02 obj_12 obj_09 - type_2
     obj_07 obj_13 obj_06 obj_01 - type_5
     obj_03 obj_04 - type_5
    )
 (:init 
    (pred_4 obj_10 obj_03)
    (pred_4 obj_08 obj_06)
    (pred_2 obj_08)
    (pred_4 obj_11 obj_07)
    (pred_2 obj_11)
    (pred_4 obj_05 obj_07)
    (pred_2 obj_05)
    (pred_5 obj_02)
    (pred_4 obj_02 obj_04)
    (pred_5 obj_12)
    (pred_4 obj_12 obj_04)
    (pred_5 obj_09)
    (pred_4 obj_09 obj_04)
    (pred_6 obj_03 obj_07)
    (pred_6 obj_01 obj_04)
    (pred_6 obj_07 obj_13)
    (pred_6 obj_13 obj_06)
    (pred_6 obj_06 obj_01)
)
 (:goal
  (and
   (pred_3 obj_02)
   (pred_3 obj_12)
   (pred_3 obj_09)
))
(:constraints
  (and
    (always (imply (not (pred_3 obj_12)) (not (pred_3 obj_09))))
    (forall (?m - type_3) (at-most-once (pred_4 ?m obj_03)))
  )
)
)
