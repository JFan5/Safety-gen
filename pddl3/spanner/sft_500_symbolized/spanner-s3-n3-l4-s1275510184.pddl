; params: python3 /home/fjl2401/Safety-gen/spanner/spanner-generator.py 3 3 4 --seed 1275510184 --problem-name spanner-s3-n3-l4-s1275510184
(define (problem spanner-s3-n3-l4-s1275510184)
 (:domain spanner)
 (:objects 
     obj_11 - type_4
     obj_05 obj_13 obj_10 - type_5
     obj_08 obj_12 obj_06 - type_1
     obj_03 obj_01 obj_04 obj_07 - type_2
     obj_02 obj_09 - type_2
    )
 (:init 
    (pred_5 obj_11 obj_02)
    (pred_5 obj_05 obj_04)
    (pred_2 obj_05)
    (pred_5 obj_13 obj_04)
    (pred_2 obj_13)
    (pred_5 obj_10 obj_04)
    (pred_2 obj_10)
    (pred_3 obj_08)
    (pred_5 obj_08 obj_09)
    (pred_3 obj_12)
    (pred_5 obj_12 obj_09)
    (pred_3 obj_06)
    (pred_5 obj_06 obj_09)
    (pred_6 obj_02 obj_03)
    (pred_6 obj_07 obj_09)
    (pred_6 obj_03 obj_01)
    (pred_6 obj_01 obj_04)
    (pred_6 obj_04 obj_07)
)
 (:goal
  (and
   (pred_4 obj_08)
   (pred_4 obj_12)
   (pred_4 obj_06)
))
(:constraints
  (and
    (always (imply (not (pred_4 obj_12)) (not (pred_4 obj_06))))
    (forall (?m - type_4) (at-most-once (pred_5 ?m obj_02)))
  )
)
)
