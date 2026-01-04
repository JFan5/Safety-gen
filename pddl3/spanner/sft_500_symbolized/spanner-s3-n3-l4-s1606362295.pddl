; params: python3 /home/fjl2401/Safety-gen/spanner/spanner-generator.py 3 3 4 --seed 1606362295 --problem-name spanner-s3-n3-l4-s1606362295
(define (problem spanner-s3-n3-l4-s1606362295)
 (:domain spanner)
 (:objects 
     obj_06 - type_1
     obj_05 obj_03 obj_12 - type_2
     obj_13 obj_07 obj_08 - type_3
     obj_11 obj_09 obj_02 obj_04 - type_4
     obj_10 obj_01 - type_4
    )
 (:init 
    (pred_2 obj_06 obj_10)
    (pred_2 obj_05 obj_11)
    (pred_4 obj_05)
    (pred_2 obj_03 obj_04)
    (pred_4 obj_03)
    (pred_2 obj_12 obj_02)
    (pred_4 obj_12)
    (pred_3 obj_13)
    (pred_2 obj_13 obj_01)
    (pred_3 obj_07)
    (pred_2 obj_07 obj_01)
    (pred_3 obj_08)
    (pred_2 obj_08 obj_01)
    (pred_1 obj_10 obj_11)
    (pred_1 obj_04 obj_01)
    (pred_1 obj_11 obj_09)
    (pred_1 obj_09 obj_02)
    (pred_1 obj_02 obj_04)
)
 (:goal
  (and
   (pred_5 obj_13)
   (pred_5 obj_07)
   (pred_5 obj_08)
))
(:constraints
  (and
    (always (imply (not (pred_5 obj_13)) (not (pred_5 obj_07))))
    (forall (?m - type_1) (at-most-once (pred_2 ?m obj_10)))
  )
)
)
