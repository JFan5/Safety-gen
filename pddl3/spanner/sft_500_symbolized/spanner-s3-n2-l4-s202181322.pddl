; params: python3 /home/fjl2401/Safety-gen/spanner/spanner-generator.py 3 2 4 --seed 202181322 --problem-name spanner-s3-n2-l4-s202181322
(define (problem spanner-s3-n2-l4-s202181322)
 (:domain spanner)
 (:objects 
     obj_11 - type_4
     obj_01 obj_04 obj_06 - type_1
     obj_05 obj_02 - type_5
     obj_12 obj_07 obj_10 obj_08 - type_3
     obj_09 obj_03 - type_3
    )
 (:init 
    (pred_3 obj_11 obj_09)
    (pred_3 obj_01 obj_08)
    (pred_6 obj_01)
    (pred_3 obj_04 obj_08)
    (pred_6 obj_04)
    (pred_3 obj_06 obj_08)
    (pred_6 obj_06)
    (pred_4 obj_05)
    (pred_3 obj_05 obj_03)
    (pred_4 obj_02)
    (pred_3 obj_02 obj_03)
    (pred_2 obj_09 obj_12)
    (pred_2 obj_08 obj_03)
    (pred_2 obj_12 obj_07)
    (pred_2 obj_07 obj_10)
    (pred_2 obj_10 obj_08)
)
 (:goal
  (and
   (pred_1 obj_05)
   (pred_1 obj_02)
))
(:constraints
  (and
    (always (imply (not (pred_1 obj_05)) (not (pred_1 obj_02))))
    (forall (?m - type_4) (at-most-once (pred_3 ?m obj_09)))
  )
)
)
