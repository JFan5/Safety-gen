; params: python3 /home/fjl2401/Safety-gen/spanner/spanner-generator.py 3 3 4 --seed 1503064868 --problem-name spanner-s3-n3-l4-s1503064868
(define (problem spanner-s3-n3-l4-s1503064868)
 (:domain spanner)
 (:objects 
     obj_06 - type_3
     obj_13 obj_05 obj_02 - type_4
     obj_11 obj_09 obj_10 - type_2
     obj_03 obj_01 obj_07 obj_12 - type_1
     obj_08 obj_04 - type_1
    )
 (:init 
    (pred_6 obj_06 obj_08)
    (pred_6 obj_13 obj_07)
    (pred_2 obj_13)
    (pred_6 obj_05 obj_07)
    (pred_2 obj_05)
    (pred_6 obj_02 obj_01)
    (pred_2 obj_02)
    (pred_3 obj_11)
    (pred_6 obj_11 obj_04)
    (pred_3 obj_09)
    (pred_6 obj_09 obj_04)
    (pred_3 obj_10)
    (pred_6 obj_10 obj_04)
    (pred_5 obj_08 obj_03)
    (pred_5 obj_12 obj_04)
    (pred_5 obj_03 obj_01)
    (pred_5 obj_01 obj_07)
    (pred_5 obj_07 obj_12)
)
 (:goal
  (and
   (pred_4 obj_11)
   (pred_4 obj_09)
   (pred_4 obj_10)
))
(:constraints
  (and
    (always (imply (not (pred_4 obj_09)) (not (pred_4 obj_10))))
    (forall (?m - type_3) (at-most-once (pred_6 ?m obj_08)))
  )
)
)
