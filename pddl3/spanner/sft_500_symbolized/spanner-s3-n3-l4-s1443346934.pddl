; params: python3 /home/fjl2401/Safety-gen/spanner/spanner-generator.py 3 3 4 --seed 1443346934 --problem-name spanner-s3-n3-l4-s1443346934
(define (problem spanner-s3-n3-l4-s1443346934)
 (:domain spanner)
 (:objects 
     obj_11 - type_2
     obj_08 obj_02 obj_03 - type_1
     obj_10 obj_07 obj_04 - type_4
     obj_13 obj_12 obj_05 obj_01 - type_5
     obj_06 obj_09 - type_5
    )
 (:init 
    (pred_2 obj_11 obj_06)
    (pred_2 obj_08 obj_13)
    (pred_1 obj_08)
    (pred_2 obj_02 obj_13)
    (pred_1 obj_02)
    (pred_2 obj_03 obj_13)
    (pred_1 obj_03)
    (pred_4 obj_10)
    (pred_2 obj_10 obj_09)
    (pred_4 obj_07)
    (pred_2 obj_07 obj_09)
    (pred_4 obj_04)
    (pred_2 obj_04 obj_09)
    (pred_6 obj_06 obj_13)
    (pred_6 obj_01 obj_09)
    (pred_6 obj_13 obj_12)
    (pred_6 obj_12 obj_05)
    (pred_6 obj_05 obj_01)
)
 (:goal
  (and
   (pred_5 obj_10)
   (pred_5 obj_07)
   (pred_5 obj_04)
))
(:constraints
  (and
    (always (imply (not (pred_5 obj_10)) (not (pred_5 obj_07))))
    (forall (?m - type_2) (at-most-once (pred_2 ?m obj_06)))
  )
)
)
