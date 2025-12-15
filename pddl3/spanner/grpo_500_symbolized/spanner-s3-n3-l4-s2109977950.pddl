; params: python3 /home/fjl2401/Safety-gen/spanner/spanner-generator.py 3 3 4 --seed 2109977950 --problem-name spanner-s3-n3-l4-s2109977950
(define (problem spanner-s3-n3-l4-s2109977950)
 (:domain spanner)
 (:objects 
     obj_10 - type_4
     obj_07 obj_08 obj_11 - type_5
     obj_03 obj_13 obj_12 - type_1
     obj_01 obj_02 obj_04 obj_09 - type_3
     obj_05 obj_06 - type_3
    )
 (:init 
    (pred_3 obj_10 obj_05)
    (pred_3 obj_07 obj_09)
    (pred_1 obj_07)
    (pred_3 obj_08 obj_09)
    (pred_1 obj_08)
    (pred_3 obj_11 obj_09)
    (pred_1 obj_11)
    (pred_5 obj_03)
    (pred_3 obj_03 obj_06)
    (pred_5 obj_13)
    (pred_3 obj_13 obj_06)
    (pred_5 obj_12)
    (pred_3 obj_12 obj_06)
    (pred_4 obj_05 obj_01)
    (pred_4 obj_09 obj_06)
    (pred_4 obj_01 obj_02)
    (pred_4 obj_02 obj_04)
    (pred_4 obj_04 obj_09)
)
 (:goal
  (and
   (pred_2 obj_03)
   (pred_2 obj_13)
   (pred_2 obj_12)
))
(:constraints
  (and
    (always (imply (not (pred_2 obj_13)) (not (pred_2 obj_12))))
    (forall (?m - type_4) (at-most-once (pred_3 ?m obj_05)))
  )
)
)
