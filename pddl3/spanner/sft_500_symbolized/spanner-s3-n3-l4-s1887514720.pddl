; params: python3 /home/fjl2401/Safety-gen/spanner/spanner-generator.py 3 3 4 --seed 1887514720 --problem-name spanner-s3-n3-l4-s1887514720
(define (problem spanner-s3-n3-l4-s1887514720)
 (:domain spanner)
 (:objects 
     obj_10 - type_5
     obj_01 obj_03 obj_06 - type_4
     obj_09 obj_08 obj_07 - type_1
     obj_04 obj_02 obj_11 obj_13 - type_3
     obj_12 obj_05 - type_3
    )
 (:init 
    (pred_6 obj_10 obj_12)
    (pred_6 obj_01 obj_04)
    (pred_3 obj_01)
    (pred_6 obj_03 obj_02)
    (pred_3 obj_03)
    (pred_6 obj_06 obj_04)
    (pred_3 obj_06)
    (pred_1 obj_09)
    (pred_6 obj_09 obj_05)
    (pred_1 obj_08)
    (pred_6 obj_08 obj_05)
    (pred_1 obj_07)
    (pred_6 obj_07 obj_05)
    (pred_4 obj_12 obj_04)
    (pred_4 obj_13 obj_05)
    (pred_4 obj_04 obj_02)
    (pred_4 obj_02 obj_11)
    (pred_4 obj_11 obj_13)
)
 (:goal
  (and
   (pred_5 obj_09)
   (pred_5 obj_08)
   (pred_5 obj_07)
))
(:constraints
  (and
    (always (imply (not (pred_5 obj_09)) (not (pred_5 obj_08))))
    (forall (?m - type_5) (at-most-once (pred_6 ?m obj_12)))
  )
)
)
