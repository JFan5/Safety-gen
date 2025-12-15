; params: python3 /home/fjl2401/Safety-gen/spanner/spanner-generator.py 3 3 4 --seed 1465229797 --problem-name spanner-s3-n3-l4-s1465229797
(define (problem spanner-s3-n3-l4-s1465229797)
 (:domain spanner)
 (:objects 
     obj_05 - type_2
     obj_13 obj_08 obj_04 - type_4
     obj_09 obj_02 obj_06 - type_5
     obj_12 obj_10 obj_01 obj_03 - type_1
     obj_07 obj_11 - type_1
    )
 (:init 
    (pred_1 obj_05 obj_07)
    (pred_1 obj_13 obj_10)
    (pred_6 obj_13)
    (pred_1 obj_08 obj_01)
    (pred_6 obj_08)
    (pred_1 obj_04 obj_01)
    (pred_6 obj_04)
    (pred_4 obj_09)
    (pred_1 obj_09 obj_11)
    (pred_4 obj_02)
    (pred_1 obj_02 obj_11)
    (pred_4 obj_06)
    (pred_1 obj_06 obj_11)
    (pred_3 obj_07 obj_12)
    (pred_3 obj_03 obj_11)
    (pred_3 obj_12 obj_10)
    (pred_3 obj_10 obj_01)
    (pred_3 obj_01 obj_03)
)
 (:goal
  (and
   (pred_5 obj_09)
   (pred_5 obj_02)
   (pred_5 obj_06)
))
(:constraints
  (and
    (always (imply (not (pred_5 obj_09)) (not (pred_5 obj_02))))
    (forall (?m - type_2) (at-most-once (pred_1 ?m obj_07)))
  )
)
)
