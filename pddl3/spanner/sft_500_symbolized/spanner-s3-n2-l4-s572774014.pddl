; params: python3 /home/fjl2401/Safety-gen/spanner/spanner-generator.py 3 2 4 --seed 572774014 --problem-name spanner-s3-n2-l4-s572774014
(define (problem spanner-s3-n2-l4-s572774014)
 (:domain spanner)
 (:objects 
     obj_12 - type_4
     obj_10 obj_09 obj_04 - type_3
     obj_03 obj_01 - type_5
     obj_11 obj_05 obj_02 obj_07 - type_2
     obj_06 obj_08 - type_2
    )
 (:init 
    (pred_2 obj_12 obj_06)
    (pred_2 obj_10 obj_02)
    (pred_4 obj_10)
    (pred_2 obj_09 obj_05)
    (pred_4 obj_09)
    (pred_2 obj_04 obj_02)
    (pred_4 obj_04)
    (pred_1 obj_03)
    (pred_2 obj_03 obj_08)
    (pred_1 obj_01)
    (pred_2 obj_01 obj_08)
    (pred_5 obj_06 obj_11)
    (pred_5 obj_07 obj_08)
    (pred_5 obj_11 obj_05)
    (pred_5 obj_05 obj_02)
    (pred_5 obj_02 obj_07)
)
 (:goal
  (and
   (pred_3 obj_03)
   (pred_3 obj_01)
))
(:constraints
  (and
    (always (imply (not (pred_3 obj_03)) (not (pred_3 obj_01))))
    (forall (?m - type_4) (at-most-once (pred_2 ?m obj_06)))
  )
)
)
