; params: python3 /home/fjl2401/Safety-gen/spanner/spanner-generator.py 3 3 4 --seed 1447190552 --problem-name spanner-s3-n3-l4-s1447190552
(define (problem spanner-s3-n3-l4-s1447190552)
 (:domain spanner)
 (:objects 
     obj_06 - type_2
     obj_10 obj_11 obj_02 - type_1
     obj_05 obj_04 obj_07 - type_5
     obj_01 obj_09 obj_12 obj_13 - type_3
     obj_08 obj_03 - type_3
    )
 (:init 
    (pred_4 obj_06 obj_08)
    (pred_4 obj_10 obj_01)
    (pred_5 obj_10)
    (pred_4 obj_11 obj_01)
    (pred_5 obj_11)
    (pred_4 obj_02 obj_01)
    (pred_5 obj_02)
    (pred_3 obj_05)
    (pred_4 obj_05 obj_03)
    (pred_3 obj_04)
    (pred_4 obj_04 obj_03)
    (pred_3 obj_07)
    (pred_4 obj_07 obj_03)
    (pred_2 obj_08 obj_01)
    (pred_2 obj_13 obj_03)
    (pred_2 obj_01 obj_09)
    (pred_2 obj_09 obj_12)
    (pred_2 obj_12 obj_13)
)
 (:goal
  (and
   (pred_6 obj_05)
   (pred_6 obj_04)
   (pred_6 obj_07)
))
(:constraints
  (and
    (always (imply (not (pred_6 obj_05)) (not (pred_6 obj_04))))
    (forall (?m - type_2) (at-most-once (pred_4 ?m obj_08)))
  )
)
)
