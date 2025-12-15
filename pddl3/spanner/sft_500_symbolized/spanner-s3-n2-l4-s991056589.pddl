; params: python3 /home/fjl2401/Safety-gen/spanner/spanner-generator.py 3 2 4 --seed 991056589 --problem-name spanner-s3-n2-l4-s991056589
(define (problem spanner-s3-n2-l4-s991056589)
 (:domain spanner)
 (:objects 
     obj_10 - type_1
     obj_06 obj_04 obj_11 - type_5
     obj_02 obj_03 - type_4
     obj_01 obj_12 obj_08 obj_05 - type_2
     obj_07 obj_09 - type_2
    )
 (:init 
    (pred_3 obj_10 obj_07)
    (pred_3 obj_06 obj_05)
    (pred_5 obj_06)
    (pred_3 obj_04 obj_08)
    (pred_5 obj_04)
    (pred_3 obj_11 obj_12)
    (pred_5 obj_11)
    (pred_6 obj_02)
    (pred_3 obj_02 obj_09)
    (pred_6 obj_03)
    (pred_3 obj_03 obj_09)
    (pred_4 obj_07 obj_01)
    (pred_4 obj_05 obj_09)
    (pred_4 obj_01 obj_12)
    (pred_4 obj_12 obj_08)
    (pred_4 obj_08 obj_05)
)
 (:goal
  (and
   (pred_1 obj_02)
   (pred_1 obj_03)
))
(:constraints
  (and
    (always (imply (not (pred_1 obj_02)) (not (pred_1 obj_03))))
    (forall (?m - type_1) (at-most-once (pred_3 ?m obj_07)))
  )
)
)
