; params: python3 /home/fjl2401/Safety-gen/spanner/spanner-generator.py 3 3 4 --seed 1819508961 --problem-name spanner-s3-n3-l4-s1819508961
(define (problem spanner-s3-n3-l4-s1819508961)
 (:domain spanner)
 (:objects 
     obj_05 - type_4
     obj_04 obj_07 obj_08 - type_1
     obj_13 obj_11 obj_02 - type_3
     obj_01 obj_10 obj_09 obj_03 - type_5
     obj_12 obj_06 - type_5
    )
 (:init 
    (pred_2 obj_05 obj_12)
    (pred_2 obj_04 obj_09)
    (pred_1 obj_04)
    (pred_2 obj_07 obj_01)
    (pred_1 obj_07)
    (pred_2 obj_08 obj_01)
    (pred_1 obj_08)
    (pred_4 obj_13)
    (pred_2 obj_13 obj_06)
    (pred_4 obj_11)
    (pred_2 obj_11 obj_06)
    (pred_4 obj_02)
    (pred_2 obj_02 obj_06)
    (pred_6 obj_12 obj_01)
    (pred_6 obj_03 obj_06)
    (pred_6 obj_01 obj_10)
    (pred_6 obj_10 obj_09)
    (pred_6 obj_09 obj_03)
)
 (:goal
  (and
   (pred_5 obj_13)
   (pred_5 obj_11)
   (pred_5 obj_02)
))
(:constraints
  (and
    (always (imply (not (pred_5 obj_11)) (not (pred_5 obj_02))))
    (forall (?m - type_4) (at-most-once (pred_2 ?m obj_12)))
  )
)
)
