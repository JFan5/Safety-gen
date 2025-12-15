; params: python3 /home/fjl2401/Safety-gen/spanner/spanner-generator.py 3 2 4 --seed 386319871 --problem-name spanner-s3-n2-l4-s386319871
(define (problem spanner-s3-n2-l4-s386319871)
 (:domain spanner)
 (:objects 
     obj_07 - type_5
     obj_11 obj_12 obj_08 - type_1
     obj_10 obj_09 - type_3
     obj_04 obj_02 obj_06 obj_05 - type_4
     obj_03 obj_01 - type_4
    )
 (:init 
    (pred_5 obj_07 obj_03)
    (pred_5 obj_11 obj_05)
    (pred_1 obj_11)
    (pred_5 obj_12 obj_06)
    (pred_1 obj_12)
    (pred_5 obj_08 obj_04)
    (pred_1 obj_08)
    (pred_4 obj_10)
    (pred_5 obj_10 obj_01)
    (pred_4 obj_09)
    (pred_5 obj_09 obj_01)
    (pred_2 obj_03 obj_04)
    (pred_2 obj_05 obj_01)
    (pred_2 obj_04 obj_02)
    (pred_2 obj_02 obj_06)
    (pred_2 obj_06 obj_05)
)
 (:goal
  (and
   (pred_3 obj_10)
   (pred_3 obj_09)
))
(:constraints
  (and
    (always (imply (not (pred_3 obj_10)) (not (pred_3 obj_09))))
    (forall (?m - type_5) (at-most-once (pred_5 ?m obj_03)))
  )
)
)
