; params: python3 /home/fjl2401/Safety-gen/spanner/spanner-generator.py 3 3 4 --seed 1079396810 --problem-name spanner-s3-n3-l4-s1079396810
(define (problem spanner-s3-n3-l4-s1079396810)
 (:domain spanner)
 (:objects 
     obj_06 - type_5
     obj_03 obj_08 obj_02 - type_3
     obj_01 obj_10 obj_12 - type_4
     obj_04 obj_09 obj_07 obj_13 - type_1
     obj_11 obj_05 - type_1
    )
 (:init 
    (pred_4 obj_06 obj_11)
    (pred_4 obj_03 obj_07)
    (pred_5 obj_03)
    (pred_4 obj_08 obj_07)
    (pred_5 obj_08)
    (pred_4 obj_02 obj_09)
    (pred_5 obj_02)
    (pred_1 obj_01)
    (pred_4 obj_01 obj_05)
    (pred_1 obj_10)
    (pred_4 obj_10 obj_05)
    (pred_1 obj_12)
    (pred_4 obj_12 obj_05)
    (pred_6 obj_11 obj_04)
    (pred_6 obj_13 obj_05)
    (pred_6 obj_04 obj_09)
    (pred_6 obj_09 obj_07)
    (pred_6 obj_07 obj_13)
)
 (:goal
  (and
   (pred_3 obj_01)
   (pred_3 obj_10)
   (pred_3 obj_12)
))
(:constraints
  (and
    (always (imply (not (pred_3 obj_10)) (not (pred_3 obj_12))))
    (forall (?m - type_5) (at-most-once (pred_4 ?m obj_11)))
  )
)
)
