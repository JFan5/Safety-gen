; params: python3 /home/fjl2401/Safety-gen/spanner/spanner-generator.py 3 2 4 --seed 1827418318 --problem-name spanner-s3-n2-l4-s1827418318
(define (problem spanner-s3-n2-l4-s1827418318)
 (:domain spanner)
 (:objects 
     obj_09 - type_5
     obj_10 obj_08 obj_04 - type_3
     obj_05 obj_07 - type_1
     obj_06 obj_03 obj_11 obj_02 - type_2
     obj_01 obj_12 - type_2
    )
 (:init 
    (pred_6 obj_09 obj_01)
    (pred_6 obj_10 obj_03)
    (pred_5 obj_10)
    (pred_6 obj_08 obj_11)
    (pred_5 obj_08)
    (pred_6 obj_04 obj_03)
    (pred_5 obj_04)
    (pred_4 obj_05)
    (pred_6 obj_05 obj_12)
    (pred_4 obj_07)
    (pred_6 obj_07 obj_12)
    (pred_3 obj_01 obj_06)
    (pred_3 obj_02 obj_12)
    (pred_3 obj_06 obj_03)
    (pred_3 obj_03 obj_11)
    (pred_3 obj_11 obj_02)
)
 (:goal
  (and
   (pred_1 obj_05)
   (pred_1 obj_07)
))
(:constraints
  (and
    (always (imply (not (pred_1 obj_05)) (not (pred_1 obj_07))))
    (forall (?m - type_5) (at-most-once (pred_6 ?m obj_01)))
  )
)
)
