; params: python3 /home/fjl2401/Safety-gen/spanner/spanner-generator.py 3 3 4 --seed 1624516802 --problem-name spanner-s3-n3-l4-s1624516802
(define (problem spanner-s3-n3-l4-s1624516802)
 (:domain spanner)
 (:objects 
     obj_06 - type_2
     obj_05 obj_12 obj_01 - type_5
     obj_13 obj_02 obj_10 - type_4
     obj_03 obj_07 obj_11 obj_09 - type_1
     obj_08 obj_04 - type_1
    )
 (:init 
    (pred_2 obj_06 obj_08)
    (pred_2 obj_05 obj_11)
    (pred_3 obj_05)
    (pred_2 obj_12 obj_09)
    (pred_3 obj_12)
    (pred_2 obj_01 obj_07)
    (pred_3 obj_01)
    (pred_5 obj_13)
    (pred_2 obj_13 obj_04)
    (pred_5 obj_02)
    (pred_2 obj_02 obj_04)
    (pred_5 obj_10)
    (pred_2 obj_10 obj_04)
    (pred_6 obj_08 obj_03)
    (pred_6 obj_09 obj_04)
    (pred_6 obj_03 obj_07)
    (pred_6 obj_07 obj_11)
    (pred_6 obj_11 obj_09)
)
 (:goal
  (and
   (pred_1 obj_13)
   (pred_1 obj_02)
   (pred_1 obj_10)
))
(:constraints
  (and
    (always (imply (not (pred_1 obj_02)) (not (pred_1 obj_10))))
    (forall (?m - type_2) (at-most-once (pred_2 ?m obj_08)))
  )
)
)
