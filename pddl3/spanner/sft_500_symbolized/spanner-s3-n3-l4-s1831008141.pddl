; params: python3 /home/fjl2401/Safety-gen/spanner/spanner-generator.py 3 3 4 --seed 1831008141 --problem-name spanner-s3-n3-l4-s1831008141
(define (problem spanner-s3-n3-l4-s1831008141)
 (:domain spanner)
 (:objects 
     obj_05 - type_2
     obj_08 obj_12 obj_10 - type_1
     obj_01 obj_09 obj_07 - type_3
     obj_03 obj_04 obj_13 obj_06 - type_5
     obj_11 obj_02 - type_5
    )
 (:init 
    (pred_1 obj_05 obj_11)
    (pred_1 obj_08 obj_13)
    (pred_4 obj_08)
    (pred_1 obj_12 obj_13)
    (pred_4 obj_12)
    (pred_1 obj_10 obj_13)
    (pred_4 obj_10)
    (pred_5 obj_01)
    (pred_1 obj_01 obj_02)
    (pred_5 obj_09)
    (pred_1 obj_09 obj_02)
    (pred_5 obj_07)
    (pred_1 obj_07 obj_02)
    (pred_2 obj_11 obj_03)
    (pred_2 obj_06 obj_02)
    (pred_2 obj_03 obj_04)
    (pred_2 obj_04 obj_13)
    (pred_2 obj_13 obj_06)
)
 (:goal
  (and
   (pred_3 obj_01)
   (pred_3 obj_09)
   (pred_3 obj_07)
))
(:constraints
  (and
    (always (imply (not (pred_3 obj_09)) (not (pred_3 obj_07))))
    (forall (?m - type_2) (at-most-once (pred_1 ?m obj_11)))
  )
)
)
