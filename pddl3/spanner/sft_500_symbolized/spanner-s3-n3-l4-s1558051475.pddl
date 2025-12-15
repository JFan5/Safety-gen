; params: python3 /home/fjl2401/Safety-gen/spanner/spanner-generator.py 3 3 4 --seed 1558051475 --problem-name spanner-s3-n3-l4-s1558051475
(define (problem spanner-s3-n3-l4-s1558051475)
 (:domain spanner)
 (:objects 
     obj_02 - type_5
     obj_08 obj_04 obj_07 - type_1
     obj_11 obj_05 obj_12 - type_3
     obj_06 obj_09 obj_01 obj_10 - type_4
     obj_13 obj_03 - type_4
    )
 (:init 
    (pred_5 obj_02 obj_13)
    (pred_5 obj_08 obj_01)
    (pred_4 obj_08)
    (pred_5 obj_04 obj_10)
    (pred_4 obj_04)
    (pred_5 obj_07 obj_06)
    (pred_4 obj_07)
    (pred_1 obj_11)
    (pred_5 obj_11 obj_03)
    (pred_1 obj_05)
    (pred_5 obj_05 obj_03)
    (pred_1 obj_12)
    (pred_5 obj_12 obj_03)
    (pred_2 obj_13 obj_06)
    (pred_2 obj_10 obj_03)
    (pred_2 obj_06 obj_09)
    (pred_2 obj_09 obj_01)
    (pred_2 obj_01 obj_10)
)
 (:goal
  (and
   (pred_3 obj_11)
   (pred_3 obj_05)
   (pred_3 obj_12)
))
(:constraints
  (and
    (always (imply (not (pred_3 obj_05)) (not (pred_3 obj_12))))
    (forall (?m - type_5) (at-most-once (pred_5 ?m obj_13)))
  )
)
)
