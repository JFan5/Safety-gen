; params: python3 /home/fjl2401/Safety-gen/spanner/spanner-generator.py 3 3 4 --seed 1359915148 --problem-name spanner-s3-n3-l4-s1359915148
(define (problem spanner-s3-n3-l4-s1359915148)
 (:domain spanner)
 (:objects 
     obj_05 - type_1
     obj_09 obj_06 obj_13 - type_2
     obj_12 obj_07 obj_04 - type_5
     obj_02 obj_01 obj_10 obj_03 - type_4
     obj_11 obj_08 - type_4
    )
 (:init 
    (pred_5 obj_05 obj_11)
    (pred_5 obj_09 obj_02)
    (pred_6 obj_09)
    (pred_5 obj_06 obj_03)
    (pred_6 obj_06)
    (pred_5 obj_13 obj_10)
    (pred_6 obj_13)
    (pred_2 obj_12)
    (pred_5 obj_12 obj_08)
    (pred_2 obj_07)
    (pred_5 obj_07 obj_08)
    (pred_2 obj_04)
    (pred_5 obj_04 obj_08)
    (pred_4 obj_11 obj_02)
    (pred_4 obj_03 obj_08)
    (pred_4 obj_02 obj_01)
    (pred_4 obj_01 obj_10)
    (pred_4 obj_10 obj_03)
)
 (:goal
  (and
   (pred_1 obj_12)
   (pred_1 obj_07)
   (pred_1 obj_04)
))
(:constraints
  (and
    (always (imply (not (pred_1 obj_12)) (not (pred_1 obj_07))))
    (forall (?m - type_1) (at-most-once (pred_5 ?m obj_11)))
  )
)
)
