; params: python3 /home/fjl2401/Safety-gen/spanner/spanner-generator.py 3 3 4 --seed 1578189630 --problem-name spanner-s3-n3-l4-s1578189630
(define (problem spanner-s3-n3-l4-s1578189630)
 (:domain spanner)
 (:objects 
     obj_07 - type_1
     obj_10 obj_04 obj_11 - type_2
     obj_03 obj_01 obj_02 - type_3
     obj_06 obj_13 obj_08 obj_05 - type_5
     obj_12 obj_09 - type_5
    )
 (:init 
    (pred_4 obj_07 obj_12)
    (pred_4 obj_10 obj_08)
    (pred_2 obj_10)
    (pred_4 obj_04 obj_06)
    (pred_2 obj_04)
    (pred_4 obj_11 obj_08)
    (pred_2 obj_11)
    (pred_1 obj_03)
    (pred_4 obj_03 obj_09)
    (pred_1 obj_01)
    (pred_4 obj_01 obj_09)
    (pred_1 obj_02)
    (pred_4 obj_02 obj_09)
    (pred_3 obj_12 obj_06)
    (pred_3 obj_05 obj_09)
    (pred_3 obj_06 obj_13)
    (pred_3 obj_13 obj_08)
    (pred_3 obj_08 obj_05)
)
 (:goal
  (and
   (pred_5 obj_03)
   (pred_5 obj_01)
   (pred_5 obj_02)
))
(:constraints
  (and
    (always (imply (not (pred_5 obj_01)) (not (pred_5 obj_02))))
    (forall (?m - type_1) (at-most-once (pred_4 ?m obj_12)))
  )
)
)
