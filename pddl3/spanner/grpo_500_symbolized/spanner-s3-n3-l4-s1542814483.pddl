; params: python3 /home/fjl2401/Safety-gen/spanner/spanner-generator.py 3 3 4 --seed 1542814483 --problem-name spanner-s3-n3-l4-s1542814483
(define (problem spanner-s3-n3-l4-s1542814483)
 (:domain spanner)
 (:objects 
     obj_13 - type_5
     obj_05 obj_04 obj_07 - type_3
     obj_06 obj_03 obj_02 - type_1
     obj_08 obj_12 obj_01 obj_11 - type_2
     obj_10 obj_09 - type_2
    )
 (:init 
    (pred_6 obj_13 obj_10)
    (pred_6 obj_05 obj_08)
    (pred_5 obj_05)
    (pred_6 obj_04 obj_12)
    (pred_5 obj_04)
    (pred_6 obj_07 obj_01)
    (pred_5 obj_07)
    (pred_4 obj_06)
    (pred_6 obj_06 obj_09)
    (pred_4 obj_03)
    (pred_6 obj_03 obj_09)
    (pred_4 obj_02)
    (pred_6 obj_02 obj_09)
    (pred_3 obj_10 obj_08)
    (pred_3 obj_11 obj_09)
    (pred_3 obj_08 obj_12)
    (pred_3 obj_12 obj_01)
    (pred_3 obj_01 obj_11)
)
 (:goal
  (and
   (pred_1 obj_06)
   (pred_1 obj_03)
   (pred_1 obj_02)
))
(:constraints
  (and
    (always (imply (not (pred_1 obj_06)) (not (pred_1 obj_03))))
    (forall (?m - type_5) (at-most-once (pred_6 ?m obj_10)))
  )
)
)
