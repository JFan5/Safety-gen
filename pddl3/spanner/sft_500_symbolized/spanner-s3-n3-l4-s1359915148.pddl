; params: python3 /home/fjl2401/Safety-gen/spanner/spanner-generator.py 3 3 4 --seed 1359915148 --problem-name spanner-s3-n3-l4-s1359915148
(define (problem spanner-s3-n3-l4-s1359915148)
 (:domain spanner)
 (:objects 
     obj_06 - type_3
     obj_04 obj_13 obj_10 - type_5
     obj_01 obj_07 obj_03 - type_4
     obj_11 obj_02 obj_05 obj_08 - type_2
     obj_09 obj_12 - type_2
    )
 (:init 
    (pred_2 obj_06 obj_09)
    (pred_2 obj_04 obj_11)
    (pred_1 obj_04)
    (pred_2 obj_13 obj_08)
    (pred_1 obj_13)
    (pred_2 obj_10 obj_05)
    (pred_1 obj_10)
    (pred_5 obj_01)
    (pred_2 obj_01 obj_12)
    (pred_5 obj_07)
    (pred_2 obj_07 obj_12)
    (pred_5 obj_03)
    (pred_2 obj_03 obj_12)
    (pred_6 obj_09 obj_11)
    (pred_6 obj_08 obj_12)
    (pred_6 obj_11 obj_02)
    (pred_6 obj_02 obj_05)
    (pred_6 obj_05 obj_08)
)
 (:goal
  (and
   (pred_3 obj_01)
   (pred_3 obj_07)
   (pred_3 obj_03)
))
(:constraints
  (and
    (always (imply (not (pred_3 obj_01)) (not (pred_3 obj_07))))
    (forall (?m - type_3) (at-most-once (pred_2 ?m obj_09)))
  )
)
)
