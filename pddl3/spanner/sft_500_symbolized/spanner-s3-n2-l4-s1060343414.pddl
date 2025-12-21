; params: python3 /home/fjl2401/Safety-gen/spanner/spanner-generator.py 3 2 4 --seed 1060343414 --problem-name spanner-s3-n2-l4-s1060343414
(define (problem spanner-s3-n2-l4-s1060343414)
 (:domain spanner)
 (:objects 
     obj_02 - type_3
     obj_10 obj_01 obj_08 - type_5
     obj_06 obj_04 - type_4
     obj_03 obj_05 obj_11 obj_07 - type_2
     obj_09 obj_12 - type_2
    )
 (:init 
    (pred_2 obj_02 obj_09)
    (pred_2 obj_10 obj_03)
    (pred_1 obj_10)
    (pred_2 obj_01 obj_11)
    (pred_1 obj_01)
    (pred_2 obj_08 obj_11)
    (pred_1 obj_08)
    (pred_5 obj_06)
    (pred_2 obj_06 obj_12)
    (pred_5 obj_04)
    (pred_2 obj_04 obj_12)
    (pred_6 obj_09 obj_03)
    (pred_6 obj_07 obj_12)
    (pred_6 obj_03 obj_05)
    (pred_6 obj_05 obj_11)
    (pred_6 obj_11 obj_07)
)
 (:goal
  (and
   (pred_3 obj_06)
   (pred_3 obj_04)
))
(:constraints
  (and
    (always (imply (not (pred_3 obj_06)) (not (pred_3 obj_04))))
    (forall (?m - type_3) (at-most-once (pred_2 ?m obj_09)))
  )
)
)
