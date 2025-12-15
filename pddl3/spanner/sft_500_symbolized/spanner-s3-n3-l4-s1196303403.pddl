; params: python3 /home/fjl2401/Safety-gen/spanner/spanner-generator.py 3 3 4 --seed 1196303403 --problem-name spanner-s3-n3-l4-s1196303403
(define (problem spanner-s3-n3-l4-s1196303403)
 (:domain spanner)
 (:objects 
     obj_02 - type_2
     obj_11 obj_13 obj_10 - type_3
     obj_03 obj_01 obj_04 - type_4
     obj_08 obj_09 obj_06 obj_05 - type_5
     obj_12 obj_07 - type_5
    )
 (:init 
    (pred_1 obj_02 obj_12)
    (pred_1 obj_11 obj_06)
    (pred_5 obj_11)
    (pred_1 obj_13 obj_05)
    (pred_5 obj_13)
    (pred_1 obj_10 obj_08)
    (pred_5 obj_10)
    (pred_6 obj_03)
    (pred_1 obj_03 obj_07)
    (pred_6 obj_01)
    (pred_1 obj_01 obj_07)
    (pred_6 obj_04)
    (pred_1 obj_04 obj_07)
    (pred_2 obj_12 obj_08)
    (pred_2 obj_05 obj_07)
    (pred_2 obj_08 obj_09)
    (pred_2 obj_09 obj_06)
    (pred_2 obj_06 obj_05)
)
 (:goal
  (and
   (pred_4 obj_03)
   (pred_4 obj_01)
   (pred_4 obj_04)
))
(:constraints
  (and
    (always (imply (not (pred_4 obj_01)) (not (pred_4 obj_04))))
    (forall (?m - type_2) (at-most-once (pred_1 ?m obj_12)))
  )
)
)
