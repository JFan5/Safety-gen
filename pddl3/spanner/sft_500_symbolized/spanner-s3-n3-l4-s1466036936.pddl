; params: python3 /home/fjl2401/Safety-gen/spanner/spanner-generator.py 3 3 4 --seed 1466036936 --problem-name spanner-s3-n3-l4-s1466036936
(define (problem spanner-s3-n3-l4-s1466036936)
 (:domain spanner)
 (:objects 
     obj_05 - type_1
     obj_12 obj_11 obj_13 - type_2
     obj_09 obj_08 obj_06 - type_4
     obj_10 obj_01 obj_02 obj_03 - type_3
     obj_04 obj_07 - type_3
    )
 (:init 
    (pred_2 obj_05 obj_04)
    (pred_2 obj_12 obj_10)
    (pred_6 obj_12)
    (pred_2 obj_11 obj_03)
    (pred_6 obj_11)
    (pred_2 obj_13 obj_10)
    (pred_6 obj_13)
    (pred_3 obj_09)
    (pred_2 obj_09 obj_07)
    (pred_3 obj_08)
    (pred_2 obj_08 obj_07)
    (pred_3 obj_06)
    (pred_2 obj_06 obj_07)
    (pred_4 obj_04 obj_10)
    (pred_4 obj_03 obj_07)
    (pred_4 obj_10 obj_01)
    (pred_4 obj_01 obj_02)
    (pred_4 obj_02 obj_03)
)
 (:goal
  (and
   (pred_5 obj_09)
   (pred_5 obj_08)
   (pred_5 obj_06)
))
(:constraints
  (and
    (always (imply (not (pred_5 obj_09)) (not (pred_5 obj_08))))
    (forall (?m - type_1) (at-most-once (pred_2 ?m obj_04)))
  )
)
)
