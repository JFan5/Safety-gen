; params: python3 /home/fjl2401/Safety-gen/spanner/spanner-generator.py 3 2 4 --seed 991056589 --problem-name spanner-s3-n2-l4-s991056589
(define (problem spanner-s3-n2-l4-s991056589)
 (:domain spanner)
 (:objects 
     obj_12 - type_5
     obj_11 obj_09 obj_06 - type_3
     obj_07 obj_01 - type_1
     obj_04 obj_10 obj_08 obj_03 - type_2
     obj_05 obj_02 - type_2
    )
 (:init 
    (pred_6 obj_12 obj_05)
    (pred_6 obj_11 obj_03)
    (pred_5 obj_11)
    (pred_6 obj_09 obj_08)
    (pred_5 obj_09)
    (pred_6 obj_06 obj_10)
    (pred_5 obj_06)
    (pred_4 obj_07)
    (pred_6 obj_07 obj_02)
    (pred_4 obj_01)
    (pred_6 obj_01 obj_02)
    (pred_3 obj_05 obj_04)
    (pred_3 obj_03 obj_02)
    (pred_3 obj_04 obj_10)
    (pred_3 obj_10 obj_08)
    (pred_3 obj_08 obj_03)
)
 (:goal
  (and
   (pred_1 obj_07)
   (pred_1 obj_01)
))
(:constraints
  (and
    (always (imply (not (pred_1 obj_07)) (not (pred_1 obj_01))))
    (forall (?m - type_5) (at-most-once (pred_6 ?m obj_05)))
  )
)
)
