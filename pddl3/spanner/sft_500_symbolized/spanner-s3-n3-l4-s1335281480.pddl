; params: python3 /home/fjl2401/Safety-gen/spanner/spanner-generator.py 3 3 4 --seed 1335281480 --problem-name spanner-s3-n3-l4-s1335281480
(define (problem spanner-s3-n3-l4-s1335281480)
 (:domain spanner)
 (:objects 
     obj_12 - type_3
     obj_10 obj_06 obj_09 - type_2
     obj_03 obj_01 obj_02 - type_1
     obj_13 obj_07 obj_04 obj_11 - type_5
     obj_05 obj_08 - type_5
    )
 (:init 
    (pred_3 obj_12 obj_05)
    (pred_3 obj_10 obj_07)
    (pred_1 obj_10)
    (pred_3 obj_06 obj_04)
    (pred_1 obj_06)
    (pred_3 obj_09 obj_04)
    (pred_1 obj_09)
    (pred_2 obj_03)
    (pred_3 obj_03 obj_08)
    (pred_2 obj_01)
    (pred_3 obj_01 obj_08)
    (pred_2 obj_02)
    (pred_3 obj_02 obj_08)
    (pred_6 obj_05 obj_13)
    (pred_6 obj_11 obj_08)
    (pred_6 obj_13 obj_07)
    (pred_6 obj_07 obj_04)
    (pred_6 obj_04 obj_11)
)
 (:goal
  (and
   (pred_5 obj_03)
   (pred_5 obj_01)
   (pred_5 obj_02)
))
(:constraints
  (and
    (always (imply (not (pred_5 obj_03)) (not (pred_5 obj_01))))
    (forall (?m - type_3) (at-most-once (pred_3 ?m obj_05)))
  )
)
)
