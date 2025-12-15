; params: python3 /home/fjl2401/Safety-gen/spanner/spanner-generator.py 3 3 4 --seed 1100523472 --problem-name spanner-s3-n3-l4-s1100523472
(define (problem spanner-s3-n3-l4-s1100523472)
 (:domain spanner)
 (:objects 
     obj_01 - type_4
     obj_13 obj_03 obj_08 - type_5
     obj_07 obj_06 obj_02 - type_1
     obj_09 obj_04 obj_12 obj_05 - type_3
     obj_11 obj_10 - type_3
    )
 (:init 
    (pred_3 obj_01 obj_11)
    (pred_3 obj_13 obj_12)
    (pred_1 obj_13)
    (pred_3 obj_03 obj_05)
    (pred_1 obj_03)
    (pred_3 obj_08 obj_12)
    (pred_1 obj_08)
    (pred_5 obj_07)
    (pred_3 obj_07 obj_10)
    (pred_5 obj_06)
    (pred_3 obj_06 obj_10)
    (pred_5 obj_02)
    (pred_3 obj_02 obj_10)
    (pred_4 obj_11 obj_09)
    (pred_4 obj_05 obj_10)
    (pred_4 obj_09 obj_04)
    (pred_4 obj_04 obj_12)
    (pred_4 obj_12 obj_05)
)
 (:goal
  (and
   (pred_2 obj_07)
   (pred_2 obj_06)
   (pred_2 obj_02)
))
(:constraints
  (and
    (always (imply (not (pred_2 obj_06)) (not (pred_2 obj_02))))
    (forall (?m - type_4) (at-most-once (pred_3 ?m obj_11)))
  )
)
)
