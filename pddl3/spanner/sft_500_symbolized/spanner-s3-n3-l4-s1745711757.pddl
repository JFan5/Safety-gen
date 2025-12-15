; params: python3 /home/fjl2401/Safety-gen/spanner/spanner-generator.py 3 3 4 --seed 1745711757 --problem-name spanner-s3-n3-l4-s1745711757
(define (problem spanner-s3-n3-l4-s1745711757)
 (:domain spanner)
 (:objects 
     obj_13 - type_5
     obj_10 obj_09 obj_08 - type_1
     obj_06 obj_11 obj_01 - type_4
     obj_04 obj_12 obj_03 obj_07 - type_3
     obj_02 obj_05 - type_3
    )
 (:init 
    (pred_1 obj_13 obj_02)
    (pred_1 obj_10 obj_04)
    (pred_3 obj_10)
    (pred_1 obj_09 obj_07)
    (pred_3 obj_09)
    (pred_1 obj_08 obj_12)
    (pred_3 obj_08)
    (pred_4 obj_06)
    (pred_1 obj_06 obj_05)
    (pred_4 obj_11)
    (pred_1 obj_11 obj_05)
    (pred_4 obj_01)
    (pred_1 obj_01 obj_05)
    (pred_2 obj_02 obj_04)
    (pred_2 obj_07 obj_05)
    (pred_2 obj_04 obj_12)
    (pred_2 obj_12 obj_03)
    (pred_2 obj_03 obj_07)
)
 (:goal
  (and
   (pred_5 obj_06)
   (pred_5 obj_11)
   (pred_5 obj_01)
))
(:constraints
  (and
    (always (imply (not (pred_5 obj_06)) (not (pred_5 obj_11))))
    (forall (?m - type_5) (at-most-once (pred_1 ?m obj_02)))
  )
)
)
