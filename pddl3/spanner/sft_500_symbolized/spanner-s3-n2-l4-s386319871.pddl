; params: python3 /home/fjl2401/Safety-gen/spanner/spanner-generator.py 3 2 4 --seed 386319871 --problem-name spanner-s3-n2-l4-s386319871
(define (problem spanner-s3-n2-l4-s386319871)
 (:domain spanner)
 (:objects 
     obj_07 - type_5
     obj_10 obj_06 obj_01 - type_2
     obj_04 obj_05 - type_4
     obj_09 obj_12 obj_08 obj_11 - type_3
     obj_02 obj_03 - type_3
    )
 (:init 
    (pred_1 obj_07 obj_02)
    (pred_1 obj_10 obj_11)
    (pred_3 obj_10)
    (pred_1 obj_06 obj_08)
    (pred_3 obj_06)
    (pred_1 obj_01 obj_09)
    (pred_3 obj_01)
    (pred_2 obj_04)
    (pred_1 obj_04 obj_03)
    (pred_2 obj_05)
    (pred_1 obj_05 obj_03)
    (pred_5 obj_02 obj_09)
    (pred_5 obj_11 obj_03)
    (pred_5 obj_09 obj_12)
    (pred_5 obj_12 obj_08)
    (pred_5 obj_08 obj_11)
)
 (:goal
  (and
   (pred_4 obj_04)
   (pred_4 obj_05)
))
(:constraints
  (and
    (always (imply (not (pred_4 obj_04)) (not (pred_4 obj_05))))
    (forall (?m - type_5) (at-most-once (pred_1 ?m obj_02)))
  )
)
)
