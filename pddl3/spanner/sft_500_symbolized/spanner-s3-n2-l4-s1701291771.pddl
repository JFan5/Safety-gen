; params: python3 /home/fjl2401/Safety-gen/spanner/spanner-generator.py 3 2 4 --seed 1701291771 --problem-name spanner-s3-n2-l4-s1701291771
(define (problem spanner-s3-n2-l4-s1701291771)
 (:domain spanner)
 (:objects 
     obj_01 - type_1
     obj_10 obj_06 obj_07 - type_2
     obj_09 obj_12 - type_4
     obj_03 obj_11 obj_05 obj_02 - type_5
     obj_04 obj_08 - type_5
    )
 (:init 
    (pred_1 obj_01 obj_04)
    (pred_1 obj_10 obj_02)
    (pred_4 obj_10)
    (pred_1 obj_06 obj_11)
    (pred_4 obj_06)
    (pred_1 obj_07 obj_02)
    (pred_4 obj_07)
    (pred_2 obj_09)
    (pred_1 obj_09 obj_08)
    (pred_2 obj_12)
    (pred_1 obj_12 obj_08)
    (pred_6 obj_04 obj_03)
    (pred_6 obj_02 obj_08)
    (pred_6 obj_03 obj_11)
    (pred_6 obj_11 obj_05)
    (pred_6 obj_05 obj_02)
)
 (:goal
  (and
   (pred_5 obj_09)
   (pred_5 obj_12)
))
(:constraints
  (and
    (always (imply (not (pred_5 obj_09)) (not (pred_5 obj_12))))
    (forall (?m - type_1) (at-most-once (pred_1 ?m obj_04)))
  )
)
)
