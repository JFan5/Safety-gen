; params: python3 /home/fjl2401/Safety-gen/spanner/spanner-generator.py 3 3 4 --seed 1079396810 --problem-name spanner-s3-n3-l4-s1079396810
(define (problem spanner-s3-n3-l4-s1079396810)
 (:domain spanner)
 (:objects 
     obj_02 - type_2
     obj_06 obj_10 obj_01 - type_4
     obj_08 obj_03 obj_13 - type_1
     obj_05 obj_04 obj_09 obj_07 - type_5
     obj_11 obj_12 - type_5
    )
 (:init 
    (pred_4 obj_02 obj_11)
    (pred_4 obj_06 obj_09)
    (pred_2 obj_06)
    (pred_4 obj_10 obj_09)
    (pred_2 obj_10)
    (pred_4 obj_01 obj_04)
    (pred_2 obj_01)
    (pred_6 obj_08)
    (pred_4 obj_08 obj_12)
    (pred_6 obj_03)
    (pred_4 obj_03 obj_12)
    (pred_6 obj_13)
    (pred_4 obj_13 obj_12)
    (pred_3 obj_11 obj_05)
    (pred_3 obj_07 obj_12)
    (pred_3 obj_05 obj_04)
    (pred_3 obj_04 obj_09)
    (pred_3 obj_09 obj_07)
)
 (:goal
  (and
   (pred_5 obj_08)
   (pred_5 obj_03)
   (pred_5 obj_13)
))
(:constraints
  (and
    (always (imply (not (pred_5 obj_03)) (not (pred_5 obj_13))))
    (forall (?m - type_2) (at-most-once (pred_4 ?m obj_11)))
  )
)
)
