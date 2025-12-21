; params: python3 /home/fjl2401/Safety-gen/spanner/spanner-generator.py 3 2 4 --seed 202181322 --problem-name spanner-s3-n2-l4-s202181322
(define (problem spanner-s3-n2-l4-s202181322)
 (:domain spanner)
 (:objects 
     obj_08 - type_3
     obj_05 obj_07 obj_01 - type_5
     obj_06 obj_02 - type_4
     obj_10 obj_04 obj_11 obj_12 - type_2
     obj_09 obj_03 - type_2
    )
 (:init 
    (pred_2 obj_08 obj_09)
    (pred_2 obj_05 obj_12)
    (pred_1 obj_05)
    (pred_2 obj_07 obj_12)
    (pred_1 obj_07)
    (pred_2 obj_01 obj_12)
    (pred_1 obj_01)
    (pred_5 obj_06)
    (pred_2 obj_06 obj_03)
    (pred_5 obj_02)
    (pred_2 obj_02 obj_03)
    (pred_6 obj_09 obj_10)
    (pred_6 obj_12 obj_03)
    (pred_6 obj_10 obj_04)
    (pred_6 obj_04 obj_11)
    (pred_6 obj_11 obj_12)
)
 (:goal
  (and
   (pred_3 obj_06)
   (pred_3 obj_02)
))
(:constraints
  (and
    (always (imply (not (pred_3 obj_06)) (not (pred_3 obj_02))))
    (forall (?m - type_3) (at-most-once (pred_2 ?m obj_09)))
  )
)
)
