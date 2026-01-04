; params: python3 /home/fjl2401/Safety-gen/spanner/spanner-generator.py 3 2 4 --seed 921997770 --problem-name spanner-s3-n2-l4-s921997770
(define (problem spanner-s3-n2-l4-s921997770)
 (:domain spanner)
 (:objects 
     obj_04 - type_2
     obj_06 obj_09 obj_12 - type_5
     obj_10 obj_08 - type_3
     obj_03 obj_01 obj_05 obj_07 - type_4
     obj_11 obj_02 - type_4
    )
 (:init 
    (pred_1 obj_04 obj_11)
    (pred_1 obj_06 obj_07)
    (pred_5 obj_06)
    (pred_1 obj_09 obj_07)
    (pred_5 obj_09)
    (pred_1 obj_12 obj_05)
    (pred_5 obj_12)
    (pred_4 obj_10)
    (pred_1 obj_10 obj_02)
    (pred_4 obj_08)
    (pred_1 obj_08 obj_02)
    (pred_6 obj_11 obj_03)
    (pred_6 obj_07 obj_02)
    (pred_6 obj_03 obj_01)
    (pred_6 obj_01 obj_05)
    (pred_6 obj_05 obj_07)
)
 (:goal
  (and
   (pred_3 obj_10)
   (pred_3 obj_08)
))
(:constraints
  (and
    (always (imply (not (pred_3 obj_10)) (not (pred_3 obj_08))))
    (forall (?m - type_2) (at-most-once (pred_1 ?m obj_11)))
  )
)
)
