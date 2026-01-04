; params: python3 /home/fjl2401/Safety-gen/spanner/spanner-generator.py 3 3 4 --seed 1332270079 --problem-name spanner-s3-n3-l4-s1332270079
(define (problem spanner-s3-n3-l4-s1332270079)
 (:domain spanner)
 (:objects 
     obj_05 - type_3
     obj_12 obj_02 obj_09 - type_4
     obj_08 obj_04 obj_06 - type_2
     obj_07 obj_11 obj_03 obj_01 - type_1
     obj_10 obj_13 - type_1
    )
 (:init 
    (pred_5 obj_05 obj_10)
    (pred_5 obj_12 obj_03)
    (pred_1 obj_12)
    (pred_5 obj_02 obj_01)
    (pred_1 obj_02)
    (pred_5 obj_09 obj_03)
    (pred_1 obj_09)
    (pred_4 obj_08)
    (pred_5 obj_08 obj_13)
    (pred_4 obj_04)
    (pred_5 obj_04 obj_13)
    (pred_4 obj_06)
    (pred_5 obj_06 obj_13)
    (pred_6 obj_10 obj_07)
    (pred_6 obj_01 obj_13)
    (pred_6 obj_07 obj_11)
    (pred_6 obj_11 obj_03)
    (pred_6 obj_03 obj_01)
)
 (:goal
  (and
   (pred_2 obj_08)
   (pred_2 obj_04)
   (pred_2 obj_06)
))
(:constraints
  (and
    (always (imply (not (pred_2 obj_04)) (not (pred_2 obj_06))))
    (forall (?m - type_3) (at-most-once (pred_5 ?m obj_10)))
  )
)
)
