; params: python3 /home/fjl2401/Safety-gen/spanner/spanner-generator.py 3 3 4 --seed 1359915148 --problem-name spanner-s3-n3-l4-s1359915148
(define (problem spanner-s3-n3-l4-s1359915148)
 (:domain spanner)
 (:objects 
     obj_08 - type_2
     obj_12 obj_05 obj_10 - type_5
     obj_09 obj_11 obj_03 - type_1
     obj_04 obj_07 obj_06 obj_02 - type_4
     obj_01 obj_13 - type_4
    )
 (:init 
    (pred_6 obj_08 obj_01)
    (pred_6 obj_12 obj_04)
    (pred_5 obj_12)
    (pred_6 obj_05 obj_02)
    (pred_5 obj_05)
    (pred_6 obj_10 obj_06)
    (pred_5 obj_10)
    (pred_3 obj_09)
    (pred_6 obj_09 obj_13)
    (pred_3 obj_11)
    (pred_6 obj_11 obj_13)
    (pred_3 obj_03)
    (pred_6 obj_03 obj_13)
    (pred_4 obj_01 obj_04)
    (pred_4 obj_02 obj_13)
    (pred_4 obj_04 obj_07)
    (pred_4 obj_07 obj_06)
    (pred_4 obj_06 obj_02)
)
 (:goal
  (and
   (pred_2 obj_09)
   (pred_2 obj_11)
   (pred_2 obj_03)
))
(:constraints
  (and
    (always (imply (not (pred_2 obj_09)) (not (pred_2 obj_11))))
    (forall (?m - type_2) (at-most-once (pred_6 ?m obj_01)))
  )
)
)
