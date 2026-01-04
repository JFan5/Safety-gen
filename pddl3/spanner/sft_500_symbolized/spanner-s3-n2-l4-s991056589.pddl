; params: python3 /home/fjl2401/Safety-gen/spanner/spanner-generator.py 3 2 4 --seed 991056589 --problem-name spanner-s3-n2-l4-s991056589
(define (problem spanner-s3-n2-l4-s991056589)
 (:domain spanner)
 (:objects 
     obj_04 - type_5
     obj_07 obj_10 obj_12 - type_1
     obj_02 obj_06 - type_4
     obj_05 obj_08 obj_09 obj_03 - type_3
     obj_11 obj_01 - type_3
    )
 (:init 
    (pred_4 obj_04 obj_11)
    (pred_4 obj_07 obj_03)
    (pred_1 obj_07)
    (pred_4 obj_10 obj_09)
    (pred_1 obj_10)
    (pred_4 obj_12 obj_08)
    (pred_1 obj_12)
    (pred_6 obj_02)
    (pred_4 obj_02 obj_01)
    (pred_6 obj_06)
    (pred_4 obj_06 obj_01)
    (pred_3 obj_11 obj_05)
    (pred_3 obj_03 obj_01)
    (pred_3 obj_05 obj_08)
    (pred_3 obj_08 obj_09)
    (pred_3 obj_09 obj_03)
)
 (:goal
  (and
   (pred_5 obj_02)
   (pred_5 obj_06)
))
(:constraints
  (and
    (always (imply (not (pred_5 obj_02)) (not (pred_5 obj_06))))
    (forall (?m - type_5) (at-most-once (pred_4 ?m obj_11)))
  )
)
)
