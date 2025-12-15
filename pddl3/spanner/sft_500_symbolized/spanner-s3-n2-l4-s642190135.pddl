; params: python3 /home/fjl2401/Safety-gen/spanner/spanner-generator.py 3 2 4 --seed 642190135 --problem-name spanner-s3-n2-l4-s642190135
(define (problem spanner-s3-n2-l4-s642190135)
 (:domain spanner)
 (:objects 
     obj_04 - type_5
     obj_07 obj_12 obj_01 - type_3
     obj_11 obj_02 - type_1
     obj_08 obj_10 obj_05 obj_06 - type_2
     obj_03 obj_09 - type_2
    )
 (:init 
    (pred_6 obj_04 obj_03)
    (pred_6 obj_07 obj_08)
    (pred_2 obj_07)
    (pred_6 obj_12 obj_10)
    (pred_2 obj_12)
    (pred_6 obj_01 obj_05)
    (pred_2 obj_01)
    (pred_5 obj_11)
    (pred_6 obj_11 obj_09)
    (pred_5 obj_02)
    (pred_6 obj_02 obj_09)
    (pred_4 obj_03 obj_08)
    (pred_4 obj_06 obj_09)
    (pred_4 obj_08 obj_10)
    (pred_4 obj_10 obj_05)
    (pred_4 obj_05 obj_06)
)
 (:goal
  (and
   (pred_3 obj_11)
   (pred_3 obj_02)
))
(:constraints
  (and
    (always (imply (not (pred_3 obj_11)) (not (pred_3 obj_02))))
    (forall (?m - type_5) (at-most-once (pred_6 ?m obj_03)))
  )
)
)
