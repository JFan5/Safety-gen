; params: python3 /home/fjl2401/Safety-gen/spanner/spanner-generator.py 3 3 4 --seed 1732099478 --problem-name spanner-s3-n3-l4-s1732099478
(define (problem spanner-s3-n3-l4-s1732099478)
 (:domain spanner)
 (:objects 
     obj_01 - type_1
     obj_07 obj_05 obj_09 - type_3
     obj_11 obj_12 obj_04 - type_4
     obj_10 obj_13 obj_08 obj_03 - type_5
     obj_06 obj_02 - type_5
    )
 (:init 
    (pred_4 obj_01 obj_06)
    (pred_4 obj_07 obj_10)
    (pred_5 obj_07)
    (pred_4 obj_05 obj_03)
    (pred_5 obj_05)
    (pred_4 obj_09 obj_13)
    (pred_5 obj_09)
    (pred_3 obj_11)
    (pred_4 obj_11 obj_02)
    (pred_3 obj_12)
    (pred_4 obj_12 obj_02)
    (pred_3 obj_04)
    (pred_4 obj_04 obj_02)
    (pred_2 obj_06 obj_10)
    (pred_2 obj_03 obj_02)
    (pred_2 obj_10 obj_13)
    (pred_2 obj_13 obj_08)
    (pred_2 obj_08 obj_03)
)
 (:goal
  (and
   (pred_6 obj_11)
   (pred_6 obj_12)
   (pred_6 obj_04)
))
(:constraints
  (and
    (always (imply (not (pred_6 obj_11)) (not (pred_6 obj_12))))
    (forall (?m - type_1) (at-most-once (pred_4 ?m obj_06)))
  )
)
)
