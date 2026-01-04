; params: python3 /home/fjl2401/Safety-gen/spanner/spanner-generator.py 3 3 4 --seed 2063701977 --problem-name spanner-s3-n3-l4-s2063701977
(define (problem spanner-s3-n3-l4-s2063701977)
 (:domain spanner)
 (:objects 
     obj_08 - type_3
     obj_13 obj_10 obj_02 - type_2
     obj_12 obj_01 obj_07 - type_1
     obj_04 obj_09 obj_06 obj_03 - type_5
     obj_11 obj_05 - type_5
    )
 (:init 
    (pred_5 obj_08 obj_11)
    (pred_5 obj_13 obj_06)
    (pred_4 obj_13)
    (pred_5 obj_10 obj_04)
    (pred_4 obj_10)
    (pred_5 obj_02 obj_04)
    (pred_4 obj_02)
    (pred_3 obj_12)
    (pred_5 obj_12 obj_05)
    (pred_3 obj_01)
    (pred_5 obj_01 obj_05)
    (pred_3 obj_07)
    (pred_5 obj_07 obj_05)
    (pred_1 obj_11 obj_04)
    (pred_1 obj_03 obj_05)
    (pred_1 obj_04 obj_09)
    (pred_1 obj_09 obj_06)
    (pred_1 obj_06 obj_03)
)
 (:goal
  (and
   (pred_2 obj_12)
   (pred_2 obj_01)
   (pred_2 obj_07)
))
(:constraints
  (and
    (always (imply (not (pred_2 obj_01)) (not (pred_2 obj_07))))
    (forall (?m - type_3) (at-most-once (pred_5 ?m obj_11)))
  )
)
)
