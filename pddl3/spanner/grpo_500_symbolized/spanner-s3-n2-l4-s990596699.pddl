; params: python3 /home/fjl2401/Safety-gen/spanner/spanner-generator.py 3 2 4 --seed 990596699 --problem-name spanner-s3-n2-l4-s990596699
(define (problem spanner-s3-n2-l4-s990596699)
 (:domain spanner)
 (:objects 
     obj_01 - type_4
     obj_06 obj_11 obj_04 - type_5
     obj_09 obj_03 - type_1
     obj_12 obj_02 obj_08 obj_05 - type_3
     obj_07 obj_10 - type_3
    )
 (:init 
    (pred_3 obj_01 obj_07)
    (pred_3 obj_06 obj_08)
    (pred_1 obj_06)
    (pred_3 obj_11 obj_02)
    (pred_1 obj_11)
    (pred_3 obj_04 obj_08)
    (pred_1 obj_04)
    (pred_5 obj_09)
    (pred_3 obj_09 obj_10)
    (pred_5 obj_03)
    (pred_3 obj_03 obj_10)
    (pred_4 obj_07 obj_12)
    (pred_4 obj_05 obj_10)
    (pred_4 obj_12 obj_02)
    (pred_4 obj_02 obj_08)
    (pred_4 obj_08 obj_05)
)
 (:goal
  (and
   (pred_2 obj_09)
   (pred_2 obj_03)
))
(:constraints
  (and
    (always (imply (not (pred_2 obj_09)) (not (pred_2 obj_03))))
    (forall (?m - type_4) (at-most-once (pred_3 ?m obj_07)))
  )
)
)
