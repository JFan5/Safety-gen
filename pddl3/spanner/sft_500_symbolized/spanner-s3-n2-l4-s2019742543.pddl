; params: python3 /home/fjl2401/Safety-gen/spanner/spanner-generator.py 3 2 4 --seed 2019742543 --problem-name spanner-s3-n2-l4-s2019742543
(define (problem spanner-s3-n2-l4-s2019742543)
 (:domain spanner)
 (:objects 
     obj_06 - type_2
     obj_11 obj_01 obj_10 - type_3
     obj_03 obj_02 - type_4
     obj_08 obj_04 obj_09 obj_12 - type_5
     obj_07 obj_05 - type_5
    )
 (:init 
    (pred_6 obj_06 obj_07)
    (pred_6 obj_11 obj_12)
    (pred_5 obj_11)
    (pred_6 obj_01 obj_08)
    (pred_5 obj_01)
    (pred_6 obj_10 obj_09)
    (pred_5 obj_10)
    (pred_4 obj_03)
    (pred_6 obj_03 obj_05)
    (pred_4 obj_02)
    (pred_6 obj_02 obj_05)
    (pred_2 obj_07 obj_08)
    (pred_2 obj_12 obj_05)
    (pred_2 obj_08 obj_04)
    (pred_2 obj_04 obj_09)
    (pred_2 obj_09 obj_12)
)
 (:goal
  (and
   (pred_3 obj_03)
   (pred_3 obj_02)
))
(:constraints
  (and
    (always (imply (not (pred_3 obj_03)) (not (pred_3 obj_02))))
    (forall (?m - type_2) (at-most-once (pred_6 ?m obj_07)))
  )
)
)
