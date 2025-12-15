; params: python3 /home/fjl2401/Safety-gen/spanner/spanner-generator.py 3 2 4 --seed 293297452 --problem-name spanner-s3-n2-l4-s293297452
(define (problem spanner-s3-n2-l4-s293297452)
 (:domain spanner)
 (:objects 
     obj_10 - type_4
     obj_01 obj_04 obj_11 - type_5
     obj_03 obj_08 - type_1
     obj_12 obj_02 obj_05 obj_06 - type_3
     obj_09 obj_07 - type_3
    )
 (:init 
    (pred_3 obj_10 obj_09)
    (pred_3 obj_01 obj_12)
    (pred_1 obj_01)
    (pred_3 obj_04 obj_12)
    (pred_1 obj_04)
    (pred_3 obj_11 obj_12)
    (pred_1 obj_11)
    (pred_5 obj_03)
    (pred_3 obj_03 obj_07)
    (pred_5 obj_08)
    (pred_3 obj_08 obj_07)
    (pred_4 obj_09 obj_12)
    (pred_4 obj_06 obj_07)
    (pred_4 obj_12 obj_02)
    (pred_4 obj_02 obj_05)
    (pred_4 obj_05 obj_06)
)
 (:goal
  (and
   (pred_2 obj_03)
   (pred_2 obj_08)
))
(:constraints
  (and
    (always (imply (not (pred_2 obj_03)) (not (pred_2 obj_08))))
    (forall (?m - type_4) (at-most-once (pred_3 ?m obj_09)))
  )
)
)
