; params: python3 /home/fjl2401/Safety-gen/spanner/spanner-generator.py 3 2 4 --seed 1931651293 --problem-name spanner-s3-n2-l4-s1931651293
(define (problem spanner-s3-n2-l4-s1931651293)
 (:domain spanner)
 (:objects 
     obj_05 - type_2
     obj_08 obj_07 obj_09 - type_4
     obj_11 obj_03 - type_5
     obj_02 obj_06 obj_04 obj_01 - type_3
     obj_10 obj_12 - type_3
    )
 (:init 
    (pred_5 obj_05 obj_10)
    (pred_5 obj_08 obj_06)
    (pred_3 obj_08)
    (pred_5 obj_07 obj_04)
    (pred_3 obj_07)
    (pred_5 obj_09 obj_06)
    (pred_3 obj_09)
    (pred_1 obj_11)
    (pred_5 obj_11 obj_12)
    (pred_1 obj_03)
    (pred_5 obj_03 obj_12)
    (pred_4 obj_10 obj_02)
    (pred_4 obj_01 obj_12)
    (pred_4 obj_02 obj_06)
    (pred_4 obj_06 obj_04)
    (pred_4 obj_04 obj_01)
)
 (:goal
  (and
   (pred_6 obj_11)
   (pred_6 obj_03)
))
(:constraints
  (and
    (always (imply (not (pred_6 obj_11)) (not (pred_6 obj_03))))
    (forall (?m - type_2) (at-most-once (pred_5 ?m obj_10)))
  )
)
)
