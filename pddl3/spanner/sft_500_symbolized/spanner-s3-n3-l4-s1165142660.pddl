; params: python3 /home/fjl2401/Safety-gen/spanner/spanner-generator.py 3 3 4 --seed 1165142660 --problem-name spanner-s3-n3-l4-s1165142660
(define (problem spanner-s3-n3-l4-s1165142660)
 (:domain spanner)
 (:objects 
     obj_07 - type_2
     obj_02 obj_08 obj_03 - type_5
     obj_11 obj_01 obj_06 - type_1
     obj_04 obj_05 obj_10 obj_13 - type_3
     obj_09 obj_12 - type_3
    )
 (:init 
    (pred_1 obj_07 obj_09)
    (pred_1 obj_02 obj_10)
    (pred_5 obj_02)
    (pred_1 obj_08 obj_10)
    (pred_5 obj_08)
    (pred_1 obj_03 obj_10)
    (pred_5 obj_03)
    (pred_4 obj_11)
    (pred_1 obj_11 obj_12)
    (pred_4 obj_01)
    (pred_1 obj_01 obj_12)
    (pred_4 obj_06)
    (pred_1 obj_06 obj_12)
    (pred_6 obj_09 obj_04)
    (pred_6 obj_13 obj_12)
    (pred_6 obj_04 obj_05)
    (pred_6 obj_05 obj_10)
    (pred_6 obj_10 obj_13)
)
 (:goal
  (and
   (pred_2 obj_11)
   (pred_2 obj_01)
   (pred_2 obj_06)
))
(:constraints
  (and
    (always (imply (not (pred_2 obj_01)) (not (pred_2 obj_06))))
    (forall (?m - type_2) (at-most-once (pred_1 ?m obj_09)))
  )
)
)
