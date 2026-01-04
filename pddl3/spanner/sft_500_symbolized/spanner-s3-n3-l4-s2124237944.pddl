; params: python3 /home/fjl2401/Safety-gen/spanner/spanner-generator.py 3 3 4 --seed 2124237944 --problem-name spanner-s3-n3-l4-s2124237944
(define (problem spanner-s3-n3-l4-s2124237944)
 (:domain spanner)
 (:objects 
     obj_11 - type_1
     obj_01 obj_08 obj_09 - type_4
     obj_13 obj_12 obj_10 - type_3
     obj_02 obj_05 obj_06 obj_04 - type_5
     obj_03 obj_07 - type_5
    )
 (:init 
    (pred_5 obj_11 obj_03)
    (pred_5 obj_01 obj_06)
    (pred_1 obj_01)
    (pred_5 obj_08 obj_06)
    (pred_1 obj_08)
    (pred_5 obj_09 obj_02)
    (pred_1 obj_09)
    (pred_4 obj_13)
    (pred_5 obj_13 obj_07)
    (pred_4 obj_12)
    (pred_5 obj_12 obj_07)
    (pred_4 obj_10)
    (pred_5 obj_10 obj_07)
    (pred_3 obj_03 obj_02)
    (pred_3 obj_04 obj_07)
    (pred_3 obj_02 obj_05)
    (pred_3 obj_05 obj_06)
    (pred_3 obj_06 obj_04)
)
 (:goal
  (and
   (pred_6 obj_13)
   (pred_6 obj_12)
   (pred_6 obj_10)
))
(:constraints
  (and
    (always (imply (not (pred_6 obj_12)) (not (pred_6 obj_10))))
    (forall (?m - type_1) (at-most-once (pred_5 ?m obj_03)))
  )
)
)
