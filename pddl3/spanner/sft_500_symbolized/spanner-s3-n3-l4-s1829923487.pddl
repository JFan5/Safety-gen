; params: python3 /home/fjl2401/Safety-gen/spanner/spanner-generator.py 3 3 4 --seed 1829923487 --problem-name spanner-s3-n3-l4-s1829923487
(define (problem spanner-s3-n3-l4-s1829923487)
 (:domain spanner)
 (:objects 
     obj_11 - type_1
     obj_13 obj_09 obj_07 - type_4
     obj_02 obj_12 obj_06 - type_2
     obj_03 obj_05 obj_04 obj_10 - type_3
     obj_01 obj_08 - type_3
    )
 (:init 
    (pred_2 obj_11 obj_01)
    (pred_2 obj_13 obj_04)
    (pred_5 obj_13)
    (pred_2 obj_09 obj_04)
    (pred_5 obj_09)
    (pred_2 obj_07 obj_05)
    (pred_5 obj_07)
    (pred_1 obj_02)
    (pred_2 obj_02 obj_08)
    (pred_1 obj_12)
    (pred_2 obj_12 obj_08)
    (pred_1 obj_06)
    (pred_2 obj_06 obj_08)
    (pred_3 obj_01 obj_03)
    (pred_3 obj_10 obj_08)
    (pred_3 obj_03 obj_05)
    (pred_3 obj_05 obj_04)
    (pred_3 obj_04 obj_10)
)
 (:goal
  (and
   (pred_4 obj_02)
   (pred_4 obj_12)
   (pred_4 obj_06)
))
(:constraints
  (and
    (always (imply (not (pred_4 obj_12)) (not (pred_4 obj_06))))
    (forall (?m - type_1) (at-most-once (pred_2 ?m obj_01)))
  )
)
)
