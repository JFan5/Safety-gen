; params: python3 /home/fjl2401/Safety-gen/spanner/spanner-generator.py 3 3 4 --seed 1819622458 --problem-name spanner-s3-n3-l4-s1819622458
(define (problem spanner-s3-n3-l4-s1819622458)
 (:domain spanner)
 (:objects 
     obj_02 - type_3
     obj_03 obj_04 obj_09 - type_4
     obj_07 obj_06 obj_13 - type_5
     obj_10 obj_05 obj_11 obj_12 - type_2
     obj_01 obj_08 - type_2
    )
 (:init 
    (pred_1 obj_02 obj_01)
    (pred_1 obj_03 obj_05)
    (pred_2 obj_03)
    (pred_1 obj_04 obj_11)
    (pred_2 obj_04)
    (pred_1 obj_09 obj_11)
    (pred_2 obj_09)
    (pred_3 obj_07)
    (pred_1 obj_07 obj_08)
    (pred_3 obj_06)
    (pred_1 obj_06 obj_08)
    (pred_3 obj_13)
    (pred_1 obj_13 obj_08)
    (pred_6 obj_01 obj_10)
    (pred_6 obj_12 obj_08)
    (pred_6 obj_10 obj_05)
    (pred_6 obj_05 obj_11)
    (pred_6 obj_11 obj_12)
)
 (:goal
  (and
   (pred_4 obj_07)
   (pred_4 obj_06)
   (pred_4 obj_13)
))
(:constraints
  (and
    (always (imply (not (pred_4 obj_07)) (not (pred_4 obj_06))))
    (forall (?m - type_3) (at-most-once (pred_1 ?m obj_01)))
  )
)
)
