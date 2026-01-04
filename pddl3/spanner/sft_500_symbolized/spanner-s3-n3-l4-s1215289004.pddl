; params: python3 /home/fjl2401/Safety-gen/spanner/spanner-generator.py 3 3 4 --seed 1215289004 --problem-name spanner-s3-n3-l4-s1215289004
(define (problem spanner-s3-n3-l4-s1215289004)
 (:domain spanner)
 (:objects 
     obj_07 - type_3
     obj_01 obj_05 obj_04 - type_5
     obj_02 obj_10 obj_03 - type_2
     obj_09 obj_08 obj_12 obj_11 - type_1
     obj_06 obj_13 - type_1
    )
 (:init 
    (pred_6 obj_07 obj_06)
    (pred_6 obj_01 obj_12)
    (pred_5 obj_01)
    (pred_6 obj_05 obj_08)
    (pred_5 obj_05)
    (pred_6 obj_04 obj_09)
    (pred_5 obj_04)
    (pred_2 obj_02)
    (pred_6 obj_02 obj_13)
    (pred_2 obj_10)
    (pred_6 obj_10 obj_13)
    (pred_2 obj_03)
    (pred_6 obj_03 obj_13)
    (pred_1 obj_06 obj_09)
    (pred_1 obj_11 obj_13)
    (pred_1 obj_09 obj_08)
    (pred_1 obj_08 obj_12)
    (pred_1 obj_12 obj_11)
)
 (:goal
  (and
   (pred_4 obj_02)
   (pred_4 obj_10)
   (pred_4 obj_03)
))
(:constraints
  (and
    (always (imply (not (pred_4 obj_10)) (not (pred_4 obj_03))))
    (forall (?m - type_3) (at-most-once (pred_6 ?m obj_06)))
  )
)
)
