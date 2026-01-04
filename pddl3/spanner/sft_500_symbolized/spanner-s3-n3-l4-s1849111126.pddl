; params: python3 /home/fjl2401/Safety-gen/spanner/spanner-generator.py 3 3 4 --seed 1849111126 --problem-name spanner-s3-n3-l4-s1849111126
(define (problem spanner-s3-n3-l4-s1849111126)
 (:domain spanner)
 (:objects 
     obj_05 - type_2
     obj_11 obj_04 obj_03 - type_4
     obj_02 obj_12 obj_07 - type_1
     obj_13 obj_09 obj_10 obj_01 - type_5
     obj_06 obj_08 - type_5
    )
 (:init 
    (pred_6 obj_05 obj_06)
    (pred_6 obj_11 obj_10)
    (pred_1 obj_11)
    (pred_6 obj_04 obj_10)
    (pred_1 obj_04)
    (pred_6 obj_03 obj_09)
    (pred_1 obj_03)
    (pred_3 obj_02)
    (pred_6 obj_02 obj_08)
    (pred_3 obj_12)
    (pred_6 obj_12 obj_08)
    (pred_3 obj_07)
    (pred_6 obj_07 obj_08)
    (pred_4 obj_06 obj_13)
    (pred_4 obj_01 obj_08)
    (pred_4 obj_13 obj_09)
    (pred_4 obj_09 obj_10)
    (pred_4 obj_10 obj_01)
)
 (:goal
  (and
   (pred_5 obj_02)
   (pred_5 obj_12)
   (pred_5 obj_07)
))
(:constraints
  (and
    (always (imply (not (pred_5 obj_12)) (not (pred_5 obj_07))))
    (forall (?m - type_2) (at-most-once (pred_6 ?m obj_06)))
  )
)
)
