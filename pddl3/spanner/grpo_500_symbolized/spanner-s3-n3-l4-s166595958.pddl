; params: python3 /home/fjl2401/Safety-gen/spanner/spanner-generator.py 3 3 4 --seed 166595958 --problem-name spanner-s3-n3-l4-s166595958
(define (problem spanner-s3-n3-l4-s166595958)
 (:domain spanner)
 (:objects 
     obj_10 - type_4
     obj_08 obj_07 obj_02 - type_5
     obj_01 obj_11 obj_03 - type_1
     obj_06 obj_12 obj_09 obj_04 - type_3
     obj_13 obj_05 - type_3
    )
 (:init 
    (pred_3 obj_10 obj_13)
    (pred_3 obj_08 obj_06)
    (pred_1 obj_08)
    (pred_3 obj_07 obj_09)
    (pred_1 obj_07)
    (pred_3 obj_02 obj_09)
    (pred_1 obj_02)
    (pred_5 obj_01)
    (pred_3 obj_01 obj_05)
    (pred_5 obj_11)
    (pred_3 obj_11 obj_05)
    (pred_5 obj_03)
    (pred_3 obj_03 obj_05)
    (pred_4 obj_13 obj_06)
    (pred_4 obj_04 obj_05)
    (pred_4 obj_06 obj_12)
    (pred_4 obj_12 obj_09)
    (pred_4 obj_09 obj_04)
)
 (:goal
  (and
   (pred_2 obj_01)
   (pred_2 obj_11)
   (pred_2 obj_03)
))
(:constraints
  (and
    (always (imply (not (pred_2 obj_01)) (not (pred_2 obj_11))))
    (forall (?m - type_4) (at-most-once (pred_3 ?m obj_13)))
  )
)
)
