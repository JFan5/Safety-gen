; params: python3 /home/fjl2401/Safety-gen/spanner/spanner-generator.py 3 3 4 --seed 1044496791 --problem-name spanner-s3-n3-l4-s1044496791
(define (problem spanner-s3-n3-l4-s1044496791)
 (:domain spanner)
 (:objects 
     obj_03 - type_4
     obj_05 obj_11 obj_12 - type_1
     obj_08 obj_04 obj_01 - type_5
     obj_06 obj_07 obj_13 obj_02 - type_2
     obj_09 obj_10 - type_2
    )
 (:init 
    (pred_1 obj_03 obj_09)
    (pred_1 obj_05 obj_07)
    (pred_5 obj_05)
    (pred_1 obj_11 obj_02)
    (pred_5 obj_11)
    (pred_1 obj_12 obj_06)
    (pred_5 obj_12)
    (pred_4 obj_08)
    (pred_1 obj_08 obj_10)
    (pred_4 obj_04)
    (pred_1 obj_04 obj_10)
    (pred_4 obj_01)
    (pred_1 obj_01 obj_10)
    (pred_2 obj_09 obj_06)
    (pred_2 obj_02 obj_10)
    (pred_2 obj_06 obj_07)
    (pred_2 obj_07 obj_13)
    (pred_2 obj_13 obj_02)
)
 (:goal
  (and
   (pred_6 obj_08)
   (pred_6 obj_04)
   (pred_6 obj_01)
))
(:constraints
  (and
    (always (imply (not (pred_6 obj_08)) (not (pred_6 obj_04))))
    (forall (?m - type_4) (at-most-once (pred_1 ?m obj_09)))
  )
)
)
