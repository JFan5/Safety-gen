; params: python3 /home/fjl2401/Safety-gen/spanner/spanner-generator.py 3 2 4 --seed 386319871 --problem-name spanner-s3-n2-l4-s386319871
(define (problem spanner-s3-n2-l4-s386319871)
 (:domain spanner)
 (:objects 
     obj_01 - type_3
     obj_09 obj_05 obj_08 - type_5
     obj_04 obj_03 - type_4
     obj_02 obj_11 obj_12 obj_06 - type_2
     obj_10 obj_07 - type_2
    )
 (:init 
    (pred_2 obj_01 obj_10)
    (pred_2 obj_09 obj_06)
    (pred_1 obj_09)
    (pred_2 obj_05 obj_12)
    (pred_1 obj_05)
    (pred_2 obj_08 obj_02)
    (pred_1 obj_08)
    (pred_5 obj_04)
    (pred_2 obj_04 obj_07)
    (pred_5 obj_03)
    (pred_2 obj_03 obj_07)
    (pred_6 obj_10 obj_02)
    (pred_6 obj_06 obj_07)
    (pred_6 obj_02 obj_11)
    (pred_6 obj_11 obj_12)
    (pred_6 obj_12 obj_06)
)
 (:goal
  (and
   (pred_3 obj_04)
   (pred_3 obj_03)
))
(:constraints
  (and
    (always (imply (not (pred_3 obj_04)) (not (pred_3 obj_03))))
    (forall (?m - type_3) (at-most-once (pred_2 ?m obj_10)))
  )
)
)
