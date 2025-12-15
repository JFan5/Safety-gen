; params: python3 /home/fjl2401/Safety-gen/spanner/spanner-generator.py 3 3 4 --seed 1819508961 --problem-name spanner-s3-n3-l4-s1819508961
(define (problem spanner-s3-n3-l4-s1819508961)
 (:domain spanner)
 (:objects 
     obj_03 - type_2
     obj_07 obj_04 obj_09 - type_4
     obj_12 obj_08 obj_06 - type_5
     obj_05 obj_13 obj_10 obj_02 - type_3
     obj_01 obj_11 - type_3
    )
 (:init 
    (pred_4 obj_03 obj_01)
    (pred_4 obj_07 obj_10)
    (pred_3 obj_07)
    (pred_4 obj_04 obj_05)
    (pred_3 obj_04)
    (pred_4 obj_09 obj_05)
    (pred_3 obj_09)
    (pred_1 obj_12)
    (pred_4 obj_12 obj_11)
    (pred_1 obj_08)
    (pred_4 obj_08 obj_11)
    (pred_1 obj_06)
    (pred_4 obj_06 obj_11)
    (pred_2 obj_01 obj_05)
    (pred_2 obj_02 obj_11)
    (pred_2 obj_05 obj_13)
    (pred_2 obj_13 obj_10)
    (pred_2 obj_10 obj_02)
)
 (:goal
  (and
   (pred_5 obj_12)
   (pred_5 obj_08)
   (pred_5 obj_06)
))
(:constraints
  (and
    (always (imply (not (pred_5 obj_08)) (not (pred_5 obj_06))))
    (forall (?m - type_2) (at-most-once (pred_4 ?m obj_01)))
  )
)
)
