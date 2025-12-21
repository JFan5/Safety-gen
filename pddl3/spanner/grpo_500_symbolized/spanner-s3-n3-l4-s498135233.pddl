; params: python3 /home/fjl2401/Safety-gen/spanner/spanner-generator.py 3 3 4 --seed 498135233 --problem-name spanner-s3-n3-l4-s498135233
(define (problem spanner-s3-n3-l4-s498135233)
 (:domain spanner)
 (:objects 
     obj_12 - type_5
     obj_06 obj_01 obj_07 - type_3
     obj_13 obj_09 obj_03 - type_1
     obj_05 obj_10 obj_02 obj_04 - type_2
     obj_08 obj_11 - type_2
    )
 (:init 
    (pred_6 obj_12 obj_08)
    (pred_6 obj_06 obj_02)
    (pred_5 obj_06)
    (pred_6 obj_01 obj_10)
    (pred_5 obj_01)
    (pred_6 obj_07 obj_05)
    (pred_5 obj_07)
    (pred_4 obj_13)
    (pred_6 obj_13 obj_11)
    (pred_4 obj_09)
    (pred_6 obj_09 obj_11)
    (pred_4 obj_03)
    (pred_6 obj_03 obj_11)
    (pred_3 obj_08 obj_05)
    (pred_3 obj_04 obj_11)
    (pred_3 obj_05 obj_10)
    (pred_3 obj_10 obj_02)
    (pred_3 obj_02 obj_04)
)
 (:goal
  (and
   (pred_1 obj_13)
   (pred_1 obj_09)
   (pred_1 obj_03)
))
(:constraints
  (and
    (always (imply (not (pred_1 obj_09)) (not (pred_1 obj_03))))
    (forall (?m - type_5) (at-most-once (pred_6 ?m obj_08)))
  )
)
)
