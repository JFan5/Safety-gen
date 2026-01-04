; params: python3 /home/fjl2401/Safety-gen/spanner/spanner-generator.py 3 3 4 --seed 378094160 --problem-name spanner-s3-n3-l4-s378094160
(define (problem spanner-s3-n3-l4-s378094160)
 (:domain spanner)
 (:objects 
     obj_05 - type_5
     obj_02 obj_09 obj_03 - type_4
     obj_10 obj_12 obj_11 - type_2
     obj_01 obj_13 obj_04 obj_06 - type_3
     obj_07 obj_08 - type_3
    )
 (:init 
    (pred_1 obj_05 obj_07)
    (pred_1 obj_02 obj_01)
    (pred_5 obj_02)
    (pred_1 obj_09 obj_06)
    (pred_5 obj_09)
    (pred_1 obj_03 obj_01)
    (pred_5 obj_03)
    (pred_2 obj_10)
    (pred_1 obj_10 obj_08)
    (pred_2 obj_12)
    (pred_1 obj_12 obj_08)
    (pred_2 obj_11)
    (pred_1 obj_11 obj_08)
    (pred_4 obj_07 obj_01)
    (pred_4 obj_06 obj_08)
    (pred_4 obj_01 obj_13)
    (pred_4 obj_13 obj_04)
    (pred_4 obj_04 obj_06)
)
 (:goal
  (and
   (pred_3 obj_10)
   (pred_3 obj_12)
   (pred_3 obj_11)
))
(:constraints
  (and
    (always (imply (not (pred_3 obj_10)) (not (pred_3 obj_12))))
    (forall (?m - type_5) (at-most-once (pred_1 ?m obj_07)))
  )
)
)
