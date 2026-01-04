; params: python3 /home/fjl2401/Safety-gen/spanner/spanner-generator.py 3 3 4 --seed 2109790871 --problem-name spanner-s3-n3-l4-s2109790871
(define (problem spanner-s3-n3-l4-s2109790871)
 (:domain spanner)
 (:objects 
     obj_07 - type_3
     obj_06 obj_03 obj_13 - type_2
     obj_10 obj_12 obj_04 - type_4
     obj_11 obj_01 obj_02 obj_05 - type_5
     obj_09 obj_08 - type_5
    )
 (:init 
    (pred_1 obj_07 obj_09)
    (pred_1 obj_06 obj_11)
    (pred_2 obj_06)
    (pred_1 obj_03 obj_05)
    (pred_2 obj_03)
    (pred_1 obj_13 obj_02)
    (pred_2 obj_13)
    (pred_6 obj_10)
    (pred_1 obj_10 obj_08)
    (pred_6 obj_12)
    (pred_1 obj_12 obj_08)
    (pred_6 obj_04)
    (pred_1 obj_04 obj_08)
    (pred_4 obj_09 obj_11)
    (pred_4 obj_05 obj_08)
    (pred_4 obj_11 obj_01)
    (pred_4 obj_01 obj_02)
    (pred_4 obj_02 obj_05)
)
 (:goal
  (and
   (pred_5 obj_10)
   (pred_5 obj_12)
   (pred_5 obj_04)
))
(:constraints
  (and
    (always (imply (not (pred_5 obj_10)) (not (pred_5 obj_12))))
    (forall (?m - type_3) (at-most-once (pred_1 ?m obj_09)))
  )
)
)
