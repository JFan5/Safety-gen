; params: python3 /home/fjl2401/Safety-gen/spanner/spanner-generator.py 3 3 4 --seed 2008090643 --problem-name spanner-s3-n3-l4-s2008090643
(define (problem spanner-s3-n3-l4-s2008090643)
 (:domain spanner)
 (:objects 
     obj_10 - type_3
     obj_06 obj_09 obj_04 - type_5
     obj_02 obj_13 obj_01 - type_4
     obj_08 obj_03 obj_12 obj_07 - type_1
     obj_05 obj_11 - type_1
    )
 (:init 
    (pred_5 obj_10 obj_05)
    (pred_5 obj_06 obj_12)
    (pred_1 obj_06)
    (pred_5 obj_09 obj_07)
    (pred_1 obj_09)
    (pred_5 obj_04 obj_12)
    (pred_1 obj_04)
    (pred_3 obj_02)
    (pred_5 obj_02 obj_11)
    (pred_3 obj_13)
    (pred_5 obj_13 obj_11)
    (pred_3 obj_01)
    (pred_5 obj_01 obj_11)
    (pred_2 obj_05 obj_08)
    (pred_2 obj_07 obj_11)
    (pred_2 obj_08 obj_03)
    (pred_2 obj_03 obj_12)
    (pred_2 obj_12 obj_07)
)
 (:goal
  (and
   (pred_4 obj_02)
   (pred_4 obj_13)
   (pred_4 obj_01)
))
(:constraints
  (and
    (always (imply (not (pred_4 obj_13)) (not (pred_4 obj_01))))
    (forall (?m - type_3) (at-most-once (pred_5 ?m obj_05)))
  )
)
)
