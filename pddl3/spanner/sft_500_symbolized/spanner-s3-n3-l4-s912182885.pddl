; params: python3 /home/fjl2401/Safety-gen/spanner/spanner-generator.py 3 3 4 --seed 912182885 --problem-name spanner-s3-n3-l4-s912182885
(define (problem spanner-s3-n3-l4-s912182885)
 (:domain spanner)
 (:objects 
     obj_13 - type_2
     obj_09 obj_07 obj_11 - type_1
     obj_03 obj_10 obj_05 - type_3
     obj_08 obj_02 obj_01 obj_06 - type_5
     obj_04 obj_12 - type_5
    )
 (:init 
    (pred_2 obj_13 obj_04)
    (pred_2 obj_09 obj_02)
    (pred_1 obj_09)
    (pred_2 obj_07 obj_02)
    (pred_1 obj_07)
    (pred_2 obj_11 obj_02)
    (pred_1 obj_11)
    (pred_5 obj_03)
    (pred_2 obj_03 obj_12)
    (pred_5 obj_10)
    (pred_2 obj_10 obj_12)
    (pred_5 obj_05)
    (pred_2 obj_05 obj_12)
    (pred_4 obj_04 obj_08)
    (pred_4 obj_06 obj_12)
    (pred_4 obj_08 obj_02)
    (pred_4 obj_02 obj_01)
    (pred_4 obj_01 obj_06)
)
 (:goal
  (and
   (pred_6 obj_03)
   (pred_6 obj_10)
   (pred_6 obj_05)
))
(:constraints
  (and
    (always (imply (not (pred_6 obj_03)) (not (pred_6 obj_10))))
    (forall (?m - type_2) (at-most-once (pred_2 ?m obj_04)))
  )
)
)
