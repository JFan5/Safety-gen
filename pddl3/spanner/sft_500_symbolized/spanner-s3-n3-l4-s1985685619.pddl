; params: python3 /home/fjl2401/Safety-gen/spanner/spanner-generator.py 3 3 4 --seed 1985685619 --problem-name spanner-s3-n3-l4-s1985685619
(define (problem spanner-s3-n3-l4-s1985685619)
 (:domain spanner)
 (:objects 
     obj_02 - type_2
     obj_10 obj_03 obj_08 - type_1
     obj_13 obj_07 obj_09 - type_4
     obj_05 obj_06 obj_11 obj_01 - type_5
     obj_04 obj_12 - type_5
    )
 (:init 
    (pred_2 obj_02 obj_04)
    (pred_2 obj_10 obj_06)
    (pred_6 obj_10)
    (pred_2 obj_03 obj_11)
    (pred_6 obj_03)
    (pred_2 obj_08 obj_11)
    (pred_6 obj_08)
    (pred_4 obj_13)
    (pred_2 obj_13 obj_12)
    (pred_4 obj_07)
    (pred_2 obj_07 obj_12)
    (pred_4 obj_09)
    (pred_2 obj_09 obj_12)
    (pred_1 obj_04 obj_05)
    (pred_1 obj_01 obj_12)
    (pred_1 obj_05 obj_06)
    (pred_1 obj_06 obj_11)
    (pred_1 obj_11 obj_01)
)
 (:goal
  (and
   (pred_3 obj_13)
   (pred_3 obj_07)
   (pred_3 obj_09)
))
(:constraints
  (and
    (always (imply (not (pred_3 obj_13)) (not (pred_3 obj_07))))
    (forall (?m - type_2) (at-most-once (pred_2 ?m obj_04)))
  )
)
)
