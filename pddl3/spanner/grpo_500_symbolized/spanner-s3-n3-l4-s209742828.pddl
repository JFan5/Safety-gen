; params: python3 /home/fjl2401/Safety-gen/spanner/spanner-generator.py 3 3 4 --seed 209742828 --problem-name spanner-s3-n3-l4-s209742828
(define (problem spanner-s3-n3-l4-s209742828)
 (:domain spanner)
 (:objects 
     obj_06 - type_5
     obj_03 obj_07 obj_09 - type_3
     obj_13 obj_08 obj_12 - type_1
     obj_05 obj_10 obj_01 obj_11 - type_2
     obj_02 obj_04 - type_2
    )
 (:init 
    (pred_6 obj_06 obj_02)
    (pred_6 obj_03 obj_01)
    (pred_5 obj_03)
    (pred_6 obj_07 obj_10)
    (pred_5 obj_07)
    (pred_6 obj_09 obj_05)
    (pred_5 obj_09)
    (pred_4 obj_13)
    (pred_6 obj_13 obj_04)
    (pred_4 obj_08)
    (pred_6 obj_08 obj_04)
    (pred_4 obj_12)
    (pred_6 obj_12 obj_04)
    (pred_3 obj_02 obj_05)
    (pred_3 obj_11 obj_04)
    (pred_3 obj_05 obj_10)
    (pred_3 obj_10 obj_01)
    (pred_3 obj_01 obj_11)
)
 (:goal
  (and
   (pred_1 obj_13)
   (pred_1 obj_08)
   (pred_1 obj_12)
))
(:constraints
  (and
    (always (imply (not (pred_1 obj_08)) (not (pred_1 obj_12))))
    (forall (?m - type_5) (at-most-once (pred_6 ?m obj_02)))
  )
)
)
