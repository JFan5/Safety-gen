; params: python3 /home/fjl2401/Safety-gen/spanner/spanner-generator.py 3 3 4 --seed 1465229797 --problem-name spanner-s3-n3-l4-s1465229797
(define (problem spanner-s3-n3-l4-s1465229797)
 (:domain spanner)
 (:objects 
     obj_03 - type_1
     obj_05 obj_08 obj_02 - type_4
     obj_13 obj_11 obj_09 - type_3
     obj_10 obj_07 obj_06 obj_01 - type_5
     obj_04 obj_12 - type_5
    )
 (:init 
    (pred_5 obj_03 obj_04)
    (pred_5 obj_05 obj_07)
    (pred_2 obj_05)
    (pred_5 obj_08 obj_06)
    (pred_2 obj_08)
    (pred_5 obj_02 obj_06)
    (pred_2 obj_02)
    (pred_6 obj_13)
    (pred_5 obj_13 obj_12)
    (pred_6 obj_11)
    (pred_5 obj_11 obj_12)
    (pred_6 obj_09)
    (pred_5 obj_09 obj_12)
    (pred_1 obj_04 obj_10)
    (pred_1 obj_01 obj_12)
    (pred_1 obj_10 obj_07)
    (pred_1 obj_07 obj_06)
    (pred_1 obj_06 obj_01)
)
 (:goal
  (and
   (pred_4 obj_13)
   (pred_4 obj_11)
   (pred_4 obj_09)
))
(:constraints
  (and
    (always (imply (not (pred_4 obj_13)) (not (pred_4 obj_11))))
    (forall (?m - type_1) (at-most-once (pred_5 ?m obj_04)))
  )
)
)
