; params: python3 /home/fjl2401/Safety-gen/spanner/spanner-generator.py 3 3 4 --seed 1359915148 --problem-name spanner-s3-n3-l4-s1359915148
(define (problem spanner-s3-n3-l4-s1359915148)
 (:domain spanner)
 (:objects 
     obj_13 - type_5
     obj_03 obj_05 obj_06 - type_3
     obj_09 obj_10 obj_08 - type_1
     obj_04 obj_01 obj_07 obj_12 - type_2
     obj_02 obj_11 - type_2
    )
 (:init 
    (pred_6 obj_13 obj_02)
    (pred_6 obj_03 obj_04)
    (pred_5 obj_03)
    (pred_6 obj_05 obj_12)
    (pred_5 obj_05)
    (pred_6 obj_06 obj_07)
    (pred_5 obj_06)
    (pred_4 obj_09)
    (pred_6 obj_09 obj_11)
    (pred_4 obj_10)
    (pred_6 obj_10 obj_11)
    (pred_4 obj_08)
    (pred_6 obj_08 obj_11)
    (pred_3 obj_02 obj_04)
    (pred_3 obj_12 obj_11)
    (pred_3 obj_04 obj_01)
    (pred_3 obj_01 obj_07)
    (pred_3 obj_07 obj_12)
)
 (:goal
  (and
   (pred_1 obj_09)
   (pred_1 obj_10)
   (pred_1 obj_08)
))
(:constraints
  (and
    (always (imply (not (pred_1 obj_09)) (not (pred_1 obj_10))))
    (forall (?m - type_5) (at-most-once (pred_6 ?m obj_02)))
  )
)
)
