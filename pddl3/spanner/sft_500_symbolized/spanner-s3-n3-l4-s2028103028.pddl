; params: python3 /home/fjl2401/Safety-gen/spanner/spanner-generator.py 3 3 4 --seed 2028103028 --problem-name spanner-s3-n3-l4-s2028103028
(define (problem spanner-s3-n3-l4-s2028103028)
 (:domain spanner)
 (:objects 
     obj_11 - type_4
     obj_03 obj_09 obj_07 - type_1
     obj_01 obj_12 obj_04 - type_3
     obj_08 obj_06 obj_10 obj_13 - type_2
     obj_02 obj_05 - type_2
    )
 (:init 
    (pred_2 obj_11 obj_02)
    (pred_2 obj_03 obj_06)
    (pred_5 obj_03)
    (pred_2 obj_09 obj_13)
    (pred_5 obj_09)
    (pred_2 obj_07 obj_06)
    (pred_5 obj_07)
    (pred_3 obj_01)
    (pred_2 obj_01 obj_05)
    (pred_3 obj_12)
    (pred_2 obj_12 obj_05)
    (pred_3 obj_04)
    (pred_2 obj_04 obj_05)
    (pred_1 obj_02 obj_08)
    (pred_1 obj_13 obj_05)
    (pred_1 obj_08 obj_06)
    (pred_1 obj_06 obj_10)
    (pred_1 obj_10 obj_13)
)
 (:goal
  (and
   (pred_6 obj_01)
   (pred_6 obj_12)
   (pred_6 obj_04)
))
(:constraints
  (and
    (always (imply (not (pred_6 obj_01)) (not (pred_6 obj_12))))
    (forall (?m - type_4) (at-most-once (pred_2 ?m obj_02)))
  )
)
)
