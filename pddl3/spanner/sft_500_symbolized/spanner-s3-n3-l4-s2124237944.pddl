; params: python3 /home/fjl2401/Safety-gen/spanner/spanner-generator.py 3 3 4 --seed 2124237944 --problem-name spanner-s3-n3-l4-s2124237944
(define (problem spanner-s3-n3-l4-s2124237944)
 (:domain spanner)
 (:objects 
     obj_04 - type_3
     obj_01 obj_06 obj_05 - type_5
     obj_09 obj_02 obj_11 - type_4
     obj_07 obj_10 obj_03 obj_13 - type_2
     obj_08 obj_12 - type_2
    )
 (:init 
    (pred_2 obj_04 obj_08)
    (pred_2 obj_01 obj_03)
    (pred_1 obj_01)
    (pred_2 obj_06 obj_03)
    (pred_1 obj_06)
    (pred_2 obj_05 obj_07)
    (pred_1 obj_05)
    (pred_5 obj_09)
    (pred_2 obj_09 obj_12)
    (pred_5 obj_02)
    (pred_2 obj_02 obj_12)
    (pred_5 obj_11)
    (pred_2 obj_11 obj_12)
    (pred_6 obj_08 obj_07)
    (pred_6 obj_13 obj_12)
    (pred_6 obj_07 obj_10)
    (pred_6 obj_10 obj_03)
    (pred_6 obj_03 obj_13)
)
 (:goal
  (and
   (pred_3 obj_09)
   (pred_3 obj_02)
   (pred_3 obj_11)
))
(:constraints
  (and
    (always (imply (not (pred_3 obj_02)) (not (pred_3 obj_11))))
    (forall (?m - type_3) (at-most-once (pred_2 ?m obj_08)))
  )
)
)
