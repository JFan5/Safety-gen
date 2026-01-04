; params: python3 /home/fjl2401/Safety-gen/spanner/spanner-generator.py 3 3 4 --seed 1503064868 --problem-name spanner-s3-n3-l4-s1503064868
(define (problem spanner-s3-n3-l4-s1503064868)
 (:domain spanner)
 (:objects 
     obj_09 - type_4
     obj_05 obj_11 obj_01 - type_1
     obj_12 obj_02 obj_03 - type_2
     obj_13 obj_08 obj_06 obj_07 - type_3
     obj_10 obj_04 - type_3
    )
 (:init 
    (pred_5 obj_09 obj_10)
    (pred_5 obj_05 obj_06)
    (pred_4 obj_05)
    (pred_5 obj_11 obj_06)
    (pred_4 obj_11)
    (pred_5 obj_01 obj_08)
    (pred_4 obj_01)
    (pred_6 obj_12)
    (pred_5 obj_12 obj_04)
    (pred_6 obj_02)
    (pred_5 obj_02 obj_04)
    (pred_6 obj_03)
    (pred_5 obj_03 obj_04)
    (pred_3 obj_10 obj_13)
    (pred_3 obj_07 obj_04)
    (pred_3 obj_13 obj_08)
    (pred_3 obj_08 obj_06)
    (pred_3 obj_06 obj_07)
)
 (:goal
  (and
   (pred_1 obj_12)
   (pred_1 obj_02)
   (pred_1 obj_03)
))
(:constraints
  (and
    (always (imply (not (pred_1 obj_02)) (not (pred_1 obj_03))))
    (forall (?m - type_4) (at-most-once (pred_5 ?m obj_10)))
  )
)
)
