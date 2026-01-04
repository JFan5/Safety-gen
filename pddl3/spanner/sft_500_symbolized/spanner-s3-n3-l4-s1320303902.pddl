; params: python3 /home/fjl2401/Safety-gen/spanner/spanner-generator.py 3 3 4 --seed 1320303902 --problem-name spanner-s3-n3-l4-s1320303902
(define (problem spanner-s3-n3-l4-s1320303902)
 (:domain spanner)
 (:objects 
     obj_09 - type_5
     obj_03 obj_08 obj_10 - type_1
     obj_04 obj_02 obj_05 - type_4
     obj_11 obj_07 obj_01 obj_13 - type_3
     obj_12 obj_06 - type_3
    )
 (:init 
    (pred_4 obj_09 obj_12)
    (pred_4 obj_03 obj_07)
    (pred_2 obj_03)
    (pred_4 obj_08 obj_07)
    (pred_2 obj_08)
    (pred_4 obj_10 obj_07)
    (pred_2 obj_10)
    (pred_6 obj_04)
    (pred_4 obj_04 obj_06)
    (pred_6 obj_02)
    (pred_4 obj_02 obj_06)
    (pred_6 obj_05)
    (pred_4 obj_05 obj_06)
    (pred_3 obj_12 obj_11)
    (pred_3 obj_13 obj_06)
    (pred_3 obj_11 obj_07)
    (pred_3 obj_07 obj_01)
    (pred_3 obj_01 obj_13)
)
 (:goal
  (and
   (pred_5 obj_04)
   (pred_5 obj_02)
   (pred_5 obj_05)
))
(:constraints
  (and
    (always (imply (not (pred_5 obj_04)) (not (pred_5 obj_02))))
    (forall (?m - type_5) (at-most-once (pred_4 ?m obj_12)))
  )
)
)
