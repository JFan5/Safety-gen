; params: python3 /home/fjl2401/Safety-gen/spanner/spanner-generator.py 3 2 4 --seed 1634724665 --problem-name spanner-s3-n2-l4-s1634724665
(define (problem spanner-s3-n2-l4-s1634724665)
 (:domain spanner)
 (:objects 
     obj_11 - type_5
     obj_03 obj_10 obj_07 - type_3
     obj_09 obj_08 - type_1
     obj_01 obj_06 obj_05 obj_12 - type_2
     obj_02 obj_04 - type_2
    )
 (:init 
    (pred_6 obj_11 obj_02)
    (pred_6 obj_03 obj_12)
    (pred_5 obj_03)
    (pred_6 obj_10 obj_06)
    (pred_5 obj_10)
    (pred_6 obj_07 obj_01)
    (pred_5 obj_07)
    (pred_4 obj_09)
    (pred_6 obj_09 obj_04)
    (pred_4 obj_08)
    (pred_6 obj_08 obj_04)
    (pred_3 obj_02 obj_01)
    (pred_3 obj_12 obj_04)
    (pred_3 obj_01 obj_06)
    (pred_3 obj_06 obj_05)
    (pred_3 obj_05 obj_12)
)
 (:goal
  (and
   (pred_1 obj_09)
   (pred_1 obj_08)
))
(:constraints
  (and
    (always (imply (not (pred_1 obj_09)) (not (pred_1 obj_08))))
    (forall (?m - type_5) (at-most-once (pred_6 ?m obj_02)))
  )
)
)
