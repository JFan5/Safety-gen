; params: python3 /home/fjl2401/Safety-gen/spanner/spanner-generator.py 3 3 4 --seed 1148056202 --problem-name spanner-s3-n3-l4-s1148056202
(define (problem spanner-s3-n3-l4-s1148056202)
 (:domain spanner)
 (:objects 
     obj_04 - type_4
     obj_09 obj_05 obj_02 - type_5
     obj_01 obj_12 obj_13 - type_1
     obj_03 obj_06 obj_10 obj_08 - type_2
     obj_07 obj_11 - type_2
    )
 (:init 
    (pred_6 obj_04 obj_07)
    (pred_6 obj_09 obj_03)
    (pred_3 obj_09)
    (pred_6 obj_05 obj_03)
    (pred_3 obj_05)
    (pred_6 obj_02 obj_03)
    (pred_3 obj_02)
    (pred_4 obj_01)
    (pred_6 obj_01 obj_11)
    (pred_4 obj_12)
    (pred_6 obj_12 obj_11)
    (pred_4 obj_13)
    (pred_6 obj_13 obj_11)
    (pred_2 obj_07 obj_03)
    (pred_2 obj_08 obj_11)
    (pred_2 obj_03 obj_06)
    (pred_2 obj_06 obj_10)
    (pred_2 obj_10 obj_08)
)
 (:goal
  (and
   (pred_1 obj_01)
   (pred_1 obj_12)
   (pred_1 obj_13)
))
(:constraints
  (and
    (always (imply (not (pred_1 obj_01)) (not (pred_1 obj_12))))
    (forall (?m - type_4) (at-most-once (pred_6 ?m obj_07)))
  )
)
)
