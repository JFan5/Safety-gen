; params: python3 /home/fjl2401/Safety-gen/spanner/spanner-generator.py 3 3 4 --seed 2063701977 --problem-name spanner-s3-n3-l4-s2063701977
(define (problem spanner-s3-n3-l4-s2063701977)
 (:domain spanner)
 (:objects 
     obj_13 - type_2
     obj_12 obj_10 obj_05 - type_3
     obj_06 obj_11 obj_01 - type_1
     obj_08 obj_07 obj_02 obj_04 - type_4
     obj_09 obj_03 - type_4
    )
 (:init 
    (pred_3 obj_13 obj_09)
    (pred_3 obj_12 obj_02)
    (pred_4 obj_12)
    (pred_3 obj_10 obj_08)
    (pred_4 obj_10)
    (pred_3 obj_05 obj_08)
    (pred_4 obj_05)
    (pred_6 obj_06)
    (pred_3 obj_06 obj_03)
    (pred_6 obj_11)
    (pred_3 obj_11 obj_03)
    (pred_6 obj_01)
    (pred_3 obj_01 obj_03)
    (pred_2 obj_09 obj_08)
    (pred_2 obj_04 obj_03)
    (pred_2 obj_08 obj_07)
    (pred_2 obj_07 obj_02)
    (pred_2 obj_02 obj_04)
)
 (:goal
  (and
   (pred_1 obj_06)
   (pred_1 obj_11)
   (pred_1 obj_01)
))
(:constraints
  (and
    (always (imply (not (pred_1 obj_11)) (not (pred_1 obj_01))))
    (forall (?m - type_2) (at-most-once (pred_3 ?m obj_09)))
  )
)
)
