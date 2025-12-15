; params: python3 /home/fjl2401/Safety-gen/spanner/spanner-generator.py 3 3 4 --seed 1814927909 --problem-name spanner-s3-n3-l4-s1814927909
(define (problem spanner-s3-n3-l4-s1814927909)
 (:domain spanner)
 (:objects 
     obj_11 - type_2
     obj_03 obj_10 obj_01 - type_3
     obj_04 obj_06 obj_12 - type_5
     obj_09 obj_13 obj_02 obj_05 - type_4
     obj_07 obj_08 - type_4
    )
 (:init 
    (pred_1 obj_11 obj_07)
    (pred_1 obj_03 obj_02)
    (pred_4 obj_03)
    (pred_1 obj_10 obj_13)
    (pred_4 obj_10)
    (pred_1 obj_01 obj_09)
    (pred_4 obj_01)
    (pred_3 obj_04)
    (pred_1 obj_04 obj_08)
    (pred_3 obj_06)
    (pred_1 obj_06 obj_08)
    (pred_3 obj_12)
    (pred_1 obj_12 obj_08)
    (pred_6 obj_07 obj_09)
    (pred_6 obj_05 obj_08)
    (pred_6 obj_09 obj_13)
    (pred_6 obj_13 obj_02)
    (pred_6 obj_02 obj_05)
)
 (:goal
  (and
   (pred_5 obj_04)
   (pred_5 obj_06)
   (pred_5 obj_12)
))
(:constraints
  (and
    (always (imply (not (pred_5 obj_06)) (not (pred_5 obj_12))))
    (forall (?m - type_2) (at-most-once (pred_1 ?m obj_07)))
  )
)
)
