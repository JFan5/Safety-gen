; params: python3 /home/fjl2401/Safety-gen/spanner/spanner-generator.py 3 3 4 --seed 1606362295 --problem-name spanner-s3-n3-l4-s1606362295
(define (problem spanner-s3-n3-l4-s1606362295)
 (:domain spanner)
 (:objects 
     obj_09 - type_4
     obj_10 obj_01 obj_08 - type_1
     obj_12 obj_07 obj_06 - type_3
     obj_02 obj_13 obj_05 obj_11 - type_5
     obj_04 obj_03 - type_5
    )
 (:init 
    (pred_4 obj_09 obj_04)
    (pred_4 obj_10 obj_02)
    (pred_2 obj_10)
    (pred_4 obj_01 obj_11)
    (pred_2 obj_01)
    (pred_4 obj_08 obj_05)
    (pred_2 obj_08)
    (pred_3 obj_12)
    (pred_4 obj_12 obj_03)
    (pred_3 obj_07)
    (pred_4 obj_07 obj_03)
    (pred_3 obj_06)
    (pred_4 obj_06 obj_03)
    (pred_5 obj_04 obj_02)
    (pred_5 obj_11 obj_03)
    (pred_5 obj_02 obj_13)
    (pred_5 obj_13 obj_05)
    (pred_5 obj_05 obj_11)
)
 (:goal
  (and
   (pred_6 obj_12)
   (pred_6 obj_07)
   (pred_6 obj_06)
))
(:constraints
  (and
    (always (imply (not (pred_6 obj_12)) (not (pred_6 obj_07))))
    (forall (?m - type_4) (at-most-once (pred_4 ?m obj_04)))
  )
)
)
