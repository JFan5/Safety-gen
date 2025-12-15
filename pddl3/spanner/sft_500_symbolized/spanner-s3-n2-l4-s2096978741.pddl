; params: python3 /home/fjl2401/Safety-gen/spanner/spanner-generator.py 3 2 4 --seed 2096978741 --problem-name spanner-s3-n2-l4-s2096978741
(define (problem spanner-s3-n2-l4-s2096978741)
 (:domain spanner)
 (:objects 
     obj_11 - type_1
     obj_01 obj_03 obj_12 - type_5
     obj_08 obj_10 - type_3
     obj_07 obj_09 obj_04 obj_05 - type_4
     obj_02 obj_06 - type_4
    )
 (:init 
    (pred_1 obj_11 obj_02)
    (pred_1 obj_01 obj_05)
    (pred_5 obj_01)
    (pred_1 obj_03 obj_09)
    (pred_5 obj_03)
    (pred_1 obj_12 obj_04)
    (pred_5 obj_12)
    (pred_3 obj_08)
    (pred_1 obj_08 obj_06)
    (pred_3 obj_10)
    (pred_1 obj_10 obj_06)
    (pred_2 obj_02 obj_07)
    (pred_2 obj_05 obj_06)
    (pred_2 obj_07 obj_09)
    (pred_2 obj_09 obj_04)
    (pred_2 obj_04 obj_05)
)
 (:goal
  (and
   (pred_4 obj_08)
   (pred_4 obj_10)
))
(:constraints
  (and
    (always (imply (not (pred_4 obj_08)) (not (pred_4 obj_10))))
    (forall (?m - type_1) (at-most-once (pred_1 ?m obj_02)))
  )
)
)
