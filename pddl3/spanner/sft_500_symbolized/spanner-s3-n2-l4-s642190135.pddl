; params: python3 /home/fjl2401/Safety-gen/spanner/spanner-generator.py 3 2 4 --seed 642190135 --problem-name spanner-s3-n2-l4-s642190135
(define (problem spanner-s3-n2-l4-s642190135)
 (:domain spanner)
 (:objects 
     obj_03 - type_1
     obj_05 obj_08 obj_02 - type_5
     obj_12 obj_06 - type_3
     obj_09 obj_04 obj_11 obj_07 - type_2
     obj_10 obj_01 - type_2
    )
 (:init 
    (pred_5 obj_03 obj_10)
    (pred_5 obj_05 obj_09)
    (pred_1 obj_05)
    (pred_5 obj_08 obj_04)
    (pred_1 obj_08)
    (pred_5 obj_02 obj_11)
    (pred_1 obj_02)
    (pred_2 obj_12)
    (pred_5 obj_12 obj_01)
    (pred_2 obj_06)
    (pred_5 obj_06 obj_01)
    (pred_4 obj_10 obj_09)
    (pred_4 obj_07 obj_01)
    (pred_4 obj_09 obj_04)
    (pred_4 obj_04 obj_11)
    (pred_4 obj_11 obj_07)
)
 (:goal
  (and
   (pred_6 obj_12)
   (pred_6 obj_06)
))
(:constraints
  (and
    (always (imply (not (pred_6 obj_12)) (not (pred_6 obj_06))))
    (forall (?m - type_1) (at-most-once (pred_5 ?m obj_10)))
  )
)
)
