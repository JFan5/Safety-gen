; params: python3 /home/fjl2401/Safety-gen/spanner/spanner-generator.py 3 2 4 --seed 1334878360 --problem-name spanner-s3-n2-l4-s1334878360
(define (problem spanner-s3-n2-l4-s1334878360)
 (:domain spanner)
 (:objects 
     obj_04 - type_5
     obj_02 obj_07 obj_01 - type_2
     obj_09 obj_03 - type_1
     obj_05 obj_08 obj_11 obj_06 - type_3
     obj_10 obj_12 - type_3
    )
 (:init 
    (pred_3 obj_04 obj_10)
    (pred_3 obj_02 obj_05)
    (pred_4 obj_02)
    (pred_3 obj_07 obj_05)
    (pred_4 obj_07)
    (pred_3 obj_01 obj_11)
    (pred_4 obj_01)
    (pred_2 obj_09)
    (pred_3 obj_09 obj_12)
    (pred_2 obj_03)
    (pred_3 obj_03 obj_12)
    (pred_1 obj_10 obj_05)
    (pred_1 obj_06 obj_12)
    (pred_1 obj_05 obj_08)
    (pred_1 obj_08 obj_11)
    (pred_1 obj_11 obj_06)
)
 (:goal
  (and
   (pred_5 obj_09)
   (pred_5 obj_03)
))
(:constraints
  (and
    (always (imply (not (pred_5 obj_09)) (not (pred_5 obj_03))))
    (forall (?m - type_5) (at-most-once (pred_3 ?m obj_10)))
  )
)
)
