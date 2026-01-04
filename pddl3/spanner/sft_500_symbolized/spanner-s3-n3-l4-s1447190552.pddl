; params: python3 /home/fjl2401/Safety-gen/spanner/spanner-generator.py 3 3 4 --seed 1447190552 --problem-name spanner-s3-n3-l4-s1447190552
(define (problem spanner-s3-n3-l4-s1447190552)
 (:domain spanner)
 (:objects 
     obj_03 - type_1
     obj_12 obj_08 obj_11 - type_3
     obj_13 obj_02 obj_04 - type_5
     obj_01 obj_05 obj_06 obj_10 - type_4
     obj_09 obj_07 - type_4
    )
 (:init 
    (pred_4 obj_03 obj_09)
    (pred_4 obj_12 obj_01)
    (pred_3 obj_12)
    (pred_4 obj_08 obj_01)
    (pred_3 obj_08)
    (pred_4 obj_11 obj_01)
    (pred_3 obj_11)
    (pred_6 obj_13)
    (pred_4 obj_13 obj_07)
    (pred_6 obj_02)
    (pred_4 obj_02 obj_07)
    (pred_6 obj_04)
    (pred_4 obj_04 obj_07)
    (pred_2 obj_09 obj_01)
    (pred_2 obj_10 obj_07)
    (pred_2 obj_01 obj_05)
    (pred_2 obj_05 obj_06)
    (pred_2 obj_06 obj_10)
)
 (:goal
  (and
   (pred_5 obj_13)
   (pred_5 obj_02)
   (pred_5 obj_04)
))
(:constraints
  (and
    (always (imply (not (pred_5 obj_13)) (not (pred_5 obj_02))))
    (forall (?m - type_1) (at-most-once (pred_4 ?m obj_09)))
  )
)
)
