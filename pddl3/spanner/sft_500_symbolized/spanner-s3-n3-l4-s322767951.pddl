; params: python3 /home/fjl2401/Safety-gen/spanner/spanner-generator.py 3 3 4 --seed 322767951 --problem-name spanner-s3-n3-l4-s322767951
(define (problem spanner-s3-n3-l4-s322767951)
 (:domain spanner)
 (:objects 
     obj_04 - type_1
     obj_13 obj_01 obj_07 - type_2
     obj_10 obj_05 obj_06 - type_3
     obj_09 obj_08 obj_11 obj_02 - type_5
     obj_12 obj_03 - type_5
    )
 (:init 
    (pred_6 obj_04 obj_12)
    (pred_6 obj_13 obj_08)
    (pred_4 obj_13)
    (pred_6 obj_01 obj_02)
    (pred_4 obj_01)
    (pred_6 obj_07 obj_08)
    (pred_4 obj_07)
    (pred_3 obj_10)
    (pred_6 obj_10 obj_03)
    (pred_3 obj_05)
    (pred_6 obj_05 obj_03)
    (pred_3 obj_06)
    (pred_6 obj_06 obj_03)
    (pred_5 obj_12 obj_09)
    (pred_5 obj_02 obj_03)
    (pred_5 obj_09 obj_08)
    (pred_5 obj_08 obj_11)
    (pred_5 obj_11 obj_02)
)
 (:goal
  (and
   (pred_1 obj_10)
   (pred_1 obj_05)
   (pred_1 obj_06)
))
(:constraints
  (and
    (always (imply (not (pred_1 obj_10)) (not (pred_1 obj_05))))
    (forall (?m - type_1) (at-most-once (pred_6 ?m obj_12)))
  )
)
)
