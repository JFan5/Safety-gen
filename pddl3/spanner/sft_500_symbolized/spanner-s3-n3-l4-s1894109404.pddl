; params: python3 /home/fjl2401/Safety-gen/spanner/spanner-generator.py 3 3 4 --seed 1894109404 --problem-name spanner-s3-n3-l4-s1894109404
(define (problem spanner-s3-n3-l4-s1894109404)
 (:domain spanner)
 (:objects 
     obj_07 - type_2
     obj_03 obj_12 obj_06 - type_4
     obj_04 obj_08 obj_09 - type_5
     obj_13 obj_01 obj_10 obj_02 - type_1
     obj_05 obj_11 - type_1
    )
 (:init 
    (pred_5 obj_07 obj_05)
    (pred_5 obj_03 obj_10)
    (pred_3 obj_03)
    (pred_5 obj_12 obj_13)
    (pred_3 obj_12)
    (pred_5 obj_06 obj_01)
    (pred_3 obj_06)
    (pred_4 obj_04)
    (pred_5 obj_04 obj_11)
    (pred_4 obj_08)
    (pred_5 obj_08 obj_11)
    (pred_4 obj_09)
    (pred_5 obj_09 obj_11)
    (pred_1 obj_05 obj_13)
    (pred_1 obj_02 obj_11)
    (pred_1 obj_13 obj_01)
    (pred_1 obj_01 obj_10)
    (pred_1 obj_10 obj_02)
)
 (:goal
  (and
   (pred_6 obj_04)
   (pred_6 obj_08)
   (pred_6 obj_09)
))
(:constraints
  (and
    (always (imply (not (pred_6 obj_08)) (not (pred_6 obj_09))))
    (forall (?m - type_2) (at-most-once (pred_5 ?m obj_05)))
  )
)
)
