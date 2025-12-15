; params: python3 /home/fjl2401/Safety-gen/spanner/spanner-generator.py 3 2 4 --seed 202181322 --problem-name spanner-s3-n2-l4-s202181322
(define (problem spanner-s3-n2-l4-s202181322)
 (:domain spanner)
 (:objects 
     obj_06 - type_1
     obj_02 obj_12 obj_07 - type_5
     obj_01 obj_10 - type_4
     obj_03 obj_08 obj_05 obj_11 - type_3
     obj_09 obj_04 - type_3
    )
 (:init 
    (pred_6 obj_06 obj_09)
    (pred_6 obj_02 obj_11)
    (pred_1 obj_02)
    (pred_6 obj_12 obj_11)
    (pred_1 obj_12)
    (pred_6 obj_07 obj_11)
    (pred_1 obj_07)
    (pred_2 obj_01)
    (pred_6 obj_01 obj_04)
    (pred_2 obj_10)
    (pred_6 obj_10 obj_04)
    (pred_5 obj_09 obj_03)
    (pred_5 obj_11 obj_04)
    (pred_5 obj_03 obj_08)
    (pred_5 obj_08 obj_05)
    (pred_5 obj_05 obj_11)
)
 (:goal
  (and
   (pred_3 obj_01)
   (pred_3 obj_10)
))
(:constraints
  (and
    (always (imply (not (pred_3 obj_01)) (not (pred_3 obj_10))))
    (forall (?m - type_1) (at-most-once (pred_6 ?m obj_09)))
  )
)
)
