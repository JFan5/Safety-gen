; params: python3 /home/fjl2401/Safety-gen/spanner/spanner-generator.py 3 3 4 --seed 1199600675 --problem-name spanner-s3-n3-l4-s1199600675
(define (problem spanner-s3-n3-l4-s1199600675)
 (:domain spanner)
 (:objects 
     obj_09 - type_1
     obj_02 obj_07 obj_13 - type_3
     obj_08 obj_01 obj_06 - type_2
     obj_10 obj_04 obj_11 obj_12 - type_4
     obj_05 obj_03 - type_4
    )
 (:init 
    (pred_1 obj_09 obj_05)
    (pred_1 obj_02 obj_10)
    (pred_5 obj_02)
    (pred_1 obj_07 obj_12)
    (pred_5 obj_07)
    (pred_1 obj_13 obj_10)
    (pred_5 obj_13)
    (pred_4 obj_08)
    (pred_1 obj_08 obj_03)
    (pred_4 obj_01)
    (pred_1 obj_01 obj_03)
    (pred_4 obj_06)
    (pred_1 obj_06 obj_03)
    (pred_6 obj_05 obj_10)
    (pred_6 obj_12 obj_03)
    (pred_6 obj_10 obj_04)
    (pred_6 obj_04 obj_11)
    (pred_6 obj_11 obj_12)
)
 (:goal
  (and
   (pred_2 obj_08)
   (pred_2 obj_01)
   (pred_2 obj_06)
))
(:constraints
  (and
    (always (imply (not (pred_2 obj_08)) (not (pred_2 obj_01))))
    (forall (?m - type_1) (at-most-once (pred_1 ?m obj_05)))
  )
)
)
