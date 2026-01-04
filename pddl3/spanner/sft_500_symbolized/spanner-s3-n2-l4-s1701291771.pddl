; params: python3 /home/fjl2401/Safety-gen/spanner/spanner-generator.py 3 2 4 --seed 1701291771 --problem-name spanner-s3-n2-l4-s1701291771
(define (problem spanner-s3-n2-l4-s1701291771)
 (:domain spanner)
 (:objects 
     obj_11 - type_2
     obj_09 obj_12 obj_05 - type_3
     obj_01 obj_02 - type_1
     obj_03 obj_04 obj_08 obj_06 - type_4
     obj_10 obj_07 - type_4
    )
 (:init 
    (pred_4 obj_11 obj_10)
    (pred_4 obj_09 obj_06)
    (pred_5 obj_09)
    (pred_4 obj_12 obj_04)
    (pred_5 obj_12)
    (pred_4 obj_05 obj_06)
    (pred_5 obj_05)
    (pred_6 obj_01)
    (pred_4 obj_01 obj_07)
    (pred_6 obj_02)
    (pred_4 obj_02 obj_07)
    (pred_3 obj_10 obj_03)
    (pred_3 obj_06 obj_07)
    (pred_3 obj_03 obj_04)
    (pred_3 obj_04 obj_08)
    (pred_3 obj_08 obj_06)
)
 (:goal
  (and
   (pred_2 obj_01)
   (pred_2 obj_02)
))
(:constraints
  (and
    (always (imply (not (pred_2 obj_01)) (not (pred_2 obj_02))))
    (forall (?m - type_2) (at-most-once (pred_4 ?m obj_10)))
  )
)
)
