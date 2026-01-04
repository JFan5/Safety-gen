; params: python3 /home/fjl2401/Safety-gen/spanner/spanner-generator.py 3 3 4 --seed 1624516802 --problem-name spanner-s3-n3-l4-s1624516802
(define (problem spanner-s3-n3-l4-s1624516802)
 (:domain spanner)
 (:objects 
     obj_13 - type_3
     obj_08 obj_06 obj_07 - type_2
     obj_04 obj_11 obj_02 - type_4
     obj_05 obj_01 obj_12 obj_03 - type_1
     obj_09 obj_10 - type_1
    )
 (:init 
    (pred_5 obj_13 obj_09)
    (pred_5 obj_08 obj_12)
    (pred_2 obj_08)
    (pred_5 obj_06 obj_03)
    (pred_2 obj_06)
    (pred_5 obj_07 obj_01)
    (pred_2 obj_07)
    (pred_4 obj_04)
    (pred_5 obj_04 obj_10)
    (pred_4 obj_11)
    (pred_5 obj_11 obj_10)
    (pred_4 obj_02)
    (pred_5 obj_02 obj_10)
    (pred_6 obj_09 obj_05)
    (pred_6 obj_03 obj_10)
    (pred_6 obj_05 obj_01)
    (pred_6 obj_01 obj_12)
    (pred_6 obj_12 obj_03)
)
 (:goal
  (and
   (pred_1 obj_04)
   (pred_1 obj_11)
   (pred_1 obj_02)
))
(:constraints
  (and
    (always (imply (not (pred_1 obj_11)) (not (pred_1 obj_02))))
    (forall (?m - type_3) (at-most-once (pred_5 ?m obj_09)))
  )
)
)
