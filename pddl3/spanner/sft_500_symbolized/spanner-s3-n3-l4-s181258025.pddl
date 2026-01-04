; params: python3 /home/fjl2401/Safety-gen/spanner/spanner-generator.py 3 3 4 --seed 181258025 --problem-name spanner-s3-n3-l4-s181258025
(define (problem spanner-s3-n3-l4-s181258025)
 (:domain spanner)
 (:objects 
     obj_05 - type_1
     obj_12 obj_03 obj_06 - type_3
     obj_08 obj_09 obj_13 - type_5
     obj_11 obj_01 obj_02 obj_10 - type_4
     obj_07 obj_04 - type_4
    )
 (:init 
    (pred_3 obj_05 obj_07)
    (pred_3 obj_12 obj_01)
    (pred_5 obj_12)
    (pred_3 obj_03 obj_01)
    (pred_5 obj_03)
    (pred_3 obj_06 obj_01)
    (pred_5 obj_06)
    (pred_2 obj_08)
    (pred_3 obj_08 obj_04)
    (pred_2 obj_09)
    (pred_3 obj_09 obj_04)
    (pred_2 obj_13)
    (pred_3 obj_13 obj_04)
    (pred_6 obj_07 obj_11)
    (pred_6 obj_10 obj_04)
    (pred_6 obj_11 obj_01)
    (pred_6 obj_01 obj_02)
    (pred_6 obj_02 obj_10)
)
 (:goal
  (and
   (pred_4 obj_08)
   (pred_4 obj_09)
   (pred_4 obj_13)
))
(:constraints
  (and
    (always (imply (not (pred_4 obj_08)) (not (pred_4 obj_09))))
    (forall (?m - type_1) (at-most-once (pred_3 ?m obj_07)))
  )
)
)
