; params: python3 /home/fjl2401/Safety-gen/spanner/spanner-generator.py 3 3 4 --seed 2109790871 --problem-name spanner-s3-n3-l4-s2109790871
(define (problem spanner-s3-n3-l4-s2109790871)
 (:domain spanner)
 (:objects 
     obj_02 - type_1
     obj_13 obj_01 obj_05 - type_2
     obj_07 obj_12 obj_09 - type_5
     obj_11 obj_03 obj_06 obj_04 - type_4
     obj_08 obj_10 - type_4
    )
 (:init 
    (pred_1 obj_02 obj_08)
    (pred_1 obj_13 obj_11)
    (pred_3 obj_13)
    (pred_1 obj_01 obj_04)
    (pred_3 obj_01)
    (pred_1 obj_05 obj_06)
    (pred_3 obj_05)
    (pred_5 obj_07)
    (pred_1 obj_07 obj_10)
    (pred_5 obj_12)
    (pred_1 obj_12 obj_10)
    (pred_5 obj_09)
    (pred_1 obj_09 obj_10)
    (pred_4 obj_08 obj_11)
    (pred_4 obj_04 obj_10)
    (pred_4 obj_11 obj_03)
    (pred_4 obj_03 obj_06)
    (pred_4 obj_06 obj_04)
)
 (:goal
  (and
   (pred_2 obj_07)
   (pred_2 obj_12)
   (pred_2 obj_09)
))
(:constraints
  (and
    (always (imply (not (pred_2 obj_07)) (not (pred_2 obj_12))))
    (forall (?m - type_1) (at-most-once (pred_1 ?m obj_08)))
  )
)
)
