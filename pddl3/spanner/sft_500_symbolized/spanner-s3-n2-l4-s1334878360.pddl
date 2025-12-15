; params: python3 /home/fjl2401/Safety-gen/spanner/spanner-generator.py 3 2 4 --seed 1334878360 --problem-name spanner-s3-n2-l4-s1334878360
(define (problem spanner-s3-n2-l4-s1334878360)
 (:domain spanner)
 (:objects 
     obj_08 - type_5
     obj_05 obj_02 obj_11 - type_3
     obj_07 obj_12 - type_1
     obj_01 obj_10 obj_03 obj_04 - type_2
     obj_09 obj_06 - type_2
    )
 (:init 
    (pred_3 obj_08 obj_09)
    (pred_3 obj_05 obj_01)
    (pred_2 obj_05)
    (pred_3 obj_02 obj_01)
    (pred_2 obj_02)
    (pred_3 obj_11 obj_03)
    (pred_2 obj_11)
    (pred_6 obj_07)
    (pred_3 obj_07 obj_06)
    (pred_6 obj_12)
    (pred_3 obj_12 obj_06)
    (pred_4 obj_09 obj_01)
    (pred_4 obj_04 obj_06)
    (pred_4 obj_01 obj_10)
    (pred_4 obj_10 obj_03)
    (pred_4 obj_03 obj_04)
)
 (:goal
  (and
   (pred_5 obj_07)
   (pred_5 obj_12)
))
(:constraints
  (and
    (always (imply (not (pred_5 obj_07)) (not (pred_5 obj_12))))
    (forall (?m - type_5) (at-most-once (pred_3 ?m obj_09)))
  )
)
)
