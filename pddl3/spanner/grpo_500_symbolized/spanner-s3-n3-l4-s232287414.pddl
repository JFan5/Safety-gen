; params: python3 /home/fjl2401/Safety-gen/spanner/spanner-generator.py 3 3 4 --seed 232287414 --problem-name spanner-s3-n3-l4-s232287414
(define (problem spanner-s3-n3-l4-s232287414)
 (:domain spanner)
 (:objects 
     obj_12 - type_4
     obj_10 obj_08 obj_03 - type_5
     obj_13 obj_06 obj_01 - type_1
     obj_05 obj_02 obj_07 obj_11 - type_3
     obj_04 obj_09 - type_3
    )
 (:init 
    (pred_3 obj_12 obj_04)
    (pred_3 obj_10 obj_02)
    (pred_1 obj_10)
    (pred_3 obj_08 obj_05)
    (pred_1 obj_08)
    (pred_3 obj_03 obj_07)
    (pred_1 obj_03)
    (pred_5 obj_13)
    (pred_3 obj_13 obj_09)
    (pred_5 obj_06)
    (pred_3 obj_06 obj_09)
    (pred_5 obj_01)
    (pred_3 obj_01 obj_09)
    (pred_4 obj_04 obj_05)
    (pred_4 obj_11 obj_09)
    (pred_4 obj_05 obj_02)
    (pred_4 obj_02 obj_07)
    (pred_4 obj_07 obj_11)
)
 (:goal
  (and
   (pred_2 obj_13)
   (pred_2 obj_06)
   (pred_2 obj_01)
))
(:constraints
  (and
    (always (imply (not (pred_2 obj_13)) (not (pred_2 obj_06))))
    (forall (?m - type_4) (at-most-once (pred_3 ?m obj_04)))
  )
)
)
