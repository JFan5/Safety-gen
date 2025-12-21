; params: python3 /home/fjl2401/Safety-gen/spanner/spanner-generator.py 3 3 4 --seed 1464672124 --problem-name spanner-s3-n3-l4-s1464672124
(define (problem spanner-s3-n3-l4-s1464672124)
 (:domain spanner)
 (:objects 
     obj_05 - type_3
     obj_11 obj_09 obj_08 - type_5
     obj_13 obj_07 obj_03 - type_4
     obj_12 obj_10 obj_06 obj_02 - type_2
     obj_01 obj_04 - type_2
    )
 (:init 
    (pred_2 obj_05 obj_01)
    (pred_2 obj_11 obj_06)
    (pred_1 obj_11)
    (pred_2 obj_09 obj_02)
    (pred_1 obj_09)
    (pred_2 obj_08 obj_06)
    (pred_1 obj_08)
    (pred_5 obj_13)
    (pred_2 obj_13 obj_04)
    (pred_5 obj_07)
    (pred_2 obj_07 obj_04)
    (pred_5 obj_03)
    (pred_2 obj_03 obj_04)
    (pred_6 obj_01 obj_12)
    (pred_6 obj_02 obj_04)
    (pred_6 obj_12 obj_10)
    (pred_6 obj_10 obj_06)
    (pred_6 obj_06 obj_02)
)
 (:goal
  (and
   (pred_3 obj_13)
   (pred_3 obj_07)
   (pred_3 obj_03)
))
(:constraints
  (and
    (always (imply (not (pred_3 obj_07)) (not (pred_3 obj_03))))
    (forall (?m - type_3) (at-most-once (pred_2 ?m obj_01)))
  )
)
)
