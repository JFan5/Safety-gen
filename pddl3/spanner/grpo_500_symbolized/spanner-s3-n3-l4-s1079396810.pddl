; params: python3 /home/fjl2401/Safety-gen/spanner/spanner-generator.py 3 3 4 --seed 1079396810 --problem-name spanner-s3-n3-l4-s1079396810
(define (problem spanner-s3-n3-l4-s1079396810)
 (:domain spanner)
 (:objects 
     obj_08 - type_4
     obj_10 obj_04 obj_12 - type_5
     obj_09 obj_03 obj_07 - type_1
     obj_01 obj_02 obj_06 obj_13 - type_3
     obj_05 obj_11 - type_3
    )
 (:init 
    (pred_3 obj_08 obj_05)
    (pred_3 obj_10 obj_06)
    (pred_1 obj_10)
    (pred_3 obj_04 obj_06)
    (pred_1 obj_04)
    (pred_3 obj_12 obj_02)
    (pred_1 obj_12)
    (pred_5 obj_09)
    (pred_3 obj_09 obj_11)
    (pred_5 obj_03)
    (pred_3 obj_03 obj_11)
    (pred_5 obj_07)
    (pred_3 obj_07 obj_11)
    (pred_4 obj_05 obj_01)
    (pred_4 obj_13 obj_11)
    (pred_4 obj_01 obj_02)
    (pred_4 obj_02 obj_06)
    (pred_4 obj_06 obj_13)
)
 (:goal
  (and
   (pred_2 obj_09)
   (pred_2 obj_03)
   (pred_2 obj_07)
))
(:constraints
  (and
    (always (imply (not (pred_2 obj_03)) (not (pred_2 obj_07))))
    (forall (?m - type_4) (at-most-once (pred_3 ?m obj_05)))
  )
)
)
