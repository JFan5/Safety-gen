; params: python3 /home/fjl2401/Safety-gen/spanner/spanner-generator.py 3 2 4 --seed 2096978741 --problem-name spanner-s3-n2-l4-s2096978741
(define (problem spanner-s3-n2-l4-s2096978741)
 (:domain spanner)
 (:objects 
     obj_05 - type_5
     obj_04 obj_01 obj_07 - type_3
     obj_08 obj_02 - type_1
     obj_11 obj_12 obj_06 obj_10 - type_2
     obj_09 obj_03 - type_2
    )
 (:init 
    (pred_6 obj_05 obj_09)
    (pred_6 obj_04 obj_10)
    (pred_5 obj_04)
    (pred_6 obj_01 obj_12)
    (pred_5 obj_01)
    (pred_6 obj_07 obj_06)
    (pred_5 obj_07)
    (pred_4 obj_08)
    (pred_6 obj_08 obj_03)
    (pred_4 obj_02)
    (pred_6 obj_02 obj_03)
    (pred_3 obj_09 obj_11)
    (pred_3 obj_10 obj_03)
    (pred_3 obj_11 obj_12)
    (pred_3 obj_12 obj_06)
    (pred_3 obj_06 obj_10)
)
 (:goal
  (and
   (pred_1 obj_08)
   (pred_1 obj_02)
))
(:constraints
  (and
    (always (imply (not (pred_1 obj_08)) (not (pred_1 obj_02))))
    (forall (?m - type_5) (at-most-once (pred_6 ?m obj_09)))
  )
)
)
