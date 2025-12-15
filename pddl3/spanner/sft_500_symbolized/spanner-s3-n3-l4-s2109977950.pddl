; params: python3 /home/fjl2401/Safety-gen/spanner/spanner-generator.py 3 3 4 --seed 2109977950 --problem-name spanner-s3-n3-l4-s2109977950
(define (problem spanner-s3-n3-l4-s2109977950)
 (:domain spanner)
 (:objects 
     obj_06 - type_5
     obj_04 obj_05 obj_11 - type_3
     obj_08 obj_07 obj_03 - type_1
     obj_01 obj_13 obj_09 obj_10 - type_4
     obj_02 obj_12 - type_4
    )
 (:init 
    (pred_6 obj_06 obj_02)
    (pred_6 obj_04 obj_10)
    (pred_1 obj_04)
    (pred_6 obj_05 obj_10)
    (pred_1 obj_05)
    (pred_6 obj_11 obj_10)
    (pred_1 obj_11)
    (pred_4 obj_08)
    (pred_6 obj_08 obj_12)
    (pred_4 obj_07)
    (pred_6 obj_07 obj_12)
    (pred_4 obj_03)
    (pred_6 obj_03 obj_12)
    (pred_3 obj_02 obj_01)
    (pred_3 obj_10 obj_12)
    (pred_3 obj_01 obj_13)
    (pred_3 obj_13 obj_09)
    (pred_3 obj_09 obj_10)
)
 (:goal
  (and
   (pred_2 obj_08)
   (pred_2 obj_07)
   (pred_2 obj_03)
))
(:constraints
  (and
    (always (imply (not (pred_2 obj_07)) (not (pred_2 obj_03))))
    (forall (?m - type_5) (at-most-once (pred_6 ?m obj_02)))
  )
)
)
