; params: python3 /home/fjl2401/Safety-gen/spanner/spanner-generator.py 3 3 4 --seed 1266159767 --problem-name spanner-s3-n3-l4-s1266159767
(define (problem spanner-s3-n3-l4-s1266159767)
 (:domain spanner)
 (:objects 
     obj_05 - type_5
     obj_01 obj_04 obj_02 - type_1
     obj_13 obj_08 obj_06 - type_2
     obj_07 obj_03 obj_09 obj_12 - type_4
     obj_11 obj_10 - type_4
    )
 (:init 
    (pred_1 obj_05 obj_11)
    (pred_1 obj_01 obj_07)
    (pred_4 obj_01)
    (pred_1 obj_04 obj_03)
    (pred_4 obj_04)
    (pred_1 obj_02 obj_07)
    (pred_4 obj_02)
    (pred_3 obj_13)
    (pred_1 obj_13 obj_10)
    (pred_3 obj_08)
    (pred_1 obj_08 obj_10)
    (pred_3 obj_06)
    (pred_1 obj_06 obj_10)
    (pred_5 obj_11 obj_07)
    (pred_5 obj_12 obj_10)
    (pred_5 obj_07 obj_03)
    (pred_5 obj_03 obj_09)
    (pred_5 obj_09 obj_12)
)
 (:goal
  (and
   (pred_6 obj_13)
   (pred_6 obj_08)
   (pred_6 obj_06)
))
(:constraints
  (and
    (always (imply (not (pred_6 obj_13)) (not (pred_6 obj_08))))
    (forall (?m - type_5) (at-most-once (pred_1 ?m obj_11)))
  )
)
)
