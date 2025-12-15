; params: python3 /home/fjl2401/Safety-gen/spanner/spanner-generator.py 3 3 4 --seed 209742828 --problem-name spanner-s3-n3-l4-s209742828
(define (problem spanner-s3-n3-l4-s209742828)
 (:domain spanner)
 (:objects 
     obj_08 - type_4
     obj_07 obj_13 obj_11 - type_5
     obj_05 obj_01 obj_06 - type_1
     obj_04 obj_09 obj_03 obj_12 - type_3
     obj_10 obj_02 - type_3
    )
 (:init 
    (pred_3 obj_08 obj_10)
    (pred_3 obj_07 obj_03)
    (pred_1 obj_07)
    (pred_3 obj_13 obj_09)
    (pred_1 obj_13)
    (pred_3 obj_11 obj_04)
    (pred_1 obj_11)
    (pred_5 obj_05)
    (pred_3 obj_05 obj_02)
    (pred_5 obj_01)
    (pred_3 obj_01 obj_02)
    (pred_5 obj_06)
    (pred_3 obj_06 obj_02)
    (pred_4 obj_10 obj_04)
    (pred_4 obj_12 obj_02)
    (pred_4 obj_04 obj_09)
    (pred_4 obj_09 obj_03)
    (pred_4 obj_03 obj_12)
)
 (:goal
  (and
   (pred_2 obj_05)
   (pred_2 obj_01)
   (pred_2 obj_06)
))
(:constraints
  (and
    (always (imply (not (pred_2 obj_01)) (not (pred_2 obj_06))))
    (forall (?m - type_4) (at-most-once (pred_3 ?m obj_10)))
  )
)
)
